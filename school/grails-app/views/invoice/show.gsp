
<%@ page import="com.academy.maars.school.Invoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-invoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-invoice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list invoice">
			
				<g:if test="${invoiceInstance?.invoiceDate}">
				<li class="fieldcontain">
					<span id="invoiceDate-label" class="property-label"><g:message code="invoice.invoiceDate.label" default="Invoice Date" /></span>
					
						<span class="property-value" aria-labelledby="invoiceDate-label"><g:formatDate date="${invoiceInstance?.invoiceDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.paymentDate}">
				<li class="fieldcontain">
					<span id="paymentDate-label" class="property-label"><g:message code="invoice.paymentDate.label" default="Payment Date" /></span>
					
						<span class="property-value" aria-labelledby="paymentDate-label"><g:formatDate date="${invoiceInstance?.paymentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.checkNo}">
				<li class="fieldcontain">
					<span id="checkNo-label" class="property-label"><g:message code="invoice.checkNo.label" default="Check No" /></span>
					
						<span class="property-value" aria-labelledby="checkNo-label"><g:fieldValue bean="${invoiceInstance}" field="checkNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.checkAmt}">
				<li class="fieldcontain">
					<span id="checkAmt-label" class="property-label"><g:message code="invoice.checkAmt.label" default="Check Amt" /></span>
					
						<span class="property-value" aria-labelledby="checkAmt-label"><g:fieldValue bean="${invoiceInstance}" field="checkAmt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.invoicAmt}">
				<li class="fieldcontain">
					<span id="invoicAmt-label" class="property-label"><g:message code="invoice.invoicAmt.label" default="Invoic Amt" /></span>
					
						<span class="property-value" aria-labelledby="invoicAmt-label"><g:fieldValue bean="${invoiceInstance}" field="invoicAmt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.isPaid}">
				<li class="fieldcontain">
					<span id="isPaid-label" class="property-label"><g:message code="invoice.isPaid.label" default="Is Paid" /></span>
					
						<span class="property-value" aria-labelledby="isPaid-label"><g:formatBoolean boolean="${invoiceInstance?.isPaid}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.schedules}">
				<li class="fieldcontain">
					<span id="schedules-label" class="property-label"><g:message code="invoice.schedules.label" default="Schedules" /></span>
					
						<g:each in="${invoiceInstance.schedules}" var="s">
						<span class="property-value" aria-labelledby="schedules-label"><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="invoice.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${invoiceInstance?.student?.id}">${invoiceInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:invoiceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${invoiceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
