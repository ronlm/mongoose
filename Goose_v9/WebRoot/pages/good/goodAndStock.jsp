<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
   <script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
  <body style="overflow-y: visible;" onload="changeRowColor();">

    	<table class="mainTable" id="table">
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>当前页面:鹅只存栏信息与农户购买物资比对</h3>
						<div class="tableControllerButton">
						<form name="changeDayForm" id="changeDayForm" action="${pageContext.request.contextPath }/pages/goose/gooseStatisticAction!stockAndGood" method="post">
							<div style="clear:both;;position:relative;">
							选择物资类型:&nbsp;
							<select name="goodTypeId" id="goodTypeId" style="width: 80px" >
								<c:forEach items="${goodTypeList}" var="goodType">
								<option value="${goodType.id}" 
								<c:if test="${selectGoodTypeId == goodType.id }">selected="selected" </c:if>>${goodType.name}</option>
								</c:forEach>
							</select>
							&nbsp;&nbsp;&nbsp;
							选择农户:&nbsp;
							<select name="selectedFarmer.id" style="width: 100px">
								<c:forEach items="${farmerList}" var="farmer">
								<option value="${farmer.id}" <c:if test="${selectedFarmer.id == farmer.id }"> selected="selected"</c:if>>${farmer.name}</option>
								</c:forEach>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;
							最近
						 <select name="daysSelect" id="daysSelect" style="width:80px;border: solid,1px" onchange="document.getElementById('daysWithin').value=this.value;">  
								  <option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3</option>
								  <option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7</option>
								  <option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>14</option>
								  <option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30</option>
								  <option value="60" <c:if test="${daysWithin == 60 }">selected="selected"</c:if>>60</option>
								  <option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90</option>
								  <option value="120" <c:if test="${daysWithin == 120 }">selected="selected"</c:if>>120</option>
								  <option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>365</option>
								  <option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							  </select>  
							  天内购买记录&nbsp;&nbsp;&nbsp;&nbsp;
							  自定义天数:
							  <input type="text" id="daysWithin" name="daysWithin" value="${daysWithin }" style="width:80px;border:border:1px solid #fff000;">  
							天&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="button" id="confirm" onclick="submitForm();"><span>&nbsp;确 定&nbsp;</span></a>
							</div>				
						</form>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>农场</h3></th>
				<th><h3>当前存栏数量</h3></th>
				<th width="20%"><h3>操作</h3></th>
				<th width="30%"><h3>农场备注信息</h3></th>
			</tr>
		</thead>
		<tbody id="contentBody">
				<c:forEach items="${stockList}" var="stock" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${stock.farm.name}</td>
						<td>${stock.stock}</td>
						<td >
							<a class="button" value="${deadInfo.farm.farmerId }" name="farmerId" href="${pageContext.request.contextPath }/pages/goose/deadGooseStatisticAction!deadDetail?farm.id=${stock.farm.id}"><span>存栏明细</span>
						</a>
						</td>
						<td>${stock.farm.comments}</td>
					</tr>
				</c:forEach>
				<tr><td>合计</td><td></td><td style="text-align: right">${totalStock }</td></tr>
		</tbody>
		</table>
		<table class="mainTable">
			<thead>
				<tr class="tableTitle">
					<th width="30px"><h3>序号</h3></th>
					<th><h3>资源名称</h3></th>
					<th><h3>数量</h3></th>
					<th><h3>单位</h3></th>
					<th><h3>时间</h3></th>
					<th width="20%"><h3 >备注</h3></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tradeGoodViewList}" var="tradeGoodView" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${tradeGoodView.goodName}</td>
					<td>${tradeGoodView.amount}</td>
					<td>${tradeGoodView.goodUnit}</td>
					<td>${tradeGoodView.tradeDate}</td>
					<td>${tradeGoodView.comments}</td>
				</tr> 
				</c:forEach>
				<tr><td>数量合计</td><td></td><td>${totalGood }</td></tr>		
			</tbody>
	</table>
  </body>
  <script type="text/javascript">
  function submitForm(){
		if(isNaN(document.getElementById('daysWithin').value)){
			alert("只能输入为1-3位的数字,若出错则返回上页重新输入！");
			document.getElementById('daysWithin').focus();
			return false;
		}
		else{
			if(document.getElementById('daysWithin').value > 365){
				alert("请输入小于365的数字！");
				document.getElementById('daysWithin').focus();
				return false;
			}
			else $("#changeDayForm").submit();
		}
		return false;
	}
</script>
</html>
