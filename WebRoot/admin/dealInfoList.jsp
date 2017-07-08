<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/MyPage.tld" prefix="mp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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

<title>My JSP 'dealInfoList.jsp starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="admin_bootstrap/css/bootstrap.min.css" />
<style type="text/css">
#dealInfoList {
	margin-top: 10px;
}
</style>
</head>

<body>
	<div class="container" id="dealInfoList">
		<table class="table">
			<thead>
				<tr>
					<th>编号</th>
					<th>金额</th>
					<th>交易日期</th>
					<th>用户编号</th>
					<th>积分</th>
					<th>交易数量</th>
					<th>商品编号</th>
					<th>缩略图</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="condition.list.size!=0">
					<s:iterator value="condition.list" var="dealinfo" status="status">
						<tr>
							<td><s:property value="#dealinfo.dealinfoid" /></td>
							<td><s:property value="#dealinfo.money" /></td>
							<td><s:property value="#dealinfo.dealdate" /></td>
							<td><s:property value="#dealinfo.users.userid" /></td>
							<td><s:property value="#dealinfo.score" /></td>
							<td><s:property value="#dealinfo.goodsnum" /></td>
							<td><s:property value="#dealinfo.goods.goodsid" /></td>
							<td><label id="imglab" title="点击图片查看大图" for="img"
								class="box"><a
									href="javascript:onclick=showBigPicture('<s:property value='#dealinfo.goods.img'/>')"
									class="thumbnail" style="width:40px;height:40px;" id="img"><img
										src="<s:property value='#dealinfo.goods.img'/>"> </a></label></td>
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
				url="dealinfo_getDealinfoList?" pageMax="${requestScope.totalPage}" />
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
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