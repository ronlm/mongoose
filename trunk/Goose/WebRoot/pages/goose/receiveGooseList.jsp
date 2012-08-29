<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../../js/getInfo.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>


<body style="overflow-y: visible;" onload="changeRowColor();">
	<table class="mainTable" id="table">
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3><c:if test="${farm != null }">${farm.name }农场的</c:if>鹅苗交付信息列表</h3>
						<div class="tableControllerButton">
						<form name="changeDayForm" id="changeDayForm" action="${pageContext.request.contextPath }/pages/goose/receiveGooseAction!list" method="post">
							最近
							<select name="daysWithin" id="daysWithin" style="width: 70px" onchange="changeDay();" >
								<option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3天</option>
								<option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7天</option>
								<option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>两周</option>
								<option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30天</option>
								<option value="60" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>60天</option>
								<option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90天</option>
								<option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>一年</option>
								<option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							</select>
							天内交付信息
							<c:if test="${farm != null }"><input type="hidden" name="farm.id" id="farm.id" value="${farm.id }" /></c:if>
							
						</form>
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span>
						</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th>
					<h3>
						<input type="checkbox" onclick="selectAll(this);" />
					</h3></th>
				<th>
					<h3>日期</h3></th>
				<th>
					<h3>数量</h3></th>
				<th width="15%">
					<h3>备注</h3></th>
				<th width="40%">
					<h3>操作</h3></th>
			</tr>
		</thead>
		<tbody id="contentBody">
			<form action="${pageContext.request.contextPath }/pages/goose/receiveGooseAction!del" name="myForm" id="myForm" method="post">
				<c:forEach items="${pager.data}" var="receiveGoose">
					<tr>
						<td width="20px"><input type="checkbox" name="id" value="${receiveGoose.id}" /></td>
						<td>${receiveGoose.receiveDate}</td>
						<td>${receiveGoose.amount}</td>
						<td>${receiveGoose.comments}</td>
						<td ><a class="button-small" value="${receiveGoose.farmId }" name="farmId"><span>获取相关农户农场资料</span></a></td>
					</tr>
				</c:forEach>
			</form>
		</tbody>
		<tfoot >
			<tr class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pager}" />
						</jsp:include>
					</div></td>
			</tr>
		</tfoot>
	</table>
</body>
<script type="text/javascript">
	function changeDay(){
			$("#changeDayForm").submit();
	}
</script>

</html>