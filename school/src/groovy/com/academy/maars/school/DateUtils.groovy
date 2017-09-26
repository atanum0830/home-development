package com.academy.maars.school

import groovy.time.TimeCategory

class DateUtils {
    public static Date findCurMonthStartDate() {
        def startDate = findStartDate();
        startDate
    }

    public static Date findCurMonthEndDate() {
        def endDate = findEndDate();
        endDate
    }

    public static Date findNextMonthStartDate() {
        def startDate = findStartDate();
        use (TimeCategory) {
            startDate = startDate + 1.month;
        }

        startDate
    }

    public static Date findNextMonthEndDate() {
        def endDate = findEndDate();
        use (TimeCategory) {
            endDate = endDate + 1.month;
        }

        endDate
    }

    public static Date findPrevMonthStartDate() {
        def startDate = findStartDate();
        use (TimeCategory) {
            startDate = startDate - 1.month;
        }

        startDate
    }

    public static Date findPrevMonthEndDate() {
        def endDate = findEndDate();
        use (TimeCategory) {
            endDate = endDate - 1.month;
        }

        endDate
    }

    private static Date findStartDate() {
        def startDate = new Date();
        startDate.set(date:1, hourOfDay:0, minute:0, second:0);
        use (TimeCategory) {
            startDate = startDate - 1;
        }

        startDate.set(hourOfDay:23, minute:59, second:59);

        startDate
    }

    private static Date findEndDate() {
        def endDate = new Date();
        endDate.set(date:1, hourOfDay:0, minute:0, second:0);
        use (TimeCategory) {
            endDate = endDate + 1.month;
            endDate = endDate - 1;
        }

        endDate.set(hourOfDay:23, minute:59, second:59);

        endDate
    }

}