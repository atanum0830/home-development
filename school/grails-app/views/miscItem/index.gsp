
<%@ page import="com.academy.maars.school.MiscItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'miscItem.label', default: 'MiscItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-miscItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-miscItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'miscItem.amount.label', default: 'Amount')}" />
					
						<th><g:message code="miscItem.invoice.label" default="Invoice" /></th>
					
						<g:sortableColumn property="itemDate" title="${message(code: 'miscItem.itemDate.label', default: 'Item Date')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'miscItem.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${miscItemInstanceList}" status="i" var="miscItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${miscItemInstance.id}">${fieldValue(bean: miscItemInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: miscItemInstance, field: "invoice")}</td>
					
						<td><g:formatDate date="${miscItemInstance.itemDate}" /></td>
					
						<td>${fieldValue(bean: miscItemInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${miscItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
