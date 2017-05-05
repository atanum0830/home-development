package com.academy.maars.school

class Invoice {
	Date invoiceDate
	Float invoiceAmt =0.0;
	Date paymentDate
	Integer checkNo
	Float checkAmt
    String imageFileName;
	Boolean isPaid = false;

    static belongsTo = [student: Student]
    
    static hasMany = [schedules: Schedule, miscItems:MiscItem]

    static mapping = {
    	table "invoices"
    	id column: "invoice_id"
    }

    static constraints = {
    	invoiceDate blank:false, nullable:false
    	paymentDate blank:true, nullable:true
    	checkNo blank:true, nullable:true
    	checkAmt blank:true, nullable:true
        imageFileName blank:true, nullable:true
    }

    public String toString() {
        id
    }

    public Float getTotalFees() {
        float amount = schedules.sum {it.fee}
        amount = amount + miscItems.sum {it.amount}
        amount;
    }

    public Date getDueDate() {
        Date date = new Date() + 7
        date;
        //invoiceDate;
    }

}
