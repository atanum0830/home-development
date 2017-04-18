package com.academy.maars.school

class Rate {
	String rateCode;
	String name;

    static mapping = {
    	table "rates"
    	id column: "rate_id"
    	//rateCode column: "rate_code", sqlType: "varchar", length: 4
    }

	static constraints = {
    	name blank:false, nullable:false
    }

    public String toString() {
    	rateCode + '(' + name + ')';
	}

}