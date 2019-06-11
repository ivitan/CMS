<!--#include file="adoconn.asp"-->
<% 
 Response.ContentType="text/xml"
 search=Trim(request("search"))
 sql="select top 10 [name] from search where [name] like '"&search&"%' order by [id]"
 rs.open sql,conn,1,1  
 str="<?xml version=""1.0"" encoding=""gb2312""?>"&vbnewline
  str=str&"<root>"&vbnewline
 If rs.eof Then  
 Else
  i=1
  Do While Not rs.eof
   str=str&"<message id="""&i&""">"&vbnewline  
   str=str&"  <text>"&rs("name")&"</text>"&vbnewline
   str=str&"</message>"&vbnewline
  i=i+1
  rs.movenext
  loop
  End If  
  str=str&"</root>"
  rs.close
  response.write str
%>