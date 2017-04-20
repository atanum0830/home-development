<table>
	<tbody>
		<g:each in="${schedules}" status="count" var="schedule">
			<tr class="${(count % 2) == 0 ? 'even' : 'odd'}">
				<td>${schedule.id}</td>
				<td>${schedule.classDate}</td>
				<td>${schedule.duration}</td>
				<td>${schedule.fee}</td>
				<td>${schedule.invoice}</td>
				<td>${schedule.rate}</td>
				<td>${schedule.student}</td>
			</tr>
		</g:each>
	</tbody>
</table>
