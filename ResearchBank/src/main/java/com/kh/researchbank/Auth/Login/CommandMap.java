package com.kh.researchbank.Auth.Login;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

//request�� ��� �ִ� �Ķ���͸� Map�� ����ִ� ������ �ϴ� Ŭ����
public class CommandMap 
{
	//Hashmap ����
	Map<String,Object> map = new HashMap<String,Object>();
	
	public Object get(String key)
	{
		
		if(map.get(key)== null)
		 return "";
		
		return map.get(key);
	}
	
	//map�� key,value ����
	public void put(String key, Object value)
	{
		map.put(key, value);
	}
	
	//map �ȿ� key�� ������ ����
	public Object remove(String key)
	{
		return map.remove(key);
	}
	
	//map�� �ش� Ű�� �����ϰ� �ִ��� üũ
	public boolean containsKey(String key)
	{
		return map.containsKey(key);
	}
	
	public boolean containsValue(Object value)
	{
		return map.containsValue(value);
	}
	
	//map�� ��� ��ü �� �����
	public void clear()
	{
		map.clear();
	}
	
	//entryset : key�� value�� �ϳ��� entry�� ������
	public Set<Entry<String,Object>> entrySet()
	{
		return map.entrySet();
	}
	
    //keyset : map �ȿ� �ִ� key�� set���� ������
	public Set<String> keySet()
	{
		return map.keySet();
	}
	
	public boolean isEmpty()
	{
		return map.isEmpty();
	}
	
	//String�� Object�� �������� �ڽ��� ������ ���� Ŭ������ ���׸� Ÿ������ ����
	public void putAll(Map<? extends String, ? extends Object> m)
	{
		map.putAll(m);
	}
	
	//�ٸ� �������� CommandMap�� map�� ���� ����� �� �ֵ��� getMap �޼��带 �߰�
	public Map<String, Object> getMap()
	{
		return map;
	}
	
}
