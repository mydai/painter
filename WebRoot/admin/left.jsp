<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="admin_bootstrap/css/bootstrap.min.css" />
<style type="text/css">
body {
	border-right: solid #D0D0D0 1px;
}

#left {
	margin-top: 0px;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="list-group" id="left">
			<a href="user_getUsersList" class="list-group-item" target="rightFrame"><b>用户列表</b></a>
			<a href="painter_getPainterList" class="list-group-item" target="rightFrame"><b>画师列表</b></a>
			<a href="goods_getGoodsList" class="list-group-item"
				target="rightFrame"><b>商品列表</b></a>
				<a href="dealinfo_getDealinfoList" class="list-group-item" target="rightFrame"><b>交易列表</b></a>
				<a href="contact_getContactList" class="list-group-item" target="rightFrame"><b>信息列表</b></a>
				<a href="admin/updateAdmin.jsp" class="list-group-item" target="rightFrame"><b>帐号管理</b></a>
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
</body>
</html>
