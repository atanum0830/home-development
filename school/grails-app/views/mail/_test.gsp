<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <style>
        * {
            box-sizing: border-box;
        }

        @page {
        size: 300mm 400mm;
        }

        .header {
            background-color: white;
            color: #00cc99;
            height: 80px;
        }

        .footer {
            background-color: #476b6b;
            color: white;
            height: 80px;
        }

        .heading-para1 {
            font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
            font-size: 2em;
            font-style: normal;
            margin: 0;
        }

        .heading-para2 {
            font-family: "Times New Roman", Times, serif;
            font-size: 2em;
            font-style: italic;
            margin: 0;
        }

        .row0col1 {
            float:left;
            background-color: white;
            width: 60%;
            height: 100px;
        }
        .row0col2 {
            float:left;
            background-color: white;
            width: 20%;
            height: 100px;
        }
        .row0col3 {
            float:left;
            background-color: white;
            width: 20%;
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
        <div style='width:50%;float:left;margin:0'>
            <h1 class='heading-para1'>MAARS ACADEMY</h1>
        </div>

        <div style='width:50%;margin:0;float:right;text-align:right;padding-right:30px'>
            <h1 class='heading-para2'>Statement</h1>
        </div>
    </div>

    <div style='height:80px;color:#00cc99'>
        <div class="row0col1">
          <ul style="margin:0;list-style:none;padding-left:0">
          </ul>  
        </div>

        <div class="row0col2" style='color:#9999ff'>
          <ul style="margin:0;list-style:none;padding-left:0;font-size:14px">
            <li style="text-align:right;padding-right:5px;font-size:18px">Date:</li>
            <li style="text-align:right;padding-right:5px;font-size:18px">Statement#:</li>
            <li style="text-align:right;padding-right:5px;font-size:18px">Student ID:</li>
            <li style="text-align:right;padding-right:5px;font-size:18px">Student Name:</li>
          </ul>  
        </div>

        <div class="row0col3" style='color:#9999ff'>
          <ul style="margin:0;list-style:none;padding-left:0">
            <li style="text-align:left;padding-left:5px">05-23-2017</li>
            <li style="text-align:left;padding-left:5px">34788709</li>
            <li style="text-align:left;padding-left:5px">MT007880</li>
            <li style="text-align:left;padding-left:5px">David Beckham</li>
          </ul>  
        </div>
    </div>

    <div style='margin-top:10px;height:150px;color:#00cc99;border-color:#808080;border-style:solid;border-width:2px'>
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
            <li style="text-align:left;padding-left:5px">David Beckham</li>
            <li style="text-align:left;padding-left:5px">28 St Stephen Rd</li>
            <li style="text-align:left;padding-left:5px">Aberdeen, NJ 09620</li>
            <li style="text-align:left;padding-left:5px">(732)456-4672</li>
            <li style="text-align:left;padding-left:5px">dbeckham@gmail.com</li>
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
            <tr style='color:#00cc99'>
                <td>2300911</td>
                <td>04-05-2017</td>
                <td>05:30 PM</td>
                <td>1:00 HR</td>
                <td>Language</td>
                <td>HOURLY</td>
                <td>$45.00</td>
                <td>$45.00</td>
            </tr>
            <tr style='color:#00cc99;background-color:#e0ebeb;'>
                <td>2300912</td>
                <td>04-12-2017</td>
                <td>05:30 PM</td>
                <td>1:00 HR</td>
                <td>Language</td>
                <td>HOURLY</td>
                <td>$45.00</td>
                <td>$45.00</td>
            </tr>

            <tr style='color:#00cc99'>
                <td>2300913</td>
                <td>04-19-2017</td>
                <td>05:30 PM</td>
                <td>1:00 HR</td>
                <td>Language</td>
                <td>HOURLY</td>
                <td>$45.00</td>
                <td>$45.00</td>
            </tr>

            <tr style='color:#00cc99;background-color:#e0ebeb;'>
                <td>2300914</td>
                <td>04-26-2017</td>
                <td>05:30 PM</td>
                <td>1:00 HR</td>
                <td>Language</td>
                <td>HOURLY</td>
                <td>$45.00</td>
                <td>$45.00</td>
            </tr>
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
                <td>$450.00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>$450.00</td>
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
                <td>23676529</td>
           </tr>
            <tr style='color:#00cc99;'>
                <td>Date</td>
                <td style='background-color:#e0ebeb'>04-12-2017</td>
           </tr>
            <tr style='color:#00cc99;background-color:white'>
                <td>Statement#</td>
                <td>23676529</td>
           </tr>
            <tr style='color:#00cc99;'>
                <td>Date</td>
                <td style='background-color:#e0ebeb'>04-12-2017</td>
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
