
<%@ page import="com.academy.maars.school.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-student" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="firstName" title="${message(code: 'student.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'student.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="preKinder" title="${message(code: 'student.preKinder.label', default: 'Pre-K')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'student.gender.label', default: 'Gender')}" />
					
						<th><g:message code="student.parent.label" default="Parent 1" /></th>
						<th><g:message code="student.secondParent.label" default="Parent 2" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentInstanceList}" status="i" var="studentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "firstName")}</g:link></td>
						<td>${fieldValue(bean: studentInstance, field: "lastName")}</td>
						<td><g:formatBoolean boolean="${studentInstance.preKinder}" true="YES" false="NO"/></td>
						<td>${fieldValue(bean: studentInstance, field: "gender")}</td>
						<td>${fieldValue(bean: studentInstance, field: "parent")}</td>
						<td>${fieldValue(bean: studentInstance, field: "secondParent")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
