package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Food;

public class FoodDao_type2 {
	//データベース情報(接続URL、ユーザー名、パスワード)
	private final String JDBC_URL = "jdbc:mysql://192.168.56.11/purine_checker";
	private final String DB_USER = "user";
	private final String DB_PASS = "pass";
	
	public List<Food> findAllName() {
		//Foodのリストを新しく生成
		List<Food> foods = new ArrayList<>();
		
		//データベースへ接続
		try(Connection conn = DriverManager.getConnection
				(JDBC_URL, DB_USER, DB_PASS);){
			//SELECT文を準備
			String sql = "SELECT name FROM food";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			//結果を取得してFoodインスタンスを生成しリストに追加
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Food food = new Food(rs.getString("name"), rs.getString("type"));
				foods.add(food);
			}
			
			//リストを返す
			return foods;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<Food> findFood(List<Food> foods){		//type2(同じ食品名が複数あってもいいように1行ずつ取得)
		//データベースへ接続
		String sql;
		PreparedStatement ps;
		ResultSet rs;
		try(Connection conn = DriverManager.getConnection
				(JDBC_URL, DB_USER, DB_PASS);){
			for(Food food : foods) {
				//食材名が一致するレコードのcontain列を取得
				sql = "SELECT contain FROM food WHERE name='" + food.getName() + "'";
				ps = conn.prepareStatement(sql);
				
				//SQLを実行し、取得した値をセット
				rs = ps.executeQuery();
				double contain = rs.getDouble("contain");
				food.setStandardContent(contain);
				
				//接続を解除
				ps.close();
				rs.close();
			}
			//リストを返す
			return foods;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
