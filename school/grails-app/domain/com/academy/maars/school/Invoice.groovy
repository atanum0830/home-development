package com.academy.maars.school

class Invoice {
	Date invoiceDate
	Float invoicAmt =0.0;
	Date paymentDate
	Integer checkNo
	Float checkAmt
	Boolean isPaid = false;

    static belongsTo = [student: Student]
    
    static hasMany = [schedules: Schedule]

    static mapping = {
    	table "invoices"
    	id column: "invoice_id"
    }

    static constraints = {
    	invoiceDate blank:false, nullable:false
    	paymentDate blank:true, nullable:true
    	checkNo blank:true, nullable:true
    	checkAmt blank:true, nullable:true
    }

    public String toString() {
        id
    }

}
