To address these issues, always include proper exception handling mechanisms in your code. In many programming languages, you can use try-catch blocks to gracefully handle exceptions that may arise during database operations.  When dealing with multiple database operations that must be treated as a single unit of work, properly utilize transactions.  Ensure that your database operations are encapsulated within a transaction block, and that the transaction is rolled back if any of the operations fail.  Always commit transactions only after successful completion of all operations. This helps ensure data consistency and prevents data corruption.  For efficient queries, ensure that indexes are used effectively and optimize the queries themselves, removing unnecessary operations. In addition, ensure sufficient resources are available to the database server.

```sql
-- Correct transaction handling
BEGIN TRANSACTION;
SAVEPOINT my_savepoint;
--Operation 1
INSERT INTO table1 (id, value) VALUES (1, 'somevalue');
--Operation 2
BEGIN TRY
    INSERT INTO table2 (id, value) VALUES (1, 'anothervalue'); -- Might fail
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@ERROR = 0
    COMMIT TRANSACTION;
```