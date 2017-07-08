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

<title>My JSP 'painterList.jsp' starting page</title>

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
	<div>
		<input class="btn btn-default" type="button" value="新增画师"
			onclick="addPainter()">
	</div>
	<div class="container" id="userList">
		<table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>头像</th>
					<th>姓名</th>
					<th>密码</th>
					<th>余额</th>
					<th>积分</th>
					<th>日期</th>
					<th>介绍</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="condition.list.size!=0">
					<s:iterator value="condition.list" var="painter" status="status">
						<tr>
							<td><s:property value="#painter.painterid" /></td>
							<td><label id="imglab" title="点击图片查看大图" for="img"><a
									href="javascript:onclick=showBigPicture('<s:property value='#painter.img'/>')"
									class="thumbnail" style="width:40px;height:40px;" id="img"><img
										src="<s:property value='#painter.img'/>"> </a></label></td>
							<td><s:property value="#painter.name" /></td>
							<td><s:property value="#painter.pwd" /></td>
							<td><s:property value="#painter.money" /></td>
							<td><s:property value="#painter.score" /></td>
							<td><s:property value="#painter.hiredate" /></td>
							<td><textarea rows="4" cols="20" disabled><s:property
										value="#painter.intro" /></textarea></td>
							<td><a
								href="javascript:onclick=to_del('<s:property value="#painter.painterid"/>','<s:property value="#painter.name"/>')"
								class="tablelink"> 删除</a><a
								href="painter_findPainter?painter.painterid=<s:property value='#painter.painterid'/>"
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
				url="painter_getPainterList?" pageMax="${requestScope.totalPage}" />
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		function addPainter() {
			location.href = "admin/addPainter.jsp";
		}
		function to_del(painter, name) {
			layer.confirm("您确定要删除:【" + name + "】画师吗？", function(index) {
				layer.close(index);
				location.href = "painter_deletePainter?painter.painterid="
						+ painter;
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