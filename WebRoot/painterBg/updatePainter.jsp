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

<title>My JSP 'updatePainter.jsp' starting page</title>

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

#updatePainters {
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
	height: 35%;
}

.loadfile {
	margin-top: 15%;
	display: block;
	width: 200px;
	height: 200px;
	line-height: 200px;
	font-size: 60px;
	text-align: center;
	border: 1px solid #ccc;
	font-size: 60px;
}

.bg_size {
	background-repeat: no-repeat;
	background-size: 200px 200px;
}
</style>
</head>

<body>
	<s:debug></s:debug>
	<form action="painter_updatePainterInfo" enctype="multipart/form-data"
		method="post" id="updatePainterform">
		<div class="" id="updatePainters">
			<div class="container-fluid" id="left">
				<div class="row">
					<h1 class="col-xs-5 col-sm-5 col-xs-offset-2">
						<b>画师信息修改</b>
					</h1>
				</div>
				<lable id="hidd"> <input type="hidden" id="painterid"
					value="<s:property value='#session.curr_painter.painterid'/>"
					name="painter.painterid" /> </lable>

				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">用户名</span> <label
							class="control-label" for="name"> </label><input type="text"
							class="form-control input-lg" placeholder="用户名" id="name"
							value="<s:property value='#session.curr_painter.name'/>"
							name="painter.name" disabled>
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">密码</span> <label
							class="control-label" for="pwd"> </label> <input type="text"
							class="form-control input-lg" placeholder="密码" id="pwd"
							name="painter.pwd"
							value="<s:property value='#session.curr_painter.pwd'/>">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">介绍</span> <label
							class="control-label" for="intro"> </label>
						<textarea rows="6" cols="63" id="intro" name="painter.intro">
							<s:property value="#session.curr_painter.intro" />
						</textarea>
					</div>
				</div>
				<div class="row">
					<button class="btn btn-primary btn-lg col-xs-2 col-xs-offset-1"
						type="button" value="修改" id="updatePainter">
						<b>修改</b>
					</button>
					<button class="btn btn-default btn-lg col-xs-2 col-xs-offset-1"
						type="button" value="Reset" id="reset">
						<b>重置</b>
					</button>
				</div>
			</div>
			<div id="right">
				<div class="c">
					<label id="imglab" title="点击'+'号上传头像" class="loadfile"
						for="uploadfile"><img height="200px" width="200px"
						src="<s:property value="painter.img"/>" alt="+"></label><input
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
			$("#updatePainter").click(function() {
				/* 							for (var i = 2; i < 6; i++) {
				 if ($("input:eq(" + i + ")").val() == "") {
				 layer.tips($(obj).attr('placeholder')
				 + '不能为空', $(obj));
				 return;
				 }
				 } */
				layer.msg('修改成功');
				$('#updatePainterform').submit();
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
