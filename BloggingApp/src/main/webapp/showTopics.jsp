<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShowTopics</title>
</head>
<body>
		<ol>
			<c:forEach var="single" items="${topics}">
			
			<a href="getcomment?topicid=${single.getTopicid()}" >
				<ul> ${single.getName()}</ul>
			</a>
			
			</c:forEach>
		
		</ol>
		
		<ol>
			<c:forEach var="com" items="${comments}">
			
			
				<ul> ${com.getText()}</ul>
			
			
			</c:forEach>
		
		</ol>
		
</body>
</html>