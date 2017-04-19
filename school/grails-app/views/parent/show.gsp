
<%@ page import="com.academy.maars.school.Parent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parent.label', default: 'Parent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parent">
			
				<g:if test="${parentInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="parent.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${parentInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="parent.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${parentInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.relation}">
				<li class="fieldcontain">
					<span id="relation-label" class="property-label"><g:message code="parent.relation.label" default="Relation" /></span>
					
						<span class="property-value" aria-labelledby="relation-label"><g:fieldValue bean="${parentInstance}" field="relation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.addressLine2}">
				<li class="fieldcontain">
					<span id="addressLine2-label" class="property-label"><g:message code="parent.addressLine2.label" default="Address Line2" /></span>
					
						<span class="property-value" aria-labelledby="addressLine2-label"><g:fieldValue bean="${parentInstance}" field="addressLine2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.addressLine1}">
				<li class="fieldcontain">
					<span id="addressLine1-label" class="property-label"><g:message code="parent.addressLine1.label" default="Address Line1" /></span>
					
						<span class="property-value" aria-labelledby="addressLine1-label"><g:fieldValue bean="${parentInstance}" field="addressLine1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="parent.children.label" default="Children" /></span>
					
						<g:each in="${parentInstance.children}" var="c">
						<span class="property-value" aria-labelledby="children-label"><g:link controller="student" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="parent.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${parentInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="parent.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${parentInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.phoneNo}">
				<li class="fieldcontain">
					<span id="phoneNo-label" class="property-label"><g:message code="parent.phoneNo.label" default="Phone No" /></span>
					
						<span class="property-value" aria-labelledby="phoneNo-label"><g:fieldValue bean="${parentInstance}" field="phoneNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.stateCode}">
				<li class="fieldcontain">
					<span id="stateCode-label" class="property-label"><g:message code="parent.stateCode.label" default="State Code" /></span>
					
						<span class="property-value" aria-labelledby="stateCode-label"><g:fieldValue bean="${parentInstance}" field="stateCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="parent.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${parentInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:parentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${parentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
