package com.academy.maars.school

//final static Date MIN_DATE = Calendar.instance.with { add( YEAR, -18 ) ; it }.time
//final static Date MAX_DATE = Calendar.instance.with { add( YEAR, -1 ) ; it }.time
//final static Date DEFAULT_DATE = Calendar.instance.with { add( YEAR, -5 ) ; it }.time


class Student {
	final static Date DEFAULT_DATE = findDefaultDate()

	String firstName
	String lastName
	Date birthDate = DEFAULT_DATE;
	//Date birthDate
	String gender
	Boolean kinderGarten
	String prevSchool
	String feedback
	Parent secondParent
    
	static hasMany = [schedules: Schedule, invoices: Invoice]
	
	static belongsTo = [parent: Parent]

	static constraints = {
		firstName blank:false
		lastName blank:false
		gender inList:['M','F']
		secondParent blank:true, nullable:true
		prevSchool blank:true, nullable:true
		feedback blank:true, nullable:true
		//birthDate min:MIN_DATE, max:MAX_DATE, defaultValue:DEFAULT_DATE
		//gender nullable:true
    }

    static mapping = {
    	table "students"
    	id column: "student_id"
    	gender column: "gender", sqlType: "char", length: 1
    }

    public String toString() {
    	firstName +' ' + lastName
	}

	public String fullName() {
		firstName +' ' + lastName
	}

	public static Date findDefaultDate() {
		def cal = Calendar.instance;
		cal.add(Calendar.YEAR, -6);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.time;
	}

}
