package com.taglib.wdjsp.components;
import java.util.*;

public class DiceBean {
  private Random rand;
   
  public DiceBean() {
    rand = new Random();
  }

  public int getDieRoll() {
    // return a number between 1 and 6
    return rand.nextInt(6) + 1;
  }

  public int getDiceRoll() {
    // return a number between 2 and 12
    return getDieRoll() + getDieRoll();
  }
}
