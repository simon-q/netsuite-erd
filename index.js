const fs = require('fs');
const cheerio = require('cheerio');
const { dirname } = require('path');

const INDENT = '    ';
let output = '';

// TODO: loop all files in a dir /record
const fileName = 'record/account.html';
// const fileName = 'record/account_activity.html';
// const dirName = 'record';

// const files = fs.readdirSync(dirName);
// files.forEach(processFile);

// const processFile = (fileName) => {
//     const buffer = fs.readFileSync(dirName + '/' + fileName);
//     const htmlString = buffer.toString();
//     const $ = cheerio.load(htmlString);
// }


fs.readFile(fileName, (err, data) => {
    
    if (err) {
        throw err;
    }

    if (!data) {
        throw 'no data';
    }

    const $ = cheerio.load(data.toString());

    // table
    const tableName = $('h1').text().trim();
    
    // columns
    const columnsHeader = $('h2').filter((_, el) => $(el).text().indexOf('Columns') !== -1);
    const columnsTable = columnsHeader.next();
    const columns = columnsTable.find('tr[id^="field"]');
    const primaryKeyColumns = columns.filter('.primaryKeyField');

    // references
    const referencesHeader = $('h2').filter((_, el) => $(el).find('span').hasClass('foreignKeyColor'));
    const referencesTable = referencesHeader.next();
    const references = referencesTable.find('tr').slice(1);

    // create column definitions
    let tableDefinitions = '';
    columns.each((index, el) => {

        // indent
        tableDefinitions += INDENT;

        // name
        const columnName = $(el).find('td.rt_fname').text().trim();
        tableDefinitions += columnName;

        // type
        let columnType = $(el).find('td.rt_ftype').text().trim();

        // NUMBER
        if (columnType === 'NUMBER') {
            const columnTypePrecision = $(el).find('td.rt_fprecision').text().trim();
            const columnTypeScale = $(el).find('td.rt_fscale').text().trim();
            columnType = 'NUMERIC';
            if (columnTypePrecision) {
                columnType += '(' + columnTypePrecision
                if (columnTypeScale) {
                    columnType += ', ' + columnTypeScale;
                }
                columnType += ')';
            }
        }
        
        // VARCHAR2
        if (columnType === 'VARCHAR2') {
            columnType = 'VARCHAR';
            const columnTypeLength = $(el).find('td.rt_flength').text().trim();
            if (columnTypeLength) {
                columnType += '(' + columnTypeLength +')';
            }
        }

        // TIMESTAMP
        // no need to do anything

        tableDefinitions += ' ' + columnType;

        // PRIMARY KEY (single)
        // We deal with composite primary keys later.
        if (primaryKeyColumns.length === 1 && $(el).hasClass('primaryKeyField')) {
            tableDefinitions += ' PRIMARY KEY';
        }

        // REFERENCES
        // All foreign keys will be generated as a reference to a single column.
        // Composite foreign keys are not supported as they don't seem to be present in the original schema.
        // TODO: sanity check for composite foreign keys to verify the assumption
        const referenceRow = references.filter((_, el) => {
            const fkColumnName = $(el).find('td.rt_tfkcolumn_name').text().trim();
            return fkColumnName === columnName;
        })
        if (referenceRow.length) {
            const referenceTableName = referenceRow.find('td.rt_tpktable_name a').text().trim();
            const referenceColumnName = referenceRow.find('td.rt_tpkcolumn_name').text().trim();
            tableDefinitions += ' REFERENCES ' + referenceTableName + ' (' + referenceColumnName + ')';
        }
        
        // newline
        if (index !== columns.length - 1) {
            tableDefinitions += ',\n';
        }
    });

    // PRIMARY KEY (composite)
    if (primaryKeyColumns.length > 1) {
        
        tableDefinitions += ',\n';

        let primaryKeyColumnNames = [];
        columns.each((_, el) => {
            const columnName = $(el).find('td.rt_fname').text().trim();
            primaryKeyColumnNames.push(columnName);
        });

        tableDefinitions += INDENT + 'PRIMARY KEY (' + primaryKeyColumnNames.join(', ') + ')';
    }

    tableDefinitions += '\n';

    // TODO: some other stuff ...
    
    // output
    fs.writeFileSync('out.sql', 
        'CREATE TABLE ' +
        tableName +
        ' (\n' +
        tableDefinitions +
        ');\n\n'
    );
});
