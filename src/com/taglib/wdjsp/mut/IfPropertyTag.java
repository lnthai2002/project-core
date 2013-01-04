package com.taglib.wdjsp.mut;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.lang.reflect.*;
import java.beans.*;

public class IfPropertyTag extends TagSupport {
    private String name, property;
    private String action="include";

    public void setName (String name) {
	this.name = name;
    }
    public String getName () {
	return name;
    }
    public void setProperty (String property) {
	this.property = property;
    }
    public String getProperty () {
	return property;
    }
    public void setAction (String action) {
	this.action = action;
    }
    public String getAction () {
	return action;
    }

    public int doStartTag () throws JspException {
	try {
	    boolean propertyValue = evalPropertyValue();
	    boolean exclude = action.equalsIgnoreCase("exclude");
	    if (exclude) propertyValue = (! propertyValue);
	    return propertyValue ? EVAL_BODY_INCLUDE : SKIP_BODY;
	}
	catch (IntrospectionException e) {
	    throw new JspException(e.getMessage());
	}
    }

    private boolean evalPropertyValue () throws IntrospectionException {
	Object bean = pageContext.findAttribute(name);
	if (bean != null) {
	    Method reader = getPropertyReader(bean);
	    return readProperty(bean, reader);
	}
	throw new
	    IntrospectionException("Bean \"" + name +
				   "\" not found for <ifProperty> tag.");
    }
    private Method getPropertyReader (Object bean) 
	throws IntrospectionException {
	Class beanClass = bean.getClass();
	BeanInfo beanInfo = Introspector.getBeanInfo(beanClass);
	PropertyDescriptor descriptors[] =
	    beanInfo.getPropertyDescriptors();
	int stop = descriptors.length;
	for (int i = 0; i < stop; ++i) {
	    PropertyDescriptor descriptor = descriptors[i];
	    if (descriptor.getName().equals(property)
		&& (descriptor.getPropertyType() == boolean.class)) {
		return descriptor.getReadMethod();
	    }
	}
	throw new
	    IntrospectionException("Bean \"" + name +
				   "\" has no boolean property named \"" +
				   property + "\" for <ifProperty> tag.");
    }
    private boolean readProperty (Object bean, Method reader)
	throws IntrospectionException {
	try {
	    Object result = reader.invoke(bean, null);
	    return ((Boolean) result).booleanValue();
	}
	catch (InvocationTargetException e) {
	    throw new
		IntrospectionException("Unable to access " +
				       "property \"" + property +
				       "\" of bean \"" + name +
				       "\" for <ifProperty> tag.");
	}
	catch (IllegalAccessException e) {
	    throw new
		IntrospectionException("Unable to access " +
				       "property \"" + property +
				       "\" of bean \"" + name +
				       "\" for <ifProperty> tag.");
	}
    }
    public void release () {
	super.release();
	name = null; property = null;
	action="include";
    }
}
