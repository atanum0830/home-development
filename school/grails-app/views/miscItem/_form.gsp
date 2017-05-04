<%@ page import="com.academy.maars.school.MiscItem" %>



<div class="fieldcontain ${hasErrors(bean: miscItemInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="miscItem.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: miscItemInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: miscItemInstance, field: 'invoice', 'error')} required">
	<label for="invoice">
		<g:message code="miscItem.invoice.label" default="Invoice" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="invoice" name="invoice.id" from="${com.academy.maars.school.Invoice.list()}" optionKey="id" required="" value="${miscItemInstance?.invoice?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: miscItemInstance, field: 'itemDate', 'error')} required">
	<label for="itemDate">
		<g:message code="miscItem.itemDate.label" default="Item Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="itemDate" precision="day"  value="${miscItemInstance?.itemDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: miscItemInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="miscItem.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${miscItemInstance?.name}"/>

</div>

