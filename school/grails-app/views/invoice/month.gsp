
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
						<g:sortableColumn property="id" title="Invoice No" />
						<g:sortableColumn property="student" title="Student" />
					
						<g:sortableColumn property="invoiceDate" title="${message(code: 'invoice.invoiceDate.label', default: 'Invoice Date')}" />
					
						<g:sortableColumn property="totalFees" title="Amount" />

						<g:sortableColumn property="paymentDate" title="${message(code: 'invoice.paymentDate.label', default: 'Payment Date')}" />
					
						<g:sortableColumn property="isPaid" title="${message(code: 'invoice.isPaid.label', default: 'Is Paid')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
					<g:set var="student" value="${invoiceInstance.student}"/>
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${invoiceInstance.id}">${invoiceInstance.id}</g:link></td>
						<td>${invoiceInstance.student}</td>
						<td><g:formatDate format="dd-MMM-yyyy" date="${invoiceInstance.invoiceDate}"/></td>
						<td><g:formatNumber number="${invoiceInstance.totalFees}" type="currency" currencyCode="USD"/></td>
						<td><g:formatDate format="dd-MMM-yyyy" date="${invoiceInstance.paymentDate}"/></td>
						<td><g:formatBoolean boolean="${invoiceInstance.isPaid}" true="YES" false="NO"/></td>

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
