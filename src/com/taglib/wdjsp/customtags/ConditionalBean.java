package com.taglib.wdjsp.customtags;

import java.util.Date;

public class ConditionalBean {

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
