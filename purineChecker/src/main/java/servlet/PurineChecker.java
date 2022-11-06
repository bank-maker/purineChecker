package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Calculate;
import model.Food;

@WebServlet("/PurineChecker")
public class PurineChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//データベースにある食材名の取得
		Calculate calculate = new Calculate();
		List<Food> foods = calculate.execute();
		
		//リクエストスコープに保存
		request.setAttribute("foods", foods);
		
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		//食材名の取得
		String[] name = request.getParameterValues("name");
		//摂取量の取得
		String[] amount = request.getParameterValues("amount");
		//摂取量はint型の配列に入れ替える
		int[] quantity = new int[amount.length];
		for(int i = 0; i < amount.length; i++) {
			quantity[i] = Integer.parseInt(amount[i]);
		}
		
		//リクエストパラメータのチェック(後で追加)
		
		//FoodインスタンスとCalculataインスタンスの生成
		List<Food> foods = new ArrayList<>();
		for(int i = 0; i < name.length; i++) {
			foods.add(new Food(name[i], quantity[i]));
		}
		Calculate calculate = new Calculate();
		
		//プリン体摂取量の計算とフィールド設定
		calculate.calculatePurine(foods);
		
		//リクエストスコープに保存
		request.setAttribute("foods", foods);
		
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}

}
