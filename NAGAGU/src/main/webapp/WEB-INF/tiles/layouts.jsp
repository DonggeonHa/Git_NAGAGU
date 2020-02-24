<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html> 
<html> 
	<head> 
		<tiles:insertAttribute name="css" ignore="true" />
		<tiles:insertAttribute name="js" ignore="true" />
	</head> 
	<body class="order-body" style="position: relative;" data-spy="scroll" data-target=".nav-tabs" data-offset="50"> 
		<div style="display : flex; flex-direction:column; height: 100%;">
			<header>
				<tiles:insertAttribute name="header" ignore="true" />
			</header>
			<div style="flex: 1;">
				<tiles:insertAttribute name="body" ignore="true" />
			</div>
			<footer>
				<tiles:insertAttribute name="footer" ignore="true" />
			</footer>
		</div>		 
	</body>
</html>

