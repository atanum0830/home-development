
<%@ page import="com.academy.maars.school.Rate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rate.label', default: 'Rate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-rate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-rate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rate">
			
				<g:if test="${rateInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="rate.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${rateInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rateInstance?.rateCode}">
				<li class="fieldcontain">
					<span id="rateCode-label" class="property-label"><g:message code="rate.rateCode.label" default="Rate Code" /></span>
					
						<span class="property-value" aria-labelledby="rateCode-label"><g:fieldValue bean="${rateInstance}" field="rateCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:rateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${rateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
