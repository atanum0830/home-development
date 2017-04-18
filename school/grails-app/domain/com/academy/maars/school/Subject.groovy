package com.academy.maars.school

class Subject {
	String subjectCode;
	String name;

    static mapping = {
    	table "subjects"
    	id column: "subject_id"
    	//subjectCode column: "subject_code", sqlType: "varchar", length: 5
    }

    static constraints = {
    	name blank:false, nullable:false
    }

    public String toString() {
    	name + '(' + subjectCode + ')'
	}

}
