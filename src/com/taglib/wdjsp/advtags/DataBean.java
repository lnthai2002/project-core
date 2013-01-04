package com.taglib.wdjsp.advtags;

import java.util.Random;

public class DataBean {
    private double x, y;

    public DataBean () {
	this(randomCoordinate(), randomCoordinate());
    }

    public DataBean (double x, double y) {
	this.x = x;
	this.y = y;
    }
    public double getX () {
	return x;
    }
    public void setX (double x) {
	this.x = x;
    }
    public double getY () {
	return y;
    }
    public void setY (double y) {
	this.y = y;
    }
    
    static private Random rnd = new Random();
    static private double randomCoordinate () {
	return 100d * rnd.nextDouble();
    }
}
