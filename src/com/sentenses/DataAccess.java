package com.sentence.based;

import java.util.List;

public interface DataAccess {

	public String add(DataInterface dataInterface);
	public String delete(DataInterface dataInterface);
	public String update(DataInterface dataInterface);
	public Object getById(String colName,String value,Class<?> da);
	public Object getById(String colName,long value,Class<?> da);
	public List<DataInterface> listByQuery(String hSql);
}
