EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'Database Mail XPs', 1;
RECONFIGURE;

DECLARE @HTML NVARCHAR(MAX) = '';

SET @HTML = 
N'<html>
<head>
<style>
table { border-collapse: collapse; width: 100%; font-family: Arial; }
th, td { border: 1px solid #ddd; padding: 8px; }
th { background-color: #f2f2f2; text-align: left; }
</style>
</head>
<body>
<h3>Index Metadata Report</h3>
<table>
<tr>
<th>Table Name</th>
<th>Index Name</th>
<th>Index Type</th>
<th>Column Name</th>
</tr>';

SELECT @HTML += 
    '<tr>' +
    '<td>' + s.name + '.' + t.name + '</td>' +
    '<td>' + i.name + '</td>' +
    '<td>' + i.type_desc + '</td>' +
    '<td>' + c.name + '</td>' +
    '</tr>'
FROM sys.indexes i
JOIN sys.tables t ON i.object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE i.is_hypothetical = 0;

SET @HTML += '</table></body></html>';


EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'DBMailProfile',             
    @recipients = 'positiveprogrammerr@gmail.com',          
    @subject = 'SQL Server Index Metadata Report',
    @body = @HTML,                              
    @body_format = 'HTML';

