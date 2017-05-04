package com.academy.maars.school

class MiscItem {
	Date itemDate = new Date();
	String name
	Float amount;

	static belongsTo = [invoice: Invoice]

    static constraints = {
    }
}
