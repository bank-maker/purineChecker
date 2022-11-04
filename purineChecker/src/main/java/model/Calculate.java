package model;

public class Calculate {
	//100gあたりのプリン体含有量の計算
	public void calculatePurine(Food f) {
		f.setPurineContent(f.getStandardContent() / 100 * f.getQuantity());
	}
}
