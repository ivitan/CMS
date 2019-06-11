<%
set rs=server.CreateObject("adodb.recordset")
db="search.mdb"
set conn=server.CreateObject("adodb.connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.open connstr
%>