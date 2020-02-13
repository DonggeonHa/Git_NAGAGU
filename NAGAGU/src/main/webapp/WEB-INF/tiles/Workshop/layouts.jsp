<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html> 
<html> 
	<head> 
		<tiles:insertAttribute name="css" ignore="true" />
		<tiles:insertAttribute name="js" ignore="true" />
	</head> 
	<body> 
		<div id="page-wrapper">
			<tiles:insertAttribute name="Wsidebar" ignore="true" />
			
			<tiles:insertAttribute name="Windex" ignore="true" />
		</div>
	</body>
</html>

