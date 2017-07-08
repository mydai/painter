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

<title>My JSP 'goodsList.jsp' starting page</title>

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
		<input class="btn btn-default" type="button" value="新增商品"
			onclick="addGoods()">
	</div>
	<div class="container" id="goodsList">
		<table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>画名</th>
					<th>缩略图</th>
					<th>画作类型</th>
					<th>价格</th>
					<th>积分</th>
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
							<td><label id="imglab" title="点击图片查看大图" for="img"><a
									href="javascript:onclick=showBigPicture('<s:property value='#goods.img'/>')"
									class="thumbnail" style="width:40px;height:40px;" id="img"><img
										src="<s:property value='#goods.img'/>" alt="图片"> </a></label></td>
							<td><s:property value="#goods.goodstype.name" /></td>
							<td><s:property value="#goods.price" /></td>
							<td><s:property value="#goods.score" /></td>
							<td><s:property value="#goods.salnum" /></td>
							<td><a
								href="javascript:onclick=to_del('<s:property value="#goods.goodsid"/>','<s:property value="#goods.name"/>')"
								class="tablelink"> 删除</a> <a
								href="goods_findGoods?goods.goodsid=<s:property value='#goods.goodsid'/>"
								class="tablelink"> 更新</a></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
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
				url="goods_findPainterGoods?" pageMax="${requestScope.totalPage}" />
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>

	<script type="text/javascript">
		function addGoods() {
			location.href = "painterBg/addGoods.jsp";
		}
		function to_del(goodsid, name) {
			layer.confirm("您确定要删除:【" + name + "】作品吗？", function(index) {
				layer.close(index);
				location.href = "goods_deleteGoods?goods.goodsid=" + goodsid;
			});
		}
		function showBigPicture(img) {
			layer.open({
				type : 2,
				title : '画作预览',
				shadeClose : true,
				shade : 0.5,
				area : [ '500px', '500px' ],
				content : "goods_getGoodsPicture?goods.img= " + img
			});
		}
	</script>
</body>
</html>