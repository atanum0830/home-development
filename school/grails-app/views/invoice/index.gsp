
<%@ page import="com.academy.maars.school.Invoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-invoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-invoice" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="invoiceDate" title="${message(code: 'invoice.invoiceDate.label', default: 'Invoice Date')}" />
					
						<g:sortableColumn property="paymentDate" title="${message(code: 'invoice.paymentDate.label', default: 'Payment Date')}" />
					
						<g:sortableColumn property="checkNo" title="${message(code: 'invoice.checkNo.label', default: 'Check No')}" />
					
						<g:sortableColumn property="checkAmt" title="${message(code: 'invoice.checkAmt.label', default: 'Check Amt')}" />
					
						<g:sortableColumn property="invoiceAmt" title="${message(code: 'invoice.invoicAmt.label', default: 'Invoice Amt')}" />
					
						<g:sortableColumn property="isPaid" title="${message(code: 'invoice.isPaid.label', default: 'Is Paid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${invoiceInstance.id}">${fieldValue(bean: invoiceInstance, field: "invoiceDate")}</g:link></td>
					
						<td><g:formatDate date="${invoiceInstance.paymentDate}" /></td>
					
						<td>${fieldValue(bean: invoiceInstance, field: "checkNo")}</td>
					
						<td>${fieldValue(bean: invoiceInstance, field: "checkAmt")}</td>
					
						<td>${fieldValue(bean: invoiceInstance, field: "invoiceAmt")}</td>
					
						<td><g:formatBoolean boolean="${invoiceInstance.isPaid}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${invoiceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
