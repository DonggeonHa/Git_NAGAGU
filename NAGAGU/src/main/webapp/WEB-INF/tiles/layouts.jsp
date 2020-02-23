<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html> 
<html style="height: 100%;"> 
	<head> 
		<tiles:insertAttribute name="css" ignore="true" />
		<tiles:insertAttribute name="js" ignore="true" />
	</head> 
	<body class="order-body" style="margin: 0; height: 100; position: relative;" data-spy="scroll" data-target=".nav-tabs" data-offset="50"> 
		<div style="min-height: 100%;">
			<header>
				<tiles:insertAttribute name="header" ignore="true" />
			</header>
			<div style="min-height: calc(100vh);">
				<tiles:insertAttribute name="body" ignore="true" />
			</div>
			<footer>
				<tiles:insertAttribute name="footer" ignore="true" />
			</footer>
		</div>		 
	</body>
</html>

