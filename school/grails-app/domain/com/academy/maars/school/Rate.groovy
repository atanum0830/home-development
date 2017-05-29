package com.academy.maars.school

class Rate {
	String rateCode;
    String type;
	String name;

    static mapping = {
    	table "rates"
    	id column: "rate_id"
    	//rateCode column: "rate_code", sqlType: "varchar", length: 4
    }

	static constraints = {
    	name blank:false, nullable:false
        type inList:['H','F','T']   // H:Halfday, F:Fullday, T:Tuition 
    }

    public String toString() {
    	rateCode + '(' + name + ')';
	}

    public Boolean isHourly() {
        rateCode == "HOURLY"
    }

    public Boolean isDaily() {
        rateCode == "DAILY"
    }

    public Boolean isWeekly() {
        rateCode == "WEEKLY"
    }

    public Boolean isMonthly() {
        rateCode == "MONTHLY"
    }
}