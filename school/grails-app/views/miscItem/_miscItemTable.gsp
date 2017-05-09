<table>
<thead>
	<tr>
		<th style="width:10%"><g:message code="miscItem.invoice.label" default="Invoice No." /></th>
		<th style="width:10%">Item No.</th>
		<g:sortableColumn property="itemDate" style="width:20%"
					title="${message(code: 'miscItem.itemDate.label', default: 'Item Date')}" />
		<g:sortableColumn property="name" style="width:45%"
					title="${message(code: 'miscItem.name.label', default: 'Name')}" />
		<g:sortableColumn property="amount" style="width:15%"
					title="${message(code: 'miscItem.amount.label', default: 'Amount')}" />
	</tr> 

</thead>
<tbody>
	<g:each in="${miscItems}" status="i" var="miscItem">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>
			<g:link action="show" controller="invoice" id="${miscItem.invoice.id}">${miscItem.invoice.id}</g:link>
			</td>
			<td><g:link action="show" controller="miscItem" id="${miscItem.id}">${miscItem.id}</g:link></td>
			<td><g:formatDate format="dd-MMM-yyyy" date="${miscItem.itemDate}"/></td>
			<td>${miscItem.name}</td>
			<td><g:formatNumber number="${miscItem.amount}" type="currency" currencyCode="USD"/></td>
		</tr>
	</g:each>
</tbody>
</table>
