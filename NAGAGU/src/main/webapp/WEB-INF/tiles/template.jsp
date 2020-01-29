<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html> 
<html> 
	<head> 
		<meta charset="UTF-8"> 
	</head> 
	<body> 
	<%-- 
		<div id="header"><tiles:insertAttribute name="header" /></div> 
		<div id="body"><tiles:insertAttribute name="body" ignore="true" /></div> 
		<div id="footer"><tiles:insertAttribute name="footer" /></div> 
	--%> 
		<tiles:insertAttribute name="header" /> 
		<tiles:insertAttribute name="body" ignore="true" /> 
		<tiles:insertAttribute name="footer" /> 
		
	</body> 
</html>

