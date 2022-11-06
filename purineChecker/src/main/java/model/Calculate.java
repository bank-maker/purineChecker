package model;

import java.util.List;

import dao.FoodDao;

public class Calculate {
	public List<Food> execute(){
		//FoodDaoでデータベースから食材名を取得
		FoodDao dao = new FoodDao();
		List<Food> foods = dao.findAllName();
		return foods;
	}
	
	public void calculatePurine(List<Food> getFoods) {
		//FoodDaoに100gあたりのプリン体含有量の取得を依頼
		FoodDao dao = new FoodDao();
		List<Food> foods = dao.findFood(getFoods);
		
		//フィールドの値から、食材ごとに摂取したプリン体摂取量を計算してセット
		for(Food food : foods) {
			food.setPurineContent(food.getStandardContent() / 100 * food.getQuantity());
		}
	}
	
}
