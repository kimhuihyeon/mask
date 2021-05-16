<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<c:set var='root' value="${pageContext.request.contextPath}/" />
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<head>
<script type="text/javascript" src="${root}resources/common2.js"></script>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<style type="text/css">
		@media(min-width:768px) {
   		 #page-wrapper {
        margin: 0 0 0 250px !important;    
    }
}
	</style>
   <title>관리자페이지</title>
  <!-- Bootstrap Core CSS -->
    <link href="/mask/resources/admin_css/bootstrapadmin.min.css" rel="stylesheet">
	 <!-- Custom CSS -->
    <link href="/mask/resources/admin_css/sb-admin-2.css" rel="stylesheet">
	<!-- jQuery -->	
    <script src="/mask/resources/admin_js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/mask/resources/admin_js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/mask/resources/admin_js/sb-admin-2.js"></script>  
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#FFFAFA">
            <div class="navbar-header" style="background-color:#FFFAFA">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"style="color:#000000;" href="/mask/admin/goodsList.mk"><span style="font-variant:initial;">관리자페이지</span></a>
            </div>
            <!-- /.navbar-header -->
         <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
               
                        
                        <li>
                        <a href="/mask/member/openLoginForm.mk" style="background:#FFFAFA; border-bottom: 1px solid #FFFAFA;">
                        <i class="fa fa-bar-chart-o fa-fw"></i> <p style="color:black;">쇼핑몰로이동</p></a>
                        </li>
                        
                             <li class="active">
                            <a href="#"style="background:#FFFAFA; border-bottom: 1px solid #F8F8F8;"><i class="fa fa-bar-chart-o fa-fw"></i>
                             <p style="color:black;">상품관리<span class="fa arrow">▼</span></p></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mask/admin/goodsList.mk"  style="color: black">- 상품목록</a>
                                </li>
                                 <li>
                                    <a href="/mask/admin/goodsWrite.mk" style="color: black">- 상품등록</a>
                                </li> 
                            </ul>
                        </li>
                        
                               <li class="active">
                            <a href="#"style="background:#FFFAFA; border-bottom: 1px solid #F8F8F8;"><i class="fa fa-bar-chart-o fa-fw"></i>
                             <p style="color:black;">회원관리<span class="fa arrow">▼</span></p></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mask/admin/memberList.mk" style="color: black">- 회원목록</a>
                                </li>
                            </ul>
                        </li>
               
                        
                        
              
                            <li class="active">
                            <a href="#"style="background:#FFFAFA; border-bottom: 1px solid #F8F8F8;">
                            <i class="fa fa-bar-chart-o fa-fw"></i>
                             <p style="color:black;">주문관리<span class="fa arrow">▼</span></p></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mask/admin/orderList.mk" style="color: black">- 주문목록</a>
                                </li>
                                 <li>
                                    <a href="/mask/admin/deliverList.mk" style="color: black">- 배송관리</a>
                                </li> 
                                 <li>
                                    <a href="/mask/admin/adminSalList.mk" style="color: black">- 매출관리</a>
                                </li> 
                            </ul>
                        </li>
                         <li class="active">
                            <a href="#"style="background:#FFFAFA; border-bottom: 1px solid #F8F8F8;">
                            <i class="fa fa-bar-chart-o fa-fw"></i>
                             <p style="color:black;">게시판관리<span class="fa arrow">▼</span></p></a>
                            
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mask/admin/OpenAdminBoardList.mk" style="color: black">- 게시판 통합관리</a>
                                </li>
                                 <li>
                                    <a href="/mask/admin/noticeWrite.mk" style="color: black">- 공지사항 등록</a>
                                </li> 
                            </ul>
                        </li>
                            </ul>
                      
                        
                   </div>
                   </div>
                   </nav>
                </div>
      

</body>
</html>