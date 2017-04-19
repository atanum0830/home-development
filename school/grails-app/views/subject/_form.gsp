<%@ page import="com.academy.maars.school.Subject" %>



<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="subject.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${subjectInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'subjectCode', 'error')} required">
	<label for="subjectCode">
		<g:message code="subject.subjectCode.label" default="Subject Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subjectCode" required="" value="${subjectInstance?.subjectCode}"/>

</div>

