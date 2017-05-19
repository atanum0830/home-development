
<%@ page import="com.academy.maars.school.Invoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<style>
		</style>
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-invoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-invoice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<!--
Start of the page elements
-->
			<div style="float:left;height:200px;width:35%;border:1px solid grey;">
			<ol class="property-list invoice">
				<li class="fieldcontain">
					<span id="invoice-No" style="width:50%" class="property-label">Invoice No</span>

					<span class="property-value" style="margin-left:60%" aria-labelledby="student-label">${invoiceInstance.id}
					</span>
				</li>

				<g:if test="${invoiceInstance?.invoiceDate}">
				<li class="fieldcontain">
					<span id="invoiceDate-label" style="width:50%" class="property-label">
						<g:message code="invoice.invoiceDate.label" default="Invoice Date" />
					</span>
					
					<span class="property-value" style="margin-left:60%" aria-labelledby="invoiceDate-label">
						<g:formatDate format="dd-MMM-yyyy" date="${invoiceInstance?.invoiceDate}"/>
					</span>
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="invoice-total" style="width:50%" class="property-label">Invoice Total</span>

					<span class="property-value" style="margin-left:60%" aria-labelledby="student-label">
					<g:formatNumber number="${invoiceInstance.totalFees}" type="currency" currencyCode="USD"/>
					</span>
				</li>

				<g:if test="${invoiceInstance?.paymentDate}">
				<li class="fieldcontain">
					<span id="paymentDate-label" style="width:50%" class="property-label">
						<g:message code="invoice.paymentDate.label" default="Payment Date"/>
					</span>
					
					<span class="property-value" style="margin-left:60%" aria-labelledby="paymentDate-label">
						<g:formatDate format="dd-MMM-yyyy" date="${invoiceInstance?.paymentDate}"/>
					</span>
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.checkNo}">
				<li class="fieldcontain">
					<span id="checkNo-label" style="width:50%" class="property-label"><g:message code="invoice.checkNo.label" default="Check No" /></span>
					
					<span class="property-value"style="margin-left:60%" aria-labelledby="checkNo-label">
						<g:fieldValue bean="${invoiceInstance}" field="checkNo"/>
					</span>
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.checkAmt}">
				<li class="fieldcontain">
					<span id="checkAmt-label" style="width:50%" class="property-label"><g:message code="invoice.checkAmt.label" default="Check Amount" /></span>
					
					<span class="property-value" style="margin-left:60%" aria-labelledby="checkAmt-label">
						<g:fieldValue bean="${invoiceInstance}" field="checkAmt"/>
					</span>
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.imageFileName}">
				<li class="fieldcontain">
					<span id="imageFileName-label" style="width:50%" class="property-label"><g:message code="invoice.imageFileName.label" default="Image File Name" /></span>
					
					<span class="property-value" style="margin-left:60%" aria-labelledby="imageFileName-label">
						<g:fieldValue bean="${invoiceInstance}" field="imageFileName"/>
					</span>
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.invoiceAmt}">
				<li class="fieldcontain">
					<span id="invoiceAmt-label" style="width:50%" class="property-label">
						<g:message code="invoice.invoiceAmt.label" default="Invoice Amount"/>
					</span>
					
					<span class="property-value" style="margin-left:60%" aria-labelledby="invoiceAmt-label">
						<g:fieldValue bean="${invoiceInstance}" field="invoiceAmt"/>
					</span>
				</li>
				</g:if>
			
				<g:if test="${invoiceInstance?.isPaid}">
				<li class="fieldcontain">
					<span id="isPaid-lab6l" style="width:50%" class="property-label">
						<g:message code="invoice.isPaid.label" default="Is Paid"/>
					</span>
					
					<span class="property-value" style="margin-left:60%" aria-labelledby="isPaid-label">
						<g:formatBoolean boolean="${invoiceInstance?.isPaid}"/>
					</span>
				</li>
				</g:if>
			</ol>
			</div>

			<div style="float:left;height:200px;width:55%;border:1px solid grey;">
			<ol class="property-list invoice">
				<g:if test="${invoiceInstance?.student}">
					<g:set var="student" value="${invoiceInstance.student}"/>

					<li class="fieldcontain">
						<span id="student-label" style="width:50%" class="property-label">
							<g:message code="invoice.student.label" default="Student"/>
						</span>
						
						<span class="property-value" style="margin-left:60%" aria-labelledby="student-label">
							<g:link controller="student" action="show" id="${student?.id}">${student?.encodeAsHTML()}</g:link>
						</span>
					</li>

					<g:if test="${student?.parent}">
						<g:set var="parent" value="${student.parent}"/>

						<li class="fieldcontain">
							<span id="parent-label" style="width:50%" class="property-label">
								<g:message code="student.parent.label" default="Parent"/>
							</span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="parent-label">
								<g:link controller="parent" action="show" id="${parent?.id}">${parent?.encodeAsHTML()}</g:link>
							</span>
						</li>

						<g:if test="${parent?.addressLine1}">
						<li class="fieldcontain">
							<span id="addressLine1-label" style="width:50%" class="property-label">
								<g:message code="parent.addressLine1.label" default="Address Line1"/>
							</span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="addressLine1-label">
								<g:fieldValue bean="${parent}" field="addressLine1"/>
							</span>
						</li>
						</g:if>
			
						<g:if test="${parent?.city}">
						<li class="fieldcontain">
							<span id="city-label" style="width:50%" class="property-label"><g:message code="parent.city.label" default="City" /></span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="city-label">
								<g:fieldValue bean="${parent}" field="city"/>
							</span>
						</li>
						</g:if>
			
						<g:if test="${parent?.email}">
						<li class="fieldcontain">
							<span id="email-label" style="width:50%" class="property-label">
								<g:message code="parent.email.label" default="Email"/>
							</span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="email-label">
								<g:fieldValue bean="${parent}" field="email"/>
							</span>
						</li>
						</g:if>
					
						<g:if test="${parent?.phoneNo}">
						<li class="fieldcontain">
							<span id="phoneNo-label" style="width:50%" class="property-label">
								<g:message code="parent.phoneNo.label" default="Phone No"/>
							</span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="phoneNo-label">
								<g:formatNumber number="${parent?.phoneNo}" format="######" />
								<!--
									<g:fieldValue bean="${parent}" field="phoneNo"/>
								-->
							</span>
						</li>
						</g:if>
			
						<g:if test="${parent?.stateCode}">
						<li class="fieldcontain">
							<span id="stateCode-label" style="width:50%" class="property-label"><g:message code="parent.stateCode.label" default="State" /></span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="stateCode-label">
								<g:fieldValue bean="${parent}" field="stateCode"/>
							</span>
						</li>
						</g:if>
			
						<g:if test="${parent?.zip}">
						<li class="fieldcontain">
							<span id="zip-label" style="width:50%" class="property-label">
								<g:message code="parent.zip.label" default="Zip"/>
							</span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="zip-label">
								<g:fieldValue bean="${parent}" field="zip"/>
							</span>
						</li>
						</g:if>
					</g:if>

					<g:if test="${student?.secondParent}">
						<g:set var="parent" value="${student.secondParent}"/>
						<li class="fieldcontain">
							<span id="parent-label" style="width:50%" class="property-label">
								<g:message code="student.parent.label" default="Parent"/>
							</span>
							
							<span class="property-value" style="margin-left:60%" aria-labelledby="parent-label">
							<g:link controller="parent" action="show" id="${parent?.id}">${parent?.encodeAsHTML()}</g:link>
							</span>
						</li>
					</g:if>

				</g:if>

			</ol>
			</div>

			<g:if test="${invoiceInstance?.schedules}">
			<div class="fieldcontain" style="clear:left">
				<div style="float:left;width:15%">
					<span id="schedules-label" class="property-label">
						<g:message code="invoice.schedules.label" default="Schedules"/>
					</span>
				</div>
				
				<div style="float:left;width:80%">
					<g:render template="/schedule/scheduleTable" model="[schedules:invoiceInstance.schedules]"/>
				</div>
			</div>
			</g:if>

			<g:if test="${invoiceInstance?.miscItems}">
			<div class="fieldcontain">
				<div style="float:left;width:15%">
					<span id="miscItems-label" class="property-label">
						<g:message code="invoice.miscItems.label" default="Miscellaneous" />
					</span>
				</div>
				
				<div style="float:left;width:80%">
					<g:render template="/miscItem/miscItemTable" model="[miscItems:invoiceInstance.miscItems]"/>
				</div>
			</div>
			</g:if>
		
			<g:form style="clear:left;" url="[resource:invoiceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${invoiceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>

					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

					<g:link class="email" action="sendEmail" resource="${invoiceInstance}">Email</g:link>

					<g:link class="pdf" action="renderPdf" resource="${invoiceInstance}">PDF</g:link>
				</fieldset>
			</g:form>

		</div>
	</body>
</html>

