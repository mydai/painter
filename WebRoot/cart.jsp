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
    
    <title>cart</title>
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
	<script type="text/javascript" src="layer/layer.js"></script>
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
				var totalMoney=0.00;
				var totalScore=0;
				function showTotal(){
					 totalMoney=0.00;
					 totalScore=0;
					 $("input[name='choose']").each(function(){
						 if($(this).attr("checked")){
							var goodsnum= $(this).parents(".a").find("input[name='goodsnum']").val();
							var price=$(this).parents(".a").find("p[name='price']").text();
							var score=$(this).parents(".a").find("p[name='score']").text();
							
							totalMoney+=goodsnum*price;
							totalScore+=goodsnum*score;
						 }
						 $("#totalMoney").text("￥"+totalMoney);
						 $("#totalMoney2").text("￥"+totalMoney);
						 $("#totalScore").text(totalScore);
						 $("#totalScore2").text(totalScore);
					 });
				 };
				 
				 $("input[name='choose']").click(function(){
					 showTotal();
					 var flag=true;
					 $("input[name='choose']").each(function(){
						 if(!$(this).attr("checked")){
						
						 	flag=false;
						 return;
						 }
						 
					 });
					 if(flag){
						
						 $("#allChoose").attr("checked",true);
					 }else{
						 $("#allChoose").attr("checked",false);
					 }
				 });
			
				 $("#allChoose").click(function(){
					 if($("#allChoose").attr("checked")){
						 $("input[name='choose']").each(function(){
							 $(this).attr("checked",true);
	
						 });
						 showTotal();
					 }else{
						 $("input[name='choose']").each(function(){
							 $(this).attr("checked",false);
	
						 });
						 showTotal();
					 }
				 });
				 
				 $("button[name='add']").click(function(){
					 var goodsnum= $(this).parents(".a").find("input[name='goodsnum']").val();
					 $(this).parents(".a").find("input[name='goodsnum']").val(+goodsnum+1);
					 showTotal();
				 });
				
				 $("button[name='minus']").click(function(){
					 var goodsnum= $(this).parents(".a").find("input[name='goodsnum']").val();
					 if(goodsnum>1){
					 $(this).parents(".a").find("input[name='goodsnum']").val(+goodsnum-1);
					 }else{
						 $(this).parents(".a").find("input[name='goodsnum']").val(1);
					 }
				 });
				 
			 $("button[name='remove']").click(function(){
				var cartid= $(this).next("input[name='cartid']").val();
				
				$.post("delCart",{"cart.cartid":cartid},function(data){
				});
				var key=$("tbody").children("tr").length;
				if(key==2){
					
					$("#divTwo").hide();
					$("#divOne").show();
				}else{
				$(this).parents(".a").remove();
				
				}
				
				
			 });
			 
			 $("#sure").click(function(){
				 var usermoney=${sessionScope.user.money};
				 if(usermoney<totalMoney){
					 layer.alert("余额不足！！！");
				 }
				 else{$("input[name='choose']").each(function(){
					 if($(this).attr("checked")){
						 
						 var goodsnum=+$(this).parents(".a").find("input[name='goodsnum']").val();
						 var money=+$(this).parents(".a").find("p[name='price']").text()*goodsnum;
						 var score=+$(this).parents(".a").find("p[name='score']").text()*goodsnum;
						 var cartid=$(this).parents(".a").find("input[name='cartid']").val();
						 var painterid=$(this).parents(".a").find("input[name='painterid']").val();
						 var goodsid=$(this).parents(".a").find("input[name='goodsid']").val();
						 var objJson={"dealinfo.goodsnum":goodsnum,"dealinfo.money":money,"dealinfo.score":score,"cart.cartid":cartid,"dealinfo.goods.painter.painterid":painterid,"dealinfo.goods.goodsid":goodsid};
						 
						 $.post("referCart",objJson);
					 }
 
					 });
				 	
				 	window.location.href="http://localhost:8080/painter/showDealinfo";
				 }
				 
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
     
      <div class="modal-body">
        	<h5>您将支付：<span id="totalMoney2"></span></h5>
        	<h5>支付获得积分：<span id="totalScore2"></span></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="sure"  class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
     
    </div>
  </div>
</div>

      <div class="bg-content">       
  <!--============================== content =================================-->      
      <div id="content"><div class="ic">More Website Templates @ TemplateMonster.com. November19, 2012!</div>
    <div class="container">
          <div class="row">
          <div class="row" id="divOne" style="display:none;">
         	 <div class="span5 offset2">
      				<img alt="商品图片"   src="img/cartIMG.png" height="500px" width="500px">
      		</div>
      		<div class="span4">
      			
      			<p style="line-height:30px;text-align: center;color:#EFFFF1;font-size: 25px">
      			<br/><br/><br/><br/>
      			您的购物车还是空的！<small>您可以：</small>
      				<br/><a href="Service">浏览商品</a><br/><a href="showDealinfo">查看最近交易记录</a>
      			</p>
      		</div>
      		</div>
          <s:if test="carts.size==0">
           <div class="row">
         	 <div class="span5 offset2">
      				<img alt="商品图片"   src="img/cartIMG.png" height="500px" width="500px">
      		</div>
      		<div class="span4">
      			
      			<p style="line-height:30px;text-align: center;color:#EFFFF1;font-size: 25px">
      			<br/><br/><br/><br/>
      			您的购物车还是空的！<small>您可以：</small>
      				<br/><a href="Service">浏览商品</a><br/><a href="showDealinfo">查看最近交易记录</a>
      			</p>
      		</div>
      		</div>
      		 
          </s:if>
          <s:else>
           <div class="row" id="divTwo">
          	<div class="span10 offset1">
      			<table class="table" style="color: #B3AAAA">
		            <thead>
		                <tr>
		                    <th><p style="line-height:30px;text-align: center;"><input id="allChoose" type="checkbox"/>全选</p></th>
		                    <th><p style="line-height:30px;text-align: center;">缩略图</p></th>
		                    <th><p style="line-height:30px;text-align: center;">画师</p></th>
		                    <th><p style="line-height:30px;text-align: center;">购买数量</p></th>
		                    <th><p style="line-height:30px;text-align: center;">单价</p></th>
		                    <th><p style="line-height:30px;text-align: center;">积分</p></th>
		                    
		                    <th><p style="line-height:30px;text-align: center;">操作</p></th>
		                </tr>
		            </thead>
		          	
		            <tbody  >
		            	<s:iterator value="carts" var="car">
		            			
		                		<tr class="a">
		                		
			                    <td><p style="line-height:80px;text-align: center;"><input name="choose" type="checkbox"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
			                    <td style="text-align: center;"><a href="Goodsinfo?goods.goodsid=<s:property value="#car.goods.goodsid"/>"><img alt="图片" height="80px" width="80px"  src='<s:property value="#car.goods.img"/>' class="img-thumbnail"></a></td>
			                    <td><p style="line-height:80px;text-align: center;color:#e85356;"><s:property value="#car.goods.painter.name"/></p></td>
			                    <td><p style="line-height:80px;text-align: center;">
			                        <button type="button" name="minus" class="btn btn-primary">-</button>
			                        <input type="button" name="goodsnum" value="<s:property value="#car.goodsnum"/>" style="width: 30px;">
			                        <button type="button" name="add" class="btn btn-primary">+</button>
									</p>
			                    </td>
			                    <td ><p name="price"  style="line-height:80px;text-align: center;color:#e85356;"><s:property value="#car.goods.price"/></p></td>
			                    
			                    <td><p name="score" style="line-height:80px;text-align: center;color:#e85356;"><s:property value="#car.goods.score"/></p></td>
			                    <td style="text-align: center;">
			                    	<br/>
			                   	 <button type="button" class="btn btn-danger" name="remove">
			                    		移除 </button><input name="cartid" type="hidden" value="<s:property value="#car.cartid"/>"/>
			                    		<input name="painterid" type="hidden" value="<s:property value="#car.goods.painter.painterid"/>"/>
			                    		<input name="goodsid" type="hidden" value="<s:property value="#car.goods.goodsid"/>"/></td>
			               		</tr>
		               		
		                </s:iterator>
	                	<tr>
		                    <td><p style="line-height:30px;text-align: center;">总购买价</p></td>
		                    <td><p id="totalMoney" style="line-height:30px;text-align: center;color:#e85356;">0.00</p></td>
		                    <td><p  style="line-height:30px;text-align: center;">总获得积分</p></td>
		                    <td><p id="totalScore" style="line-height:30px;text-align: center;color:#e85356;">0</p></td>
		                    <td></td>
		                    <td></td>
		                    <td style="text-align: center;"><button  class="btn btn-danger" data-toggle="modal" data-target="#dealModal">购买</button></td>
		                    
		                   
	               		 </tr>
           		 </tbody>
		      	 </table>
    		</div>
    		</div>
    		</s:else>
        </div>
  </div>
    </div>
    </div>
<!--============================== footer =================================-->
<%@include file="footer.jsp" %>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>