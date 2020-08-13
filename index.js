const fs = require('fs');
const cheerio = require('cheerio');

const INDENT = '    ';
let createTableOutput = '';
let alterTableOutput = '';

const dirName = 'record';
const files = fs.readdirSync(dirName);
files.forEach(processFile);

function processFile(fileName) {
    
    // load file
    const buffer = fs.readFileSync(dirName + '/' + fileName);
    const htmlString = buffer.toString();
    const $ = cheerio.load(htmlString);

    // get elements

    // table
    const tableName = $('h1').text().trim();
    
    // columns
    const columnsHeader = $('h2').filter((_, el) => $(el).text().indexOf('Columns') !== -1);
    const columnsTable = columnsHeader.next();
    const columns = columnsTable.find('tr[id^="field"]');
    const primaryKeyColumns = columns.filter('.primaryKeyField');

    // create definitions inside the table
    let tableDefinitions = '';

    // columns
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

        // TODO: sanity check for other types?
        // BOOLEAN is implemented as VARCHAR(1) right now

        tableDefinitions += ' ' + columnType;

        // PRIMARY KEY (single)
        // We deal with composite primary keys later.
        if (primaryKeyColumns.length === 1 && $(el).hasClass('primaryKeyField')) {
            tableDefinitions += ' PRIMARY KEY';
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
        primaryKeyColumns.each((_, el) => {
            const columnName = $(el).find('td.rt_fname').text().trim();
            primaryKeyColumnNames.push(columnName);
        });

        tableDefinitions += INDENT + 'PRIMARY KEY (' + primaryKeyColumnNames.join(', ') + ')';
    }

    tableDefinitions += '\n';

    // FOREIGN KEY
    const fkHeader = $('h2').filter((_, el) => $(el).find('span').hasClass('foreignKeyColor'));
    const fkTable = fkHeader.next();
    const fkRows = fkTable.find('tr').slice(1);
    
    // group all columns by the foreign key
    const foreignKeys = {};
    fkRows.each((_, el) => {
        const fkColumnName = $(el).find('td.rt_tfkcolumn_name').text().trim();
        const fkName = $(el).find('td.rt_tfk_name').text().trim();
        const referenceTableName = $(el).find('td.rt_tpktable_name a').text().trim();
        const referenceColumnName = $(el).find('td.rt_tpkcolumn_name').text().trim();
        if (!foreignKeys[fkName]) {
            foreignKeys[fkName] = {
                fkColumns: [],
                referenceColumns: []
            }
        }
        foreignKeys[fkName].fkColumns.push(fkColumnName);
        foreignKeys[fkName].referenceColumns.push(referenceColumnName);
        foreignKeys[fkName].referenceTableName = referenceTableName;
    });

    const constraints = Object.keys(foreignKeys).map((fkName) => {
        return 'ALTER TABLE ' + tableName + ' ADD CONSTRAINT ' +
            fkName +
            ' FOREIGN KEY (' + foreignKeys[fkName].fkColumns.join(', ') + ')' +
            ' REFERENCES ' + foreignKeys[fkName].referenceTableName +
            ' (' + foreignKeys[fkName].referenceColumns.join(', ') + ');\n';
        }
    );

    // add to output
    createTableOutput +=
        'CREATE TABLE ' +
        tableName +
        ' (\n' +
        tableDefinitions +
        ');\n\n';
    alterTableOutput += constraints.length ? constraints.join('') : '';
};

// output
fs.writeFileSync('out.sql', createTableOutput + alterTableOutput);
