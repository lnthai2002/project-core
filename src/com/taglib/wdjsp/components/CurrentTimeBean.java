package com.taglib.wdjsp.components;
import java.util.*;

public class CurrentTimeBean {
  private int hours;
  private int minutes;
  
  public CurrentTimeBean() {
    Calendar now = Calendar.getInstance();
    this.hours = now.get(Calendar.HOUR_OF_DAY);
    this.minutes = now.get(Calendar.MINUTE);
  }
   
  public int getHours() {
    return hours;
  }

  public int getMinutes() {
    return minutes;
  }
}
