<table>
<tbody>
	<g:each in="${students}" status="count" var="student">
		<tr class="${(count % 2) == 0 ? 'even' : 'odd'}">
			<td><g:link controller="student" action="show" id="${student.id}">
				${student?.id.encodeAsHTML()}
			</g:link></td>
			<td>${student?.firstName}</td>
			<td>${student?.lastName}</td>
			<td>${student?.gender}</td>
		</tr>
	</g:each>
</tbody>
</table>
