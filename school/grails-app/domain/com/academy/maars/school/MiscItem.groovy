package com.academy.maars.school

class MiscItem {
	Date itemDate = new Date();
	String name
	Float amount;

	static belongsTo = [invoice: Invoice]

    static mapping = {
    	table "misc_items"
    	id column: "misc_item_id"
    }

    static constraints = {
    }
}
