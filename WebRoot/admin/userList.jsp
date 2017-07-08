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

<title>My JSP 'userList.jsp' starting page</title>

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
#userList {
	margin-top: 10px;
}
</style>
</head>

<body>
	<div id="add">
		<input class="btn btn-default" type="button" value="新增用户"
			onclick="addUser()">
	</div>
	<div class="container" id="userList">
		<table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>头像</th>
					<th>登录名</th>
					<th>密码</th>
					<th>邮箱</th>
					<th>注册日期</th>
					<th>余额</th>
					<th>积分</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="condition.list.size!=0">
					<s:iterator value="condition.list" var="user" status="status">
						<tr>
							<td><s:property value="#user.userid" /></td>
							<td><label id="imglab" title="点击图片查看大图" for="avatar"><a
									href="javascript:onclick=showBigPicture('<s:property value='#user.avatar'/>')"
									class="thumbnail" style="width:40px;height:40px;" id="avatar"><img
										src="<s:property value='#user.avatar'/>"> </a></label></td>
							<td><s:property value="#user.name" /></td>
							<td><s:property value="#user.pwd" /></td>
							<td><s:property value="#user.email" /></td>
							<td><s:property value="#user.regdate" /></td>
							<td><s:property value="#user.money" /></td>
							<td><s:property value="#user.score" /></td>
							<td><a
								href="javascript:onclick=to_del('<s:property value="#user.userid"/>','<s:property value="#user.name"/>')"
								class="tablelink"> 删除</a> <a
								href="user_getUserById?user.userid=<s:property value='#user.userid'/>"
								class="tablelink"> 更新</a></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><h3>无数据</h3></td>
				</s:else>
			</tbody>
		</table>
		<br>
		<div style="padding-left: 30%;">
			<mp:page pageIndex="${requestScope.pageIndex}"
				url="user_getUsersList?" pageMax="${requestScope.totalPage}" />
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		function addUser() {
			location.href = "admin/addUser.jsp";
		}
		function to_del(userid, name) {
			layer.confirm("您确定要删除:【" + name + "】用户吗？", function(index) {
				layer.close(index);
				location.href = "user_delUser?user.userid=" + userid;
			});
		}
		function showBigPicture(img) {
			layer.open({
				type : 2,
				shadeClose : true,
				shade : 0.5,
				area : [ '500px', '500px' ],
				content : "goods_getGoodsPicture?goods.img= " + img
			});
		}
	</script>
</body>
</html>