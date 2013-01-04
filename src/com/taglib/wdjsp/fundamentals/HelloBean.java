package com.taglib.wdjsp.fundamentals;

public class HelloBean implements java.io.Serializable {
    String name;

    public HelloBean () {
	this.name = "World";
    }

    public String getName () {
	return name;
    }
    public void setName (String name) {
	this.name = name;
    }
}
