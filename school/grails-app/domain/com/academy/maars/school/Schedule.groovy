package com.academy.maars.school

class Schedule {
	Date classDate
	Subject subject
	Float duration
	Rate rate
	Float fee
	
	static belongsTo = [student: Student, invoice: Invoice]
	//static belongsTo = [student: Student]

    static mapping = {
    	table "schedules"
    	id column: "schedule_id"
    }

    static constraints = {
		//scheduleId unique:true, blank:false
		classDate blank:false
		duration blank:false
		fee blank:false
		//invoice nullable:true
	}
}
