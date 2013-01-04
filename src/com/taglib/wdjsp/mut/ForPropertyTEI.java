package com.taglib.wdjsp.mut;

import javax.servlet.jsp.tagext.*;

public class ForPropertyTEI extends TagExtraInfo {

    public ForPropertyTEI () { 
	super();
    }

    public VariableInfo[] getVariableInfo (TagData data) {
	String varName = data.getId();
	String className = data.getAttributeString("class");
	VariableInfo info =
	    new VariableInfo(varName, className, true, VariableInfo.NESTED);
	VariableInfo[] result = { info };
	return result;
    }

    public boolean isValid (TagData data) {
	return true;
    }
}
