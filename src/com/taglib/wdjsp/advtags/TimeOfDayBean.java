package com.taglib.wdjsp.advtags;

import java.util.Date;

public class TimeOfDayBean {

    public int getHour () {
	Date now = new Date();
	return now.getHours();
    }
    public boolean isMorning () {
	int hour = getHour();
	return (hour >= 6) && (hour < 12);
    }

    public boolean isAfternoon () {
	int hour = getHour();
	return (hour >= 12) && (hour < 18);
    }

    public boolean getDaytime () {
	return isMorning() || isAfternoon();
    }
}
