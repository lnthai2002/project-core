package com.taglib.wdjsp.customtags;

public class IndexedBean {
    private ElementBean elements[];

    public IndexedBean () {
	int size = 1 + ElementBean.getRandomNumber()%10;
	elements = new ElementBean[size];
	for (int i = 0; i < size; ++i) {
	    elements[i] = new ElementBean(i);
	}
    }

    public int getElementSize () {
	return elements.length;
    }
    public ElementBean getElement (int index) {
	return elements[index];
    }
    public void setElement (int index, ElementBean element) {
	elements[index] = element;
    }
}
