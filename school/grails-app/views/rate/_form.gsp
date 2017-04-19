<%@ page import="com.academy.maars.school.Rate" %>



<div class="fieldcontain ${hasErrors(bean: rateInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="rate.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${rateInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rateInstance, field: 'rateCode', 'error')} required">
	<label for="rateCode">
		<g:message code="rate.rateCode.label" default="Rate Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rateCode" required="" value="${rateInstance?.rateCode}"/>

</div>

