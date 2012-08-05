<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
<head>
	<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
</head>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<body style="overflow-y: visible !important; overflow-y: scroll;">
	<form
		action="${pageContext.request.contextPath }/pages/goose/buyGoodAction!save"
		name="myForm" id="myForm" method="post">
		<table class="mainTable">
			<thead>
				<tr class="tableController">
					<th colspan="2">
						<h3>添加物资采购记录</h3></th>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<th class="errorTip"
						style='<c:if test="${empty message}">display:none</c:if>'><c:forEach
							items="${message}" var="m">
								${m }
							</c:forEach></th>
				</tr>
				<tr class="tableTitle">
					<th>
						<h3>&nbsp;</h3></th>
					<th>
						<h3>&nbsp;</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="200" align="right">资源名称:</td>
					<td><select name="buyGood.goodId">
						<c:forEach items="${goodList}" var="good">
							<option value="${good.id}">${good.name}
								<input type="hidden" name="goodName" value="${good.name}"/>
							</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200" align="right">供应商姓名:</td>
					<td><select name="buyGood.retailerId">
						<c:forEach items="${retailerList}" var="retailer">
							<option value="${retailer.id}">${retailer.name}
								<input type="hidden" name="retailerName" value="${retailer.name}"/>
							</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200" align="right">单价:</td>
					<td><input type="text" name="buyGood.unitPrice" id="unit" validation="required"
						 /></td>
				</tr>
				<tr>
					<td width="200" align="right">数量:</td>
					<td><input type="text" name="buyGood.amount" id="unit" validation="required" "
						 /></td>
				</tr>
				<tr>
					<td width="200" align="right">时间:</td>
					<td><input type="text"  validation="date" readonly="readonly" name="buyGood.date" id="signDate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/></td>
				</tr>
				<tr>
					<td width="200" align="right">备注:</td>
					<td><textarea rows="5" cols="50" name="buyGood.comments"
							id="comments">	</textarea></td>
				</tr>

			</tbody>
			<tfoot>
				<tr class="tableController_bottom">
					<td align="center">&nbsp;</td>
					<td align="left"><a class="button" href="javascript:void(0)"
						onclick="this.blur();save();return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/disk.png"
								align="absmiddle" />&nbsp;保存</span> </a> <a class="button"
						href="javascript:void(0)"
						onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回</span> </a></td>
				</tr>
			</tfoot>
		</table>
	</form>
	<script type="text/javascript">
		var formId = 'myForm';
		var valid = new KUI.Validation({
			formId : formId,
			immediate : true
		});
		function save() {
			if (valid.validate()) {
				document.getElementById(formId).submit();
			}
		}
	</script>
</body>
</html>