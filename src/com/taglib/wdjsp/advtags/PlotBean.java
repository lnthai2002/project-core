package com.taglib.wdjsp.advtags;

public class PlotBean {
    private DataBean dataPoints[];

    public PlotBean () {
	makeDataPoints(0);
    }
    public int getDataSize () {
	return dataPoints.length;
    }
    public void setDataSize (int size) {
	makeDataPoints(size);
    }
    public DataBean getData (int index) {
	return dataPoints[index];
    }
    public void setData (int index, DataBean data) {
	dataPoints[index] = data;
    }

    private void makeDataPoints (int count) {
	dataPoints = new DataBean[count];
	for (int i = 0; i < count; ++i) {
	    dataPoints[i] = new DataBean();
	}
    }
}
