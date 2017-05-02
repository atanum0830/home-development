<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <style>
        * {
            box-sizing: border-box;
        }

        @page {
        size: 210mm 297mm;
        }

        .header {
            background-color: white;
            color: #00cc99;
            height: 240px;
        }

        .footer {
            background-color: #476b6b;
            color: white;
            height: 100px;
        }

        .heading-para1 {
            font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
            font-size: 4em;
            font-style: normal;
            margin: 0;
        }

        .heading-para2 {
            font-family: "Times New Roman", Times, serif;
            font-size: 30px;
            font-style: normal;
            margin: 0;
        }

        .row0col1 {
            float:left;
            background-color: white;
            width: 40%;
            height: 100px;
        }
        .row0col2 {
            float:left;
            background-color: white;
            width: 25%;
            height: 100px;
        }
        .row0col3 {
            float:left;
            background-color: white;
            width: 25%;
            height: 100px;
        }

        .row1col1 {
            float:left;
            background-color: white;
            width: 10%;
            height: 100px;
        }
        .row1col2 {
            float:left;
            background-color: white;
            width: 30%;
            height: 100px;
        }
        .row1col3 {
            float:left;
            background-color: white;
            width: 20%;
            height: 100px;
        }
        .row1col4 {
            float:left;
            background-color: white;
            width: 40%;
            height: 100px;
        }

        table {
            border-collapse: collapse;
        }
        th, td {
            border-width: 1px;
            border-style: solid;
            border-color: #808080;
            padding: 0;
            text-align: left;
            height: 20px;
        }
    </style>
</head>

