<table>
<thead>
	<tr>
		<th style="width:35%"><g:message code="schedule.student.label" default="Student" /></th>
		<th style="width:5%">Class No.</th>
		<g:sortableColumn property="classDate" style="width:20%"
				title="${message(code: 'schedule.classDate.label', default: 'Class Date')}" />
		<th style="width:15%">Start Time</th>
		<th style="width:15%">End Time</th>
		<g:sortableColumn property="duration" style="width:10%"
				title="${message(code: 'schedule.duration.label', default: 'Duration')}" />
	</tr>
</thead>
<tbody>
	<g:each in="${schedules}" status="i" var="schedule">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<td>
		<g:link action="show" controller="student" id="${schedule.student.id}">${schedule.student}</g:link>
		</td>
		<td><g:link action="show" controller="schedule" id="${schedule.id}">${schedule.id}</g:link></td>
		<td><g:formatDate format="dd-MMM-yyyy" date="${schedule.classDate}"/></td>
		<td><g:formatDate format="hh:mm a" date="${schedule.classDate}"/></td>
		<td><g:formatDate format="hh:mm a" date="${schedule.endTime}"/></td>
		<td>${schedule.duration}</td>
		</tr>
	</g:each>
</tbody>
</table>
