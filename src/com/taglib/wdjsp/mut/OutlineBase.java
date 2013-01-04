package com.taglib.wdjsp.mut;

import javax.servlet.jsp.tagext.TagSupport;

public class OutlineBase extends TagSupport {
    private OutlineBase outlineParent = null;
    int count = 0;
    int childCount = 0;

    public OutlineBase getOutlineParent () {
	return outlineParent;
    }
    public OutlineBase fetchOutlineParent () {
	outlineParent =
	    (OutlineBase) findAncestorWithClass(this, OutlineBase.class);
	return outlineParent;
    }

    public int getCount () {
	return count;
    }
    public void setCount (int count) {
	this.count = count;
    }

    public int getChildCount () {
	return childCount;
    }
    public void addChild (OutlineBase child) {
	child.setCount(++childCount);
    }

    public String getLabel () {
	if (outlineParent == null) {
	    return "";
	} else {
	    return "&nbsp;&nbsp;" + 
		outlineParent.getLabel() + Integer.toString(count) + ".";
	}
    }

    public void release () {
	super.release();
	outlineParent = null;
	count = 0;
	childCount = 0;
    }
}
