
<%@ page import="com.academy.maars.school.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-student" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="student.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${studentInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="student.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${studentInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="student.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${studentInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.secondParent}">
				<li class="fieldcontain">
					<span id="secondParent-label" class="property-label"><g:message code="student.secondParent.label" default="Second Parent" /></span>
					
						<span class="property-value" aria-labelledby="secondParent-label"><g:link controller="parent" action="show" id="${studentInstance?.secondParent?.id}">${studentInstance?.secondParent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.prevSchool}">
				<li class="fieldcontain">
					<span id="prevSchool-label" class="property-label"><g:message code="student.prevSchool.label" default="Prev School" /></span>
					
						<span class="property-value" aria-labelledby="prevSchool-label"><g:fieldValue bean="${studentInstance}" field="prevSchool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.feedback}">
				<li class="fieldcontain">
					<span id="feedback-label" class="property-label"><g:message code="student.feedback.label" default="Feedback" /></span>
					
						<span class="property-value" aria-labelledby="feedback-label"><g:fieldValue bean="${studentInstance}" field="feedback"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="student.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${studentInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.invoices}">
				<li class="fieldcontain">
					<span id="invoices-label" class="property-label"><g:message code="student.invoices.label" default="Invoices" /></span>
					
						<g:each in="${studentInstance.invoices}" var="i">
						<span class="property-value" aria-labelledby="invoices-label"><g:link controller="invoice" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.kinderGarten}">
				<li class="fieldcontain">
					<span id="kinderGarten-label" class="property-label"><g:message code="student.kinderGarten.label" default="Kinder Garten" /></span>
					
						<span class="property-value" aria-labelledby="kinderGarten-label"><g:formatBoolean boolean="${studentInstance?.kinderGarten}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="student.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="parent" action="show" id="${studentInstance?.parent?.id}">${studentInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.schedules}">
				<li class="fieldcontain">
					<span id="schedules-label" class="property-label"><g:message code="student.schedules.label" default="Schedules" /></span>
					
						<g:each in="${studentInstance.schedules}" var="s">
						<span class="property-value" aria-labelledby="schedules-label"><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:studentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${studentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
