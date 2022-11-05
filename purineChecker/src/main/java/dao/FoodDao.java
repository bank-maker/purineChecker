package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import model.Food;

public class FoodDao {
	private final String JDBC_URL = "jdbc:mysql://192.168.56.11/purine_checker";
	private final String DB_USER = "user";
	private final String DB_PASS = "pass";
	//全ての食品名の取得
	public List<Food> findAllName() {
		List<Food> foods = new ArrayList<>();
		//データベースへ接続
		try(Connection conn = DriverManager.getConnection
				(JDBC_URL, DB_USER, DB_PASS);){
			//SELECT文を準備
			String sql = "SELECT name FROM food";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			//結果を取得してFoodのリストを作成して返す
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Food food = new Food(rs.getString("name"));
				foods.add(food);
			}
			return foods;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//指定された食品名から100gあたりのプリン体含有量を取得
	public List<Food> findFood(List<Food> foods){
		//データベースへ接続
		try(Connection conn = DriverManager.getConnection
				(JDBC_URL, DB_USER, DB_PASS);){
			//SELECT文を準備
			String foodNames = "";
			for(int i = 0; i < foods.size(); i++) {
				if(i == foods.size() - 1) {
					foodNames += "\'" + foods.get(i).getName() + "\'";
				}else {
					foodNames += "\'" + foods.get(i).getName() + "\',";
				}
			}
			String sql = "SELECT contain FROM food WHERE name IN (" + foodNames + ")";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			//結果を取得してFoodのリストを作成して返す
			ResultSet rs = ps.executeQuery();
			Iterator foodsIt = foods.iterator();
			while(rs.next() && foodsIt.hasNext()) {
				double contain = rs.getDouble("contain");
				Food food = (Food)foodsIt.next();
				food.setStandardContent(contain);
			}
			return foods;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
