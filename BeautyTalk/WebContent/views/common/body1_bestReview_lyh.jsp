<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- bestReview -->
    #form_bestReview{
				width: 1100px;
				height: 300px;
				margin: auto;
    }

    #table_bestReview{
        background-color: black;
        width: 100%;
        height: 330px;
        margin-top: 50px;
        box-sizing: border-box;
    }

    #table_bestReview td{
        border: 1px solid white;
        color:black;
    }

    .prev_bestUser, .bestpost1_bestUser, .bestpost2_bestUser, .bestpost3_bestUser, .bestpost4_bestUser, .next_bestUser{
        cursor: pointer;
    }

</style>
</head>
<body>
<!-- bestReview -->
 	<form action="" id="form_bestReview" method="">
	    <table id="table_bestReview">
	        <tr>
	            <td></td>
	            <td colspan="8" align="center" style="height: 130px; color: white;"><h1>Today's Best User</h1></td>
	            <td></td>
	        </tr>
	        <tr>
	            <td></td>
	
	            <td colspan="2" class="user1_bestUser" style="height: 170px;">
	            	<img src="resources/images/bestuser1.png">
	            </td>

							<td></td>
	            <td colspan="2" class="user2_bestUser" style="height: 170px;">
	            	<img src="resources/images/bestuser2.png">
	            </td>
	            
							<td></td>
	            <td colspan="2"  class="user3_bestUser" style="height: 170px;">
	            	<img src="resources/images/bestuser3.png">
	            </td>
	            <td></td>


	        </tr>
	        <tr>
						<td></td>

						<td class="user1_bestUser" style="height: 170px;">
							<img src="resources/images/bestuser1.png">
						</td>
						<td></td>
						<td class="user2_bestUser" style="height: 170px;">
							<img src="resources/images/bestuser2.png">
						</td>
						<td></td>

						<td class="user3_bestUser" style="height: 170px;">
							<img src="resources/images/bestuser3.png">
						</td>
						<td></td>

						<td></td>
						<td></td>
						<td></td>
				</tr>

	    </table>
	</form>

</body>
</html>