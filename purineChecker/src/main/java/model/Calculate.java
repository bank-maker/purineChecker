package model;

import java.util.List;

import dao.FoodDao;

public class Calculate {
	//FoodDaoにデータベースから食品名の取得を依頼する
	public List<Food> execute(){
		FoodDao dao = new FoodDao();
		List<Food> foods = dao.findAllName();
		return foods;
	}
	//100gあたりのプリン体含有量の計算
	public void calculatePurine(List<Food> getFoods) {
		FoodDao dao = new FoodDao();
		List<Food> foods = dao.findFood(getFoods);
		//System.out.println(foods.toString());	//リストの内容確認用
		//プリン体摂取量をインスタンスにセット
		for(Food food : foods) {
			food.setPurineContent(food.getStandardContent() / 100 * food.getQuantity());
		}
	}
	
}
