<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navigation -->
   <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"> Good Morning Food Truck </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <%
                    	String login = "";
            	
                    	if(session.getAttribute("customerNum")!=null) {
                    		login = (String) session.getAttribute("id")+"고객님";
                    	} else if(session.getAttribute("ownerNum")!=null) {
                    		login = (String) session.getAttribute("id")+"업주님";
                    	} else {
                    		login ="로그인";
                    	}
                    %>
                    <li>
                        <a class="page-scroll" href="./login.jsp" data-target="#myModal" data-toggle="modal"><%=login %></a>
                    </li>
                    <%
                    	String register = "";
                    	if(!login.equals("로그인")) {
                    		register = "로그아웃";
                    %>
                    <li>
                        <a class="page-scroll" href="./logout.jsp" data-target="#myModal" data-toggle="modal"><%=register %></a>
                    </li>
                    <%
                    	} else {
                    		register = "회원가입";
                    %>
                    <li>
                        <a class="page-scroll" href="./register.jsp" data-target="#myModal" data-toggle="modal"><%=register %></a>
                    </li>
                    <%
                    	}
                    %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>