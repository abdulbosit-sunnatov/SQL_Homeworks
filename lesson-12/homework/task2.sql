--Task 2

CREATE PROCEDURE GetProceduresAndFunctionsInfo
    @DatabaseName SYSNAME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX) = '';

    IF @DatabaseName IS NOT NULL
    BEGIN
        SET @SQL = '
        USE [' + @DatabaseName + '];
        SELECT
            ''' + @DatabaseName + ''' AS DatabaseName,
            SCHEMA_NAME(o.schema_id) AS SchemaName,
            o.name AS ObjectName,
            o.type_desc AS ObjectType,
            p.name AS ParameterName,
            TYPE_NAME(p.user_type_id) AS ParameterDataType,
            p.max_length AS MaxLength
        FROM sys.objects o
        LEFT JOIN sys.parameters p ON o.object_id = p.object_id
        WHERE o.type IN (''P'', ''FN'', ''IF'', ''TF'');';
    END
    ELSE
    BEGIN
        SELECT @SQL += '
        BEGIN TRY
            USE [' + name + '];
            SELECT
                ''' + name + ''' AS DatabaseName,
                SCHEMA_NAME(o.schema_id) AS SchemaName,
                o.name AS ObjectName,
                o.type_desc AS ObjectType,
                p.name AS ParameterName,
                TYPE_NAME(p.user_type_id) AS ParameterDataType,
                p.max_length AS MaxLength
            FROM sys.objects o
            LEFT JOIN sys.parameters p ON o.object_id = p.object_id
            WHERE o.type IN (''P'', ''FN'', ''IF'', ''TF'');
        END TRY
        BEGIN CATCH
            PRINT ''Skipping database [' + name + '] due to error.'';
        END CATCH;
        '
        FROM sys.databases
        WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb');
    END

    EXEC sp_executesql @SQL;
END;
