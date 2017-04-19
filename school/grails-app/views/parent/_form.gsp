<%@ page import="com.academy.maars.school.Parent" %>



<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="parent.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${parentInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="parent.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${parentInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'relation', 'error')} required">
	<label for="relation">
		<g:message code="parent.relation.label" default="Relation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="relation" from="${parentInstance.constraints.relation.inList}" required="" value="${parentInstance?.relation}" valueMessagePrefix="parent.relation"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'addressLine2', 'error')} ">
	<label for="addressLine2">
		<g:message code="parent.addressLine2.label" default="Address Line2" />
		
	</label>
	<g:textField name="addressLine2" value="${parentInstance?.addressLine2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'addressLine1', 'error')} required">
	<label for="addressLine1">
		<g:message code="parent.addressLine1.label" default="Address Line1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressLine1" required="" value="${parentInstance?.addressLine1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="parent.children.label" default="Children" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${parentInstance?.children?}" var="c">
    <li><g:link controller="student" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="student" action="create" params="['parent.id': parentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'student.label', default: 'Student')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="parent.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${parentInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="parent.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${parentInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'phoneNo', 'error')} required">
	<label for="phoneNo">
		<g:message code="parent.phoneNo.label" default="Phone No" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="phoneNo" type="number" value="${parentInstance.phoneNo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'stateCode', 'error')} required">
	<label for="stateCode">
		<g:message code="parent.stateCode.label" default="State Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stateCode" required="" value="${parentInstance?.stateCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="parent.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zip" required="" value="${parentInstance?.zip}"/>

</div>

