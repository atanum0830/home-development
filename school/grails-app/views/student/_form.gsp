<%@ page import="com.academy.maars.school.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="student.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${studentInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="student.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${studentInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="student.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${studentInstance.constraints.gender.inList}" required="" value="${studentInstance?.gender}" valueMessagePrefix="student.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'secondParent', 'error')} ">
	<label for="secondParent">
		<g:message code="student.secondParent.label" default="Second Parent" />
		
	</label>
	<g:select id="secondParent" name="secondParent.id" from="${com.academy.maars.school.Parent.list()}" optionKey="id" value="${studentInstance?.secondParent?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'prevSchool', 'error')} ">
	<label for="prevSchool">
		<g:message code="student.prevSchool.label" default="Prev School" />
		
	</label>
	<g:textField name="prevSchool" value="${studentInstance?.prevSchool}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'feedback', 'error')} ">
	<label for="feedback">
		<g:message code="student.feedback.label" default="Feedback" />
		
	</label>
	<g:textField name="feedback" value="${studentInstance?.feedback}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="student.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${studentInstance?.birthDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'invoices', 'error')} ">
	<label for="invoices">
		<g:message code="student.invoices.label" default="Invoices" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.invoices?}" var="i">
    <li><g:link controller="invoice" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="invoice" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'invoice.label', default: 'Invoice')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'preKinder', 'error')} ">
	<label for="preKinder">
		<g:message code="student.kinderGarten.label" default="Kinder Garten" />
		
	</label>
	<g:checkBox name="preKinder" value="${studentInstance?.preKinder}" />

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="student.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${com.academy.maars.school.Parent.list()}" optionKey="id" required="" value="${studentInstance?.parent?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'schedules', 'error')} ">
	<label for="schedules">
		<g:message code="student.schedules.label" default="Schedules" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.schedules?}" var="s">
    <li><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="schedule" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'schedule.label', default: 'Schedule')])}</g:link>
</li>
</ul>


</div>

