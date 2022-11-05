package model;

import java.io.Serializable;

public class Food implements Serializable{
	//JavaBeans
	private String name;				//食品名
	private int quantity;				//摂取量(g)
	private double purineContent;		//摂取プリン体含有量
	private double standardContent;	//100gあたりのプリン体含有量
	//ｺﾝｽﾄﾗｸﾀ
	public Food(String name, int quantity) {
		this.setName(name);
		this.setQuantity(quantity);
	}
	public Food(String name) {
		this.setName(name);
	}
	public Food() {	}
	//getter, setter
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		//食品名は０文字以上
		if(name == null || name.length() == 0) {
			throw new IllegalArgumentException("名前を入力してください");
		}
		this.name = name;
	}
	public double getPurineContent() {
		return this.purineContent;
	}
	public void setPurineContent(double purineContent) {
		//数値がﾏｲﾅｽの場合はｴﾗｰ
		if(purineContent <= 0) {
			throw new IllegalArgumentException("数値がマイナスです");
		}
		this.purineContent = purineContent;
	}
	public int getQuantity() {
		return this.quantity;
	}
	public void setQuantity(int quantity) {
		//数値がﾏｲﾅｽの場合はｴﾗｰ
		if(quantity <= 0) {
			throw new IllegalArgumentException("数値がマイナスです");
		}
		this.quantity = quantity;
	}
	public double getStandardContent() {
		return this.standardContent;
	}
	public void setStandardContent(double standardContent) {
		//数値がﾏｲﾅｽの場合はｴﾗｰ
		if(standardContent <= 0) {
			throw new IllegalArgumentException("数値がマイナスです");
		}
		this.standardContent =standardContent;
	}
}
