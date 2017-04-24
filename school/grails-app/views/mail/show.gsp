
<%@ page import="com.academy.maars.school.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
        <title ><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            //h1 {color:red;}
            //p {color:blue;}
            //table, th, td {border: 1px solid black;}
            table {
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid orange;
                padding: 10px;
                text-align: left;
            }

        </style>

    </head>
    <body>
        <h1 style="text-align: center;">STATEMENT</h1>

        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>

        <div class="body">
            <h1>MAARS ACADEMY: STUDENT STATEMENT</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="dialog">
                <h2><span style="color: #993300;">INVOICE DETAILS</span></h2>
<!-- 
<table style="height: 74px;" width="568">
-->
                <table><tbody>
                    <tr>
                        <td>Invoice No</td>
                        <td>Invoice Date</td>
                        <td>Invoice Amount</td>
                        <td>Payment Date</td>
                        <td>Check No</td>
                        <td>Check Amount</td>
                        <td>Paid</td>
                    </tr>

                    <tr>
                        <!-- 
                        <table style="height: 74px;" width="568">
                        -->
                        <td>${fieldValue(bean: invoiceInstance, field: "id")}</td>
                        <td><g:formatDate format="MM-dd-yyyy" date="${invoiceInstance?.invoiceDate}"/></td>
                        <td><g:formatNumber type="currency" currencyCode="USD" number="${invoiceInstance?.invoicAmt}"/></td>
                        <td><g:formatDate format="MM-dd-yyyy" date="${invoiceInstance?.paymentDate}"/></td>
                        <td>${fieldValue(bean: invoiceInstance, field: "checkNo")}</td>
                        <td><g:formatNumber type="currency" currencyCode="USD" number="${invoiceInstance?.checkAmt}"/></td>
                        <td><g:formatBoolean boolean="${invoiceInstance?.isPaid}" true="YES" false="NO"/></td>
                    </tr>
                </tbody></table>


                <h2><span style="color: #993300;">STUDENT INFORMATION</span></h2>
                <table><tbody>
                    <tr>
                        <td>Stundent No</td>
                        <td>Student Name</td>
                        <td>M/F</td>
                        <td>Parent Name</td>
                        <td>Parent Email</td>
                    </tr>

                    <tr>
                        <td><h3><g:link controller="student" action="show" id="${invoiceInstance?.student?.id}">${invoiceInstance?.student?.id}</g:link></h3></td>
                        <td><h3>${invoiceInstance?.student?.fullName()}</h3></td>
                        <td><h3>${invoiceInstance?.student?.gender}</h3></td>
                        <td><h3>${invoiceInstance?.student?.motherName}</h3></td>
                        <td><h3>${invoiceInstance?.student?.parentEmail}</h3></td>
                    </tr>
                </tbody></table>


                <h2><span style="color: #993300;">CLASS SCHEDULE</span></h2>
                <table><tbody>
                    <tr>
                        <td>Schedule ID</td>
                        <td>Class Date</td>
                        <td>Class Time</td>
                        <td>Duration</td>
                        <td>Subject</td>
                        <td>Type</td>
                        <td>Rate</td>
                        <td>Class Fee</td>
                    </tr>

                    <g:each in="${invoiceInstance.schedules}" var="s">
                        <tr>
                            <td><g:link controller="schedule" action="show" id="${s.id}">${s?.id}</g:link></td>
                            <td><g:formatDate format="MM-dd-yyyy" date="${s?.classDate}"/></td>
                            <td><g:formatDate format="HH:mm" date="${s?.classDate}"/></td>
                            <td>${s?.duration}</td>
                            <td>${s?.subject}</td>
                            <td>${s?.rate}</td>
                            <td>${s?.fee}</td>
                            <td>${s?.fee}</td>
                        </tr>
                    </g:each>
                </tbody></table>

                <!-- 
                <p style="text-align: left; padding-left: 360px;">TOTAL FEE$200</p>
                -->
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${invoiceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
