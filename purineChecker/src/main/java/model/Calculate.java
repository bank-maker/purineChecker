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
		
		for(Food food : foods) {
			//100gあたりのプリン体含有量が0になっているときは
			if(food.getStandardContent() == 0.0) {
				for(Food equalNameFood : foods) {
					//同じ名前の入力のあるプリン体含有量を代入
					if(food.getName().equals(equalNameFood.getName())) {
						food.setStandardContent(equalNameFood.getStandardContent());
						System.out.println(food.getStandardContent());
						break;
					}
				}
			}
			
			//フィールドの値から、食材ごとに摂取したプリン体摂取量を計算してセット
			food.setPurineContent(food.getStandardContent() / 100 * food.getQuantity());
		}
	}
	
}
