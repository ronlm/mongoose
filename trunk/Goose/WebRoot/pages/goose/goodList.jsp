<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
  <body style="overflow-y: visible;" onload="changeRowColor();">
    	<table class="mainTable">
		<thead>
			<tr class="tableController">
				<th colspan="7">
					<h3>农用物资列表</h3>
					<div class="tableControllerButton">
						<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/goose/goodAction!get'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_add.png" align="absmiddle"/>&nbsp;添加</span></a>
						<a class="button" href="javascript:void(0)" onclick="this.blur(); deleteAll();  return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_delete.png" align="absmiddle"/>&nbsp;删除</span></a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th>
					<h3><input type="checkbox" onclick="selectAll(this);"/></h3>
				</th>
				<th>
					<h3>品名</h3>
				</th>
				<th>
					<h3>单位</h3>
				</th>		
				<th width="20%">
					<h3>操作</h3>
				</th>   
				                        
			</tr>
		</thead>
		<tbody>
		<form action="${pageContext.request.contextPath }/goose/goodAction!del" name="myForm" id="myForm" method="post">
			<c:forEach items="${pageController.data}" var="good">
				<tr>
					<td width="20px"><input type="checkbox" name="id" value="${good.id}"/></td>
					<td>${good.name}</td>
					<td>${good.unit}</td>
					<td>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/goose/goodAction!get?good.id=${good.id }'; return false;"><span>修改</span></a>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); deleteOne('${pageContext.request.contextPath }/goose/goodAction!del?id=${good.id }'); return false;"><span>删除</span></a>
					</td>
					
				</tr> 
			</c:forEach>
		</form>
		</tbody>
		<tfoot>
			<tr  class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pageController}"/>
						</jsp:include>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
  </body>
</html>