<body>
    <div class="header">
        <div style='width:100%;float:left;margin:0;padding:0;text-align:center'>
            <rendering:inlinePng bytes="${rl?.findAssetForURI('maarslogo.png').byteArray}"/>
         </div>

    </div>

    <div style='height:120px;color:#00cc99;font-size:22px;margin-top:10px;margin-bottom:10px;border-color:#808080;border-style:solid;border-width:2px;'>
        <div class="row0col1">
            <h1 class='heading-para2'>Student Statement</h1>
        </div>

        <div class="row0col2" style='color:#9999ff'>
          <ul style="margin:0;list-style:none;padding-left:0">
            <li style="text-align:right;padding-right:5px">Date:</li>
            <li style="text-align:right;padding-right:5px">Statement No:</li>
            <li style="text-align:right;padding-right:5px">Student ID:</li>
            <li style="text-align:right;padding-right:5px">Student Name:</li>
          </ul>  
        </div>

        <div class="row0col3" style='color:#9999ff'>
          <ul style="margin:0;list-style:none;padding-left:0">
            <li style="text-align:left;padding-left:5px">
                <g:formatDate format="dd-MMM-yyyy" date="${invoice.invoiceDate}"/></li>
            <li style="text-align:left;padding-left:5px">${invoice.id}</li>
            <li style="text-align:left;padding-left:5px">${student.id}</li>
            <li style="text-align:left;padding-left:5px">${student.fullName()}</li>
          </ul>  
        </div>
    </div>

    <div style='margin-top:10px;height:150px;color:#00cc99;border-color:#808080;border-style:solid;border-width:px;font-size:20px'>
        <div class="row1col1">
          <ul style="margin:0;list-style:none;padding-left:0">
            <li style="text-align:right;padding-right:5px">Bill To</li>
            <li style="text-align:right;padding-right:5px">Address</li>
            <li style="text-align:right;padding-right:5px">City</li>
            <li style="text-align:right;padding-right:5px">Phone</li>
            <li style="text-align:right;padding-right:5px">E-Mail</li>
          </ul>  
        </div>

        <div class="row1col2" style='color:#9999ff'>
          <ul style="margin:0;list-style:none;padding-left:0">
            <li style="text-align:left;padding-left:5px">${parent.fullName()}</li>
            <li style="text-align:left;padding-left:5px">${parent.addressLine1}</li>
            <li style="text-align:left;padding-left:5px">${parent.cityStateZip()}</li>
            <li style="text-align:left;padding-left:5px">${parent.phoneNo}</li>
            <li style="text-align:left;padding-left:5px">${parent.email}</li>
          </ul>  
        </div>

        <div class="row1col3">
          <ul style="margin:0;list-style:none;padding-left:0">
            <li style="text-align:right;padding-right:10px">Comments</li>
          </ul>  
        </div>

        <div class="row1col4" style='color:#9999ff'>
            <p style="margin:0;">Please let us know if you have printed any incorrect information (Name, Address, Email etc.) We are trying to consolidate our database, thank you!</p>
        </div>
    </div>

    <table style='width:100%;margin-top:10px'>
        <thead style='margin:0;padding:0;'>
            <tr style='margin:0;padding:0;height:30px;background-color:black;color:white'>
                <td style='width:12%'>Schedule ID</td>
                <td style='width:12%'>Class Date</td>
                <td style='width:12%'>Class Time</td>
                <td style='width:11%'>Duration</td>
                <td style='width:23%'>Subject</td>
                <td style='width:10%'>Type</td>
                <td style='width:10%'>Rate</td>
                <td style='width:10%'>Class Fee</td>
            </tr>
        </thead>

        <tbody>
            <g:each in="${schedules}" status="count" var="schedule">
                <tr style="${(count % 2) == 0 ? 'color:#00cc99' : 'color:#00cc99;background-color:#e0ebeb;'}">
                    <td>${schedule.id}</td>
                    <td><g:formatDate format="dd-MMM-yyyy" date="${schedule.classDate}"/></td>
                    <td><g:formatDate format="HH:mm" date="${schedule.classDate}"/></td>
                    <td><g:formatNumber number="${schedule.duration}" type="number" maxFractionDigits="0"/> mins</td>
                    <td>${schedule.subject.name}</td>
                    <td>${schedule.rate.rateCode}</td>
                    <td><g:formatNumber number="${schedule.fee}" type="currency" currencyCode="USD"/></td>
                    <td><g:formatNumber number="${schedule.fee}" type="currency" currencyCode="USD"/></td>
                </tr>
            </g:each>

            <tr style='color:#00cc99'>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <table width='100%'>
        <thead>
            <tr style='margin:0;padding:0;height:30px;background-color:black;color:white'>
                <td style='width:12%'>Current</td>
                <td style='width:12%'>1-30 Days</td>
                <td style='width:12%'>31-60 Days</td>
                <td style='width:11%'>61-90 Days</td>
                <td style='width:25%'>Over 90 Days</td>
                <td style='width:28%'>Amount Due</td>
           </tr>
        </thead>

        <tbody>
            <tr style='color:#00cc99'>
                <td><g:formatNumber number="${invoice.getTotalFees()}" type="currency" currencyCode="USD" /></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><g:formatNumber number="${invoice.getTotalFees()}" type="currency" currencyCode="USD" /></td>
            </tr>
        </tbody>
    </table>

   <table style='width:30%;margin-top:10px'>
        <thead>
            <tr style='margin:0;padding:0;height:30px;background-color:black;color:white'>
                <td style='width:50%'>Remittance</td>
                <td style='width:50%'></td>
           </tr>
        </thead>

        <tbody>
            <tr style='color:#00cc99;background-color:white'>
                <td>Statement#</td>
                <td>${invoice.id}</td>
           </tr>
            <tr style='color:#00cc99;'>
                <td>Date Due</td>
                <td style='background-color:#e0ebeb'>
                    <g:formatDate format="dd-MMM-yyyy" date="${invoice.getDueDate()}"/>
                </td>
           </tr>
            <tr style='color:#00cc99;background-color:white'>
                <td>Amount Due</td>
                <td><g:formatNumber number="${invoice.getTotalFees()}" type="currency" currencyCode="USD"/></td>
           </tr>
            <tr style='color:#00cc99;'>
                <td>Amount Enclosed</td>
                <td style='background-color:#e0ebeb'><g:formatNumber number="${invoice.checkAmt}" type="currency" currencyCode="USD"/></td>
           </tr>
         </tbody>
    </table>

    <div class="footer" style='text-align:center'>
      <p style='margin-bottom:0'>All payments must be made within a week of invoice issue date, failure to do so will incur late fees</p>
      <p style='margin-bottom:0;margin-top:0'>Make all checks payable to MAARS Academy</p>
      <p style='margin-bottom:0;margin-top:0'>Thank you!</p>
      <p style='margin-bottom:0;margin-top:0'>100 Overlook Drive, Pondview Bldg A., Monroe Township, NJ 08536 | (973) 229-9988 | maarsacademy.com</p>
    </div>

</body>
</html>
