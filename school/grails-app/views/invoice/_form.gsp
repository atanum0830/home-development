<%@ page import="com.academy.maars.school.Invoice" %>



<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'invoiceDate', 'error')} required">
	<label for="invoiceDate">
		<g:message code="invoice.invoiceDate.label" default="Invoice Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="invoiceDate" precision="day"  value="${invoiceInstance?.invoiceDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'paymentDate', 'error')} ">
	<label for="paymentDate">
		<g:message code="invoice.paymentDate.label" default="Payment Date" />
		
	</label>
	<g:datePicker name="paymentDate" precision="day"  value="${invoiceInstance?.paymentDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'checkNo', 'error')} ">
	<label for="checkNo">
		<g:message code="invoice.checkNo.label" default="Check No" />
		
	</label>
	<g:field name="checkNo" type="number" value="${invoiceInstance.checkNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'checkAmt', 'error')} ">
	<label for="checkAmt">
		<g:message code="invoice.checkAmt.label" default="Check Amt" />
		
	</label>
	<g:field name="checkAmt" value="${fieldValue(bean: invoiceInstance, field: 'checkAmt')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'invoicAmt', 'error')} required">
	<label for="invoicAmt">
		<g:message code="invoice.invoicAmt.label" default="Invoice Amt" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="invoicAmt" value="${fieldValue(bean: invoiceInstance, field: 'invoicAmt')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'isPaid', 'error')} ">
	<label for="isPaid">
		<g:message code="invoice.isPaid.label" default="Is Paid" />
		
	</label>
	<g:checkBox name="isPaid" value="${invoiceInstance?.isPaid}" />

</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'schedules', 'error')} ">
	<label for="schedules">
		<g:message code="invoice.schedules.label" default="Schedules" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${invoiceInstance?.schedules?}" var="s">
    <li><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="schedule" action="create" params="['invoice.id': invoiceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'schedule.label', default: 'Schedule')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: invoiceInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="invoice.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>

	<g:if test="${invoiceInstance.student}">
		<g:link controller="student" action="show" id="${invoiceInstance?.student?.id}">
				${invoiceInstance?.student?.encodeAsHTML()}</g:link>
		<g:field id="student" type="hidden" name="student.id" value="${invoiceInstance?.student?.id}"/>
	</g:if>
	<g:else>
		<g:select id="student" name="student.id" from="${com.academy.maars.school.Student.list()}" optionKey="id" required="" value="${invoiceInstance?.student?.id}" class="many-to-one"/>
	</g:else>

</div>



