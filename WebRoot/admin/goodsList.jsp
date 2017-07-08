<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'goodslist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="admin_bootstrap/css/bootstrap.min.css" />
<style type="text/css">
#goodsList {
	margin-top: 10px;
}
</style>

</head>

<body>
	<div class="container" id="goodsList">
		<table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>画名</th>
					<th>缩略图</th>
					<th>画作类型</th>
					<th>画师</th>
					<th>价格</th>
					<th>积分</th>
					<th>路径</th>
					<th>销售量</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="condition.list.size!=0">
					<s:iterator value="condition.list" var="goods" status="status">
						<tr>
							<td><s:property value="#goods.goodsid" /></td>
							<td><s:property value="#goods.name" /></td>
							<td><s:property value="#goods.goodstype.name" /></td>
							<td><label id="imglab" title="点击图片查看大图" for="img"
								class="box"><a
									href="javascript:onclick=showBigPicture('<s:property value='#goods.img'/>')"
									class="thumbnail" style="width:40px;height:40px;" id="img"><img
										src="<s:property value='#goods.img'/>"> </a></label></td>
							<td><s:property value="#goods.painter.name" /></td>
							<td><s:property value="#goods.price" /></td>
							<td><s:property value="#goods.score" /></td>
							<td><s:property value="#goods.img" /></td>
							<td><s:property value="#goods.salnum" /></td>
							<td><a
								href="javascript:onclick=showBigPicture('<s:property value='#goods.img'/>')"
								class="tablelink">查看作品大图</a>
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
				url="goods_getGoodsList?" pageMax="${requestScope.totalPage}" />
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".click").click(function() {
				$(".tip").fadeIn(200);
			});

			$(".tiptop a").click(function() {
				$(".tip").fadeOut(200);
			});

			$(".sure").click(function() {
				$(".tip").fadeOut(100);
			});

			$(".cancel").click(function() {
				$(".tip").fadeOut(100);
			});
		});

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