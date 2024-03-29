<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<script type="text/javascript" src="../../js/getInfo.js"></script>
<%-- 对每个农场的当前存栏的鹅苗进场批次作死亡数字统计，显示每只鹅的死亡原因--%>
<body  onload="changeRowColor();">
	<table class="mainTable" id="table" >
		<thead>
			<tr class="tableController">
				<th colspan="8">
					
					<h3>${farm.name}&nbsp;农场进场鹅苗批次死亡明细</h3>
					<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/deadReasonAction!list'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_form_magnify.png" align="absmiddle"/>&nbsp;查看鹅只非正常死亡原因</span></a>
					<a class="button" href="javascript:void(0)"
							onclick="window.open('${pageContext.request.contextPath }/data/exportData/ExportData?type=receiveGooseDeadInfo&receiveId=${receiveGoose.id }');"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/application_go.png"
								align="absmiddle" />&nbsp;导出本进场批次死亡统计数据</span>
					</a>
						最近
						 <select name="daysSelect" id="daysSelect" style="width:60px;border: solid,1px" onchange="document.getElementById('daysWithin').value=this.value;">  
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
							  天内本批次死亡鹅只明细&nbsp;&nbsp;&nbsp;&nbsp;
							  自定义天数:
							  <input type="text" id="daysWithin" name="daysWithin" value="${daysWithin }" style="width:40px;border:border:1px solid #fff000;">  
							天&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="button" id="confirm" onclick="submitForm();"><span>&nbsp;确 定&nbsp;</span></a>
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span> </a>
						
				</th>
				<tr>
					<td colspan="10">农场:<b>${farm.name }</b>&nbsp;&nbsp;&nbsp;&nbsp;地址:<b>${farm.address }</b>&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="10">进场日期:<b>&nbsp;${receiveGoose.receiveDate }</b></br>
					进场数量:&nbsp;<font color="green"><b>${receiveGoose.amount }&nbsp;</b></font>只&nbsp;&nbsp;&nbsp;&nbsp;
					合计死亡数量:<font color="red"><b>&nbsp;${total }&nbsp;</b></font>只
					</td>
				</tr>
				<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>鹅只脚环ID号</h3></th>
				<th><h3>死亡原因</h3></th>
				<th><h3>死亡时间</h3></th>
		</thead>
		<tbody id="contentBody" style="overflow: auto;height:1200px"> 
				<c:forEach items="${pager.data}" var="deadGooseView" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${deadGooseView.ringId }</td>
						<td>${deadGooseView.reason }</td>
						<td>${deadGooseView.deadDate }</td>
					</tr>
				</c:forEach>
		</tbody>
		<tfoot>
			<tr class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pager}" />
						</jsp:include>
					</div>
				</td>
			</tr>
		</tfoot>
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
