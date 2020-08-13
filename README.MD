npm install
put html in record/ folder
node script.js
result will be in out.sql

Before running the query you might need to fix errors with incompatible types and foreign keys signature mismatches.

examples:

purchase_order_id is defined in Billing_subscription_lines as VARCHAR(138)
but then references Transactions (transaction_id) in billing_subscription_lines_transactions_fk
and transaction_id is defined as NUMERIC(39, 0)
so the types are incompatible
changing purchase_order_id to NUMERIC(39, 0) will fix it

table Group_test_cell has a composite primary key (crm_group_id, test_cell_id)
but a foreign key campaignevent_group_test_cell_fk references only test_cell_id
you need to either change the primary key or foreign key so that the columns match
the same for expense_plans_transaction_lines_fk and expense_plans_transaction_lines_fk_1
