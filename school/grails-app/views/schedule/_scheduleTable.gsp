<table>
<thead>
	<tr>
		<th style="width:25%"><g:message code="schedule.student.label" default="Student" /></th>
		<th style="width:5%">No.</th>
		<g:sortableColumn property="classDate" style="width:15%"
				title="${message(code: 'schedule.classDate.label', default: 'Date')}" />
		<th style="width:15%">Description</th>
		<th style="width:10%">Start</th>
		<th style="width:10%">Close</th>
		<g:sortableColumn property="duration" style="width:5%"
				title="${message(code: 'schedule.duration.label', default: 'Mins')}" />
		<th style="width:5%">Type</th>
		<th style="width:5%">Rate</th>
		<th style="width:5%">Fee</th>
	</tr>
</thead>
<tbody>
	<g:each in="${schedules}" status="i" var="schedule">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<td style="white-space:nowrap">
			<g:link action="show" controller="student" id="${schedule.student.id}">${schedule.student}</g:link>
		</td>
		<td style="white-space:nowrap">
			<g:link action="show" controller="schedule" id="${schedule.id}">${schedule.id}</g:link>
		</td>
		<td style="white-space:nowrap"><g:formatDate format="dd-MMM-yyyy" date="${schedule.classDate}"/></td>
		<td style="white-space:nowrap">${schedule.subject}</td>
		<td style="white-space:nowrap"><g:formatDate format="hh:mm a" date="${schedule.classDate}"/></td>
		<td style="white-space:nowrap"><g:formatDate format="hh:mm a" date="${schedule.endTime}"/></td>
		<td style="white-space:nowrap">${schedule.duration}</td>
		<td style="white-space:nowrap">${schedule.rate.rateCode}</td>
		<td style="white-space:nowrap">
			<g:formatNumber number="${schedule.fee}" type="currency" currencyCode="USD"/>
		</td>
		<td style="white-space:nowrap">
			<g:formatNumber number="${schedule.classFee}" type="currency" currencyCode="USD"/>
		</td>
		</tr>
	</g:each>
</tbody>
</table>


