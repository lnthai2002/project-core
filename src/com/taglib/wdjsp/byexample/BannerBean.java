package com.taglib.wdjsp.byexample;
import java.util.Random;

public class BannerBean {
    private int index, count;
    static private String[] BANNER_URLS = {
	"/webdev/byexample/images/PlainBanner.gif",
	"/webdev/byexample/images/StripedBanner.gif",
	"/webdev/byexample/images/SpottedBanner.gif" };
    public BannerBean () {
	count = BANNER_URLS.length;
	Random r = new Random();
	index = r.nextInt(count);
    }
    private int nextIndex () {
	if (++index == count) index = 0;
	return index;
    }
    public String getBannerURL () {
	return BANNER_URLS[nextIndex()];
    }
}
