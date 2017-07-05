<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.*"%>
<%@ page import="org.apache.poi.hssf.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Dance Society DTU</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src = "angular.min.js"></script>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
    
      margin-bottom: 0;
      border-radius: 0;
    }
 	body{
 	background-color:wheat;
 	text-align:center;}
 	
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    .break-word{
    word-wrap:break-word;
    }
   
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li ><a href="home.html">Home</a></li>
        <li ><a href="Post.jsp">Post</a></li>
        <li><a href="Comment.jsp">Comments</a></li>
        <li class="active"><a href="Rating.jsp">Rating</a></li>
      </ul>
      
    </div>
  </div>
</nav>

  <div>
  <div >
      <h2 align=center>Rating of Facebook Page - "Dance Society,DTU"</h2>
	<hr>
      <h4><small>All Ratings</small></h4>
      <hr>
      <% 
      short a=0;
      short b=1;
      short c=3;
      short d=4;
      String   rid="", date="",name=" "; 
   	double rating;
   	int sum=0,count=0,avg=0;
      String filename ="workbook.xlsx";
      FileInputStream fs =new FileInputStream("D:/java work/web_application/WebContent/workbook.xls");
      HSSFWorkbook wb = new HSSFWorkbook(fs);
      HSSFSheet sheet = wb.getSheetAt(2);
      int rows  = sheet.getPhysicalNumberOfRows();
      for (int r = 1; r < rows; r++){
    	    HSSFRow row   = sheet.getRow(r);
    	    int     cells = row.getPhysicalNumberOfCells(); 
    	   
    	    HSSFCell cell1  = row.getCell(a);
    		name = cell1.getStringCellValue();
    	      HSSFCell cell2  = row.getCell(b);
    	        date= cell2.getStringCellValue();
    	         HSSFCell cell3  = row.getCell(c);
    	         rating = cell3.getNumericCellValue();
    	          HSSFCell cell4  = row.getCell(d);
    	         rid = cell4.getStringCellValue();
    	         sum+=rating;
    	  
      out.println("<h2>Rated By : " +name+"</h2>");     
      out.print("<h5>"+date+"</h5>");
      out.print("<h5> Rating Id : "+rid+"</h5>");
      out.println("Rating Given : "+rating);
      out.println("<hr>");
    count++;
      
      }
      avg=sum/count;
      %>
      
      <h3>Average Rating : <%= avg %> </h3>
	</div>
	</div>
	
	<footer class="container-fluid text-center">
  <p>DANCE SOCIETY, DTU</p>
</footer>

</body>
</html>