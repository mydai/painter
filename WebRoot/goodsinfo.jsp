<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>goodsinfo</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
	<meta name="description" content="Your description">
	<meta name="keywords" content="Your keywords">
	<meta name="author" content="Your name">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/touchTouch.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/kwicks-slider.css" type="text/css" media="screen">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<script src="BootStrap3.0.3/js/jquery.min.js"></script>
	<script src="BootStrap3.0.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>    
	<script type="text/javascript" src="js/touchTouch.jquery.js"></script>
	<script type="text/javascript" src="js/jquery.fly.min.js"></script>
	<script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>

	<script>		
		 jQuery(window).load(function() {	
		 $x = $(window).width();		
	if($x > 1024)
	{			
	jQuery("#content .row").preloader();    }	
		 
     jQuery('.magnifier').touchTouch();			
    jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',function (){jQuery(this).css('display','none')});	
  	
		 }); 
			$(function(){
				var offset = $("#end").offset();
				var num=$("#num").val();
				var price=$("#price").text();
				var jifen=$("#jifen").text();
				var goodsid=$("#goodsid").val();
				$("#money").html(price*num);
				$("#score").html(jifen*num);
				$("#allscore").html(jifen*num);
				$("#pay").html(price*num);
				$("#allmoney").val(price*num);
				$("#alljifen").val(jifen*num);
				$("#number").val(num);
				
				
				$("#add").click(function(){
					num=+num+1;
					$("#num").val(num);
					$("#money").html(price*num);
					$("#score").html(jifen*num);
					$("#pay").html(price*num);
					$("#allscore").html(jifen*num);
					$("#alljifen").val(jifen*num);
					$("#allmoney").val(price*num);
					$("#number").val(num);
					
				});
				$("#minus").click(function(){
					if(num>1){
						num=+num-1;
						$("#num").val(num);
						$("#number").val(num);
						
						
					}else{
						$("#num").val(1);	
					}
					$("#money").html(price*num);
					$("#score").html(jifen*num);
					$("#pay").html(price*num);
					$("#allscore").html(jifen*num);
					$("#allmoney").val(price*num);
					$("#alljifen").val(jifen*num);
			
				});
				
				$("#mycart").click(function(event){
					var img = $("#onlyimg").attr('src'); 
					var flyer = $('<img class="u-flyer" src="'+img+'">');
					flyer.fly({ 
			            start: { 
			                left: event.pageX-80, //开始位置（必填）#fly元素会被设置成position: fixed 
			                top: event.pageY //开始位置（必填） 
			            }, 
			            end: { 
			                left: offset.left+10, //结束位置（必填） 
			                top: offset.top+10, //结束位置（必填） 
			                width: 0, //结束时宽度 
			                height: 0 //结束时高度 
			            }, 
			            onEnd: function(){ //结束回调 
			                $("#msg").show().animate({width: '250px'}, 200).fadeOut(3000); //提示信息 
			               
			            } 
			        }); 
					$.post("addCart",{"cart.goods.goodsid": goodsid,"cart.goodsnum":num},function(data){ 
						
						 });
				});
				
				$("#back").click(function(){
					window.history.back();
				});
				
				
			})
	</script>

	<!--[if lt IE 8]>
  		<div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div>  
 	<![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->
	<!--<![endif]-->
	<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/docs.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css'>
  <![endif]-->
  		<style type="text/css">
  			#mytop{
  			
  				background: black;
  				height: 50px;
  			}
  			body{
  				margin-top:50px;
  			}
  		</style>
  		
	</head>

	<body>
<!--============================== header =================================-->
<nav class="navbar navbar-inverse navbar-fixed-top" id="mytop">
<div class="container" id="top">
	<div class="row">
	<div class="span5">
	<s:if test="#session.user!=null">
    	<p class="navbar-text">画美人欢迎您,&nbsp;&nbsp;<a href="javascript:;" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
    	<s:property value="#session.user.name"/>  </a>&nbsp;&nbsp;<a href="relogin">退出登录</a>
    	
 	 	</p>	
 	</s:if>	
 	<s:else>
 	 	<p class="navbar-text">已有账号？请&nbsp;&nbsp;&nbsp;<a href="login.html" class="btn btn-danger">登录</a>&nbsp;&nbsp;还没有账号？点击：&nbsp;<a href="register.html" class="btn btn-danger">注册</a>

 	 	</p>
	</s:else>
	</div>	
	<div class="span6">
		
	</div>
	<div class="span1">
		<i id="end"></i>
  		<a href="cart"><img alt="购物车" src="img/cart.png"  height="50px" width="50px" /></a>
	
	</div>
</div>
</div>
</nav>

<header>
      <div class="container clearfix">
    <div class="row">
          <div class="span12">
        <div class="navbar navbar_">
              <div class="container">
            <h1 class="brand brand_"><a href="index.jsp"><img alt="" src="img/logo.gif"> </a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            <div class="nav-collapse nav-collapse_  collapse">
                  <ul class="nav sf-menu">
                <li ><a href="index">首页</a></li>
                <li class="sub-menu"><a href="Service">服务</a>
                      <ul>
	                    <s:iterator value="#application.typeList" var="type">
	                     	<li><a href='Service?typeid=<s:property value="#type.typeid"/>'><s:property value="#type.name"/></a></li>
	                     </s:iterator>
                  	</ul>
                </li>
               
                <li><a href="product.jsp">作品</a></li>
                <li><a href="showpainter">画师</a></li>
                <li><a href="contact.jsp">联系我们</a></li>
              </ul>
                </div>
          </div>
            </div>
      </div>
        </div>
  </div>
  
</header>
    
<div class="bg-content">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">We welcome you to join</h4>
      </div>
       <form class="form-inline" method="post" action="UpdateUser">
      <div class="modal-body">
     
      	<div style="margin:10 20;" class="text-center">
        	<img alt="头像" src="<s:property value="#session.user.avatar"/>" height="100px" width="100px" class="img-circle"/>
        	<button type="button" class="btn btn-primary pull-right">编辑资料</button>
        </div>
        <div>
        	<div class="form-group-lg">
			    <label for="name">用户名：</label>
			    <input type="text" class="form-control input-lg" id="name" name="uname" value="<s:property value="#session.user.name"/>">
			</div>
			<div class="form-group-lg">
				<label for="pwd">密码：</label>
			    <input type="password" class="form-control input-lg " id="pwd" name="pwd" value="<s:property value="#session.user.pwd"/>">
			</div>
			<div class="form-group-lg">
				<label for="date">注册日期：</label>
			    <input type="text" class="form-control input-lg " id="date" name="date" value="<s:property value="#session.user.regdate"/>">
			</div>
			<div style="margin:0 ">
				<h5>您的余额为：<s:property value="#session.user.money"/>&nbsp;&nbsp;&nbsp;&nbsp; 您的积分为：<s:property value="#session.user.score"/></h5>
				
			</div>
			<input type="hidden" name="id" value="<s:property value="#session.user.userid"/>"/>
        </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">确认修改</button>
      </div>
       </form>	
    </div>
    
  </div>
</div>
</div>
<div class="modal fade" id="dealModal" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
        	<h4 style="color:black;">是否确认购买?</h4>
      </div>
      <form class="form-inline" method="post" action="Dealinfo">
      <div class="modal-body">
        	<h5>您将支付：￥<span id="pay"></span></h5>
        	<h5>支付获得积分：<span id="allscore"></span></h5>
        	<input type="hidden" name="dealinfo.money" id="allmoney"/>
        	<input type="hidden" name="dealinfo.goods.goodsid" value="<s:property value="goods.goodsid"/>" id="goodsid"/>
        	<input type="hidden" name="dealinfo.goods.painter.painterid" value="<s:property value="goods.painter.painterid"/>"/>
        	<input type="hidden" name="dealinfo.score" id="alljifen"/>
        	<input type="hidden" name="dealinfo.goodsnum" id="number"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit"  class="btn btn-primary">确定</button>
      </div>
      </form>
     
    </div>
  </div>
</div>

      <div class="bg-content">       
  <!--============================== content =================================-->      
      <div id="content"><div class="ic">More Website Templates @ TemplateMonster.com. November19, 2012!</div>
    <div class="container">
          <div class="row">
      			<div class="span3 offset5">
      				<h4 >商品详情</h4>
      			</div>
      			<div class="span4" id="msg" style="display: none;">
      				<span style="line-height:90px;color:red;font-size:30px">添加购物车成功</span>
      			</div>
      	  </div>
      	  <div class="row">
      			<div class="span5 offset2">
      				<img alt="商品图片" id="onlyimg"  src="<s:property value="goods.img"/>" height="500px" width="500px">
      			</div>
      			<div class="span5">
      				<div class="row">
      					<div class="span6 offset1">
      					<br/><br/>
      					
      					<h5>画师:&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="goods.painter.name"/></h5><br/>
      						<p style="color:white;">商品简介:&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="goods.name"/></p>
      						 <p style="color:red;">销量:&nbsp;&nbsp;&nbsp;&nbsp;<span id="salnum"><s:property value="goods.salnum"/></span>
      						 <p style="color:red;">价格:&nbsp;&nbsp;&nbsp;&nbsp;￥<span id="price"><s:property value="goods.price"/></span>
      						  </p>
      						  <p >单份赠送积分:&nbsp;&nbsp;&nbsp;&nbsp;<span id="jifen"><s:property value="goods.score"/></span>
      						  </p>
      						 <p>请选择数量:<button class="btn btn-small" id="minus">-</button>
      						 	<input type="button" name="num" id="num" value="1"/>
      						 	<button class="btn btn-small" id="add" onclick="add()">+</button>
      						 </p>
      						 <p>总价为:&nbsp;&nbsp;￥<span id="money" style="color:red;"></span>&nbsp;&nbsp;&nbsp;&nbsp;支付后您将获得积分：<span id="score" style="color:red;"></span></p>
      						 
      						 <button class="btn btn-danger" data-toggle="modal" data-target="#dealModal">购买</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button  class="btn btn-danger" id="back">返回</button>
      						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      						 <button  class="btn btn-danger" id="mycart">加入购物车</button>
      					</div>
      				</div>
      			</div>
      	  </div>
    
        </div>
  </div>
    </div>
<!--============================== footer =================================-->
<%@include file="footer.jsp" %>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>