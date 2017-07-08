<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'updateGoods.jsp' starting page</title>

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
	
}

#updateGood {
	margin-top: 2%;
}

#left {
	margin-left: 5%;
	width: 60%;
	float: left;
}

#right {
	width: 35%;
	float: left;
	height: 50%;
}

.loadfile {
	margin-top: 15%;
	display: block;
	width: 300px;
	height: 300px;
	line-height: 300px;
	font-size: 60px;
	text-align: center;
	border: 1px solid #ccc;
	font-size: 60px;
}

.bg_size {
	background-repeat: no-repeat;
	background-size: 300px 300px;
}
</style>
</head>

<body>
	<form action="goods_updateGoods" enctype="multipart/form-data"
		method="post" id="updateGoodsform">
		<div class="" id="updateGood">
			<div id="left" class="container-fluid">
				<div>
					<input type="hidden" value="<s:property value="goods.goodsid" />"
						id="goodsid" name="goods.goodsid"/>

				</div>
				<div class="row">
					<h1 class="col-xs-4 col-sm-4 col-xs-offset-1">
						<b>作品修改</b>
					</h1>
				</div>

				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">画名</span> <label
							class="control-label" for="name"> </label><input type="text"
							class="form-control input-lg" placeholder="画名" id="name"
							name="goods.name" value="<s:property value="goods.name"/>"
							onblur="checkname()">
					</div>
				</div>

				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">价格</span> <label
							class="control-label" for="price"> </label> <input type="text"
							class="form-control input-lg" placeholder="价格" id="price"
							name="goods.price" value="<s:property value="goods.price"/>">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">积分</span> <label
							class="control-label" for="score"> </label> <input type="text"
							class="form-control input-lg" placeholder="价格" id="score"
							name="goods.score" value="<s:property value="goods.score"/>">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">画作类型</span>
						<div class="form-group">
							<select class="form-control" name="goods.goodstype.typeid">
								<option value="1">请选择画作类型</option>
								<s:iterator value="#session.curr_typelist" var="goodstype"
									status="status">
									<s:if test="#goodstype.typeid!=typeid">
										<option value="<s:property value="#goodstype.typeid" />"><s:property
												value="#goodstype.name" /></option>
									</s:if>
									<s:else>
										<option value="<s:property value="#goodstype.typeid" />"
											selected><s:property value="#goodstype.name" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-primary btn-lg col-xs-2 col-xs-offset-2"
							type="button" value="updateGoods" id="updateGoods">
							<b>修改</b>
						</button>
						<button class="btn btn-default btn-lg col-xs-2 col-xs-offset-1"
							type="button" value="Reset" id="reset">
							<b>重置</b>
						</button>
					</div>
				</div>
			</div>
			<div id="right">
				<div class="c">
					<label id="imglab" title="点击'+'号上传作品图片" class="loadfile"
						for="uploadfile"><img height="300px" width="300px"
						src="<s:property value="goods.img"/>" alt="+"></label><input
						type="file" id="uploadfile" style="display:none;"
						name="uploadCondition.upload" />
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#updateGoods").click(function() {
				/* 				var name = $("#name").val();
				 if (name == "") {
				 layer.tips("用户名不能为空", "#name");
				 return;
				 }
				 checkIsRight(); */
				layer.msg('修改成功');
				$('#updateGoodsform').submit();
			});
		});

		$(function() {
			$("#uploadfile")
					.on(
							"change",
							function(e) {
								var fr = new FileReader();
								fr.readAsDataURL(document
										.getElementById("uploadfile").files[0]);
								fr.onload = function(e) {
									$("#imglab").addClass("bg_size");
									$("#imglab").css("background-image",
											"url(" + e.target.result + ")");
									$("#imglab").html('');
								};
							});
		});
	</script>
</body>
</html>