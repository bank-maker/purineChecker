package model;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		//製造担当の各種ｲﾝｽﾀﾝｽを生成
		Calculate c = new Calculate();
		Print p = new Print();
		//入力を受け付けるスキャナを生成
		Scanner sc = new Scanner(System.in);
		System.out.println("食品の数を入力してください");
		int n = sc.nextInt();		//登録品目数
		Food[] f = new Food[n];		//品目数分の配列を定義

		//登録品目数分のｲﾝｽﾀﾝｽを生成
		for(int i = 0; i < n; i++) {
			System.out.println("食品名を入力してください");
			String name = sc.next();
			System.out.println("摂取量(g)を入力してください");
			int quantity = sc.nextInt();
			System.out.println("100gあたりのプリン体含有量を入力してください");
			int purineContent = sc.nextInt();
			f[i] = new Food(name, quantity, purineContent);
		}
		sc.close();

		//登録品目数分の標準プリン体含有量の計算と表示
		for(int i = 0; i < f.length; i++) {
			c.calculatePurine(f[i]);
			p.printPurine(f[i]);
		}
		//プリン体摂取量の表示
		p.printTotalPurine(f);
	}
}
