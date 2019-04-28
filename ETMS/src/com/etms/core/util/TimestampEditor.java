package com.etms.core.util;

import java.sql.Timestamp;
import org.springframework.beans.propertyeditors.PropertiesEditor;

public class TimestampEditor extends PropertiesEditor {
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		//note：只能将 yyyy-MM-dd HH:mm:ss或者yyyy-M-d HH:mm:ss格式的字符串进行转换,yyyy-MM-dd是不可以的
		setValue(Timestamp.valueOf(text));
	}

	@Override
	public String getAsText() {
		return getValue().toString();
	}
}

