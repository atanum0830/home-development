<table>
	<thead>
		<tr>
			<g:sortableColumn property="classDate" title="${message(code: 'schedule.classDate.label', default: 'Class Date')}" />
			<g:sortableColumn property="duration" title="${message(code: 'schedule.duration.label', default: 'Duration')}" />
			<g:sortableColumn property="fee" title="${message(code: 'schedule.fee.label', default: 'Fee')}" />
			<th><g:message code="schedule.invoice.label" default="Invoice" /></th>
			<th><g:message code="schedule.rate.label" default="Rate" /></th>
			<th><g:message code="schedule.student.label" default="Student" /></th>
		</tr>
	</thead>

	<tbody>
		<g:each in="${scheduleInstanceList}" status="i" var="scheduleInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:link action="show" id="${scheduleInstance.id}">${fieldValue(bean: scheduleInstance, field: "classDate")}</g:link></td>
			<td>${fieldValue(bean: scheduleInstance, field: "duration")}</td>
			<td>${fieldValue(bean: scheduleInstance, field: "fee")}</td>
			<td>${fieldValue(bean: scheduleInstance, field: "invoice")}</td>
			<td>${fieldValue(bean: scheduleInstance, field: "rate")}</td>
			<td>${fieldValue(bean: scheduleInstance, field: "student")}</td>
		</tr>
		</g:each>
	</tbody>
</table>
