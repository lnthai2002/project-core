package com.taglib.wdjsp.components;

public class CompoundInterestBean {
  private double interestRate;
  private int years;
  private double principal;
  private int compounds;

  public CompoundInterestBean() {
    this(12);
  }

  public CompoundInterestBean(int compounds) {
    this.compounds = compounds;
    this.interestRate = -1;
    this.years = -1;
    this.principal = -1;
  }

  /*
    FV = Principal(1 + i/12)^(12 * years)
    assuming 12 compounding periods per year
  */
  public double getFutureValue() {
    if ((compounds != -1) &&
	(interestRate != -1 ) &&
	(years != -1))
      return principal * Math.pow(1 + interestRate/compounds, compounds * 12);
    else throw new RuntimeException("Bean requires configuration!");
  }

  public void setInterestRate(double rate) {
    if (rate > 0)
      this.interestRate = rate;
    else
      this.interestRate = 0;
  }

  public double getInterestRate() {
    return this.interestRate;
  }

  public void setYears(int years) {
    if (years >=1 )
      this.years = years;
    else
      this.years = 1;
  }

  public int getYears() {
    return this.years;
  }

  public void setPrincipal(double principal) {
    this.principal = principal;
  }

  public double getPrincipal() {
    return this.principal;
  }

  public static void main(String[] args) {
    CompoundInterestBean bean = new CompoundInterestBean();
    bean.setInterestRate(0.06);
    bean.setYears(30);
    bean.setPrincipal(1200.00);
    System.out.println("FutureValue = " + bean.getFutureValue());
  }
}
