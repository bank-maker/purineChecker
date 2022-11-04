package model;

public class Print {
	//プリン体含有量の表示
	public void printPurine(Food f) {
		System.out.println(f.getName());
		System.out.println("100gあたりのプリン体含有量は" +
			f.getStandardContent() + "です");
	}
	//プリン体摂取量の合計を計算
	public void printTotalPurine(Food[] f) {
		double total = 0;
		for(Food food : f) {
			total += food.getPurineContent();
		}
		System.out.println("プリン体摂取量合計は" + total + "gです");
	}
}
