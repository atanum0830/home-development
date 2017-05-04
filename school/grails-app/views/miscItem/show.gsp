
<%@ page import="com.academy.maars.school.MiscItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'miscItem.label', default: 'MiscItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-miscItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-miscItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list miscItem">
			
				<g:if test="${miscItemInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="miscItem.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${miscItemInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${miscItemInstance?.invoice}">
				<li class="fieldcontain">
					<span id="invoice-label" class="property-label"><g:message code="miscItem.invoice.label" default="Invoice" /></span>
					
						<span class="property-value" aria-labelledby="invoice-label"><g:link controller="invoice" action="show" id="${miscItemInstance?.invoice?.id}">${miscItemInstance?.invoice?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${miscItemInstance?.itemDate}">
				<li class="fieldcontain">
					<span id="itemDate-label" class="property-label"><g:message code="miscItem.itemDate.label" default="Item Date" /></span>
					
						<span class="property-value" aria-labelledby="itemDate-label"><g:formatDate date="${miscItemInstance?.itemDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${miscItemInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="miscItem.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${miscItemInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:miscItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${miscItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
