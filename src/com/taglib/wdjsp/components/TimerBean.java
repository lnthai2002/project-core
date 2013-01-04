package com.taglib.wdjsp.components;

public class TimerBean {
  private long start;

  public TimerBean() {
    start = System.currentTimeMillis();
  }

  public long getElapsedMillis() {
    long now = System.currentTimeMillis();
    return now - start;
  }

  public long getElapsedSeconds() {
    return (long)this.getElapsedMillis() / 1000;
  }
  
  public long getElapsedMinutes() {
    return (long)this.getElapsedMillis() / 60000;
  }
  
  public void reset() {
    start = System.currentTimeMillis();
  }
  
  public long getStartTime() {
    return start;
  }

  public void setStartTime(long time) {
    if (time <= 0)
      reset();
    else
      start = time;
  }
}
