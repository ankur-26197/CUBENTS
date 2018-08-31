<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testing JSON</title>
</head>
<body>

	<form action="GetActivity" method="get">
	
	<table cellspacing="5" border="0">
		<tr>
			<td align="right">Topic ID:</td>
			<td><input type="text" name="tid"></td>
		</tr>
		<tr>
			<td align="right">Activity ID:</td>
			<td><input type="text" name="aid"></td>
		</tr>
		
		<tr>
			<td></td>
			
			<td><br><input type="submit" value="Submit"></td>
		</tr>
		
	</table>

	</form>
</body>
</html>