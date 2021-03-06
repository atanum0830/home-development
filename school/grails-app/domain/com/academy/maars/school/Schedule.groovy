package com.academy.maars.school
import groovy.time.TimeCategory
import groovy.time.TimeDuration

class Schedule {
	Date classDate
	Subject subject
	Float duration
	Rate rate
	Float fee
	Boolean attended = true;
	String notes
	
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
		notes blank:true, nullable:true
		//invoice nullable:true
	}

	public Date getEndTime() {
		TimeDuration td = new TimeDuration((int)0, (int)duration, (int)0, (int)0);
		Date date = classDate;
		use (TimeCategory) {
			date = date + td;
		}

		date
	}

	public Float getClassFee() {
		float classFee = fee;
		if (isHourly()) {
			float hours = (duration/60.0);
			classFee = hours * fee;
		} else if (isDaily()) {
			//float hours = (duration/60.0);
			classFee = duration * fee;
		} else if (isWeekly()) {
			//float hours = (duration/60.0);
			classFee = duration * fee;
		} else if (isMonthly()) {
			//float hours = (duration/60.0);
			classFee = duration * fee;
		}

		classFee
	}

    public Boolean isHourly() {
        rate.isHourly()
    }

    public Boolean isDaily() {
        rate.isDaily()
    }

    public Boolean isWeekly() {
        rate.isWeekly()
    }

    public Boolean isMonthly() {
        rate.isMonthly()
    }
}
