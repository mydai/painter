<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/MyPage.tld" prefix="mp"%>

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

<title>My JSP 'showcontact.jsp' starting page</title>

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
#contactList {
	margin-top: 2%;
}
</style>
</head>

<body>
	<div class="container" id="contactList">
		<table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>姓名</th>
					<th>电话号码</th>
					<th>邮箱</th>
					<th>内容</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="condition.list.size!=0">
					<s:iterator value="condition.list" var="contact" status="status">
						<tr>
							<td><s:property value="#contact.contactid" /></td>
							<td><s:property value="#contact.name" /></td>
							<td><s:property value="#contact.tel" /></td>
							<td><s:property value="#contact.email" /></td>
							<td><s:property value="#contact.message" /></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<td></td>
					<td></td>
					<td><h3>无数据</h3></td>
				</s:else>
			</tbody>
		</table>
		<br>
		<div style="padding-left:30%;">

			<mp:page pageIndex="${requestScope.pageIndex}"
				url="contact_getContactList?" pageMax="${requestScope.totalPage}" />
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>