package com.taglib.wdjsp.commontasks;

public class FormBean {
  
  private String name;
  private String email;
  private String ssn;
  
  public FormBean() {
    name = "";
    email = "";
    ssn = "";
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getEmail() {
    return email;
  }

  public void setSsn(String ssn) {
    this.ssn = ssn;
  }

  public String getSsn() {
    return ssn;
  }
}
