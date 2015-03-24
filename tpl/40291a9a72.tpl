<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[기초] foreach 활용 Debug</strong></span><br />
<pre><code class="c#">
foreach(DataTable table in dataSet.Tables)
{
    foreach(DataRow row in table.Rows)
    {
        foreach (DataColumn column in table.Columns)
        {
            Console.WriteLine(row[column]);
         }
     }
}
</code></pre>
</body>
</html>