package com.academy.maars.school

class Parent {
	String firstName
	String lastName
	Long phoneNo
	String email
	String relation
	String addressLine1
	String addressLine2
	String city = 'Monroe Twp';
	String stateCode = 'NJ';
	String zip = '08831';
	
	static hasMany = [children: Student]
	
    static mapping = {
    	table "parents"
    	id column: "parent_id"
    	stateCode column: "state_code", sqlType: "char", length: 2
		zip column: "zip", sqlType: "char", length: 5
    }

    static constraints = {
		firstName blank:false
		lastName blank:false
		relation inList:['Mother','Father']
		addressLine2 blank:true, nullable:true
    }

    public String toString() {
    	id + ':' + firstName + ' ' + lastName + '(' + relation + ')'
    }
}


