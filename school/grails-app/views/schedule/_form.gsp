<%@ page import="com.academy.maars.school.Schedule" %>



<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'classDate', 'error')} required">
	<label for="classDate">
		<g:message code="schedule.classDate.label" default="Class Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="classDate" precision="day"  value="${scheduleInstance?.classDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'duration', 'error')} required">
	<label for="duration">
		<g:message code="schedule.duration.label" default="Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duration" value="${fieldValue(bean: scheduleInstance, field: 'duration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'fee', 'error')} required">
	<label for="fee">
		<g:message code="schedule.fee.label" default="Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fee" value="${fieldValue(bean: scheduleInstance, field: 'fee')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'invoice', 'error')} required">
	<label for="invoice">
		<g:message code="schedule.invoice.label" default="Invoice" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="invoice" name="invoice.id" from="${com.academy.maars.school.Invoice.list()}" optionKey="id" required="" value="${scheduleInstance?.invoice?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="schedule.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rate" name="rate.id" from="${com.academy.maars.school.Rate.list()}" optionKey="id" required="" value="${scheduleInstance?.rate?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="schedule.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${com.academy.maars.school.Student.list()}" optionKey="id" required="" value="${scheduleInstance?.student?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="schedule.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subject" name="subject.id" from="${com.academy.maars.school.Subject.list()}" optionKey="id" required="" value="${scheduleInstance?.subject?.id}" class="many-to-one"/>

</div>

