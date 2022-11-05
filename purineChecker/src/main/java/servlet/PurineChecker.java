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
		//データベースにある食品名の取得
		Calculate calculate = new Calculate();
		List<Food> foods = calculate.execute();
		//System.out.println(foods.toString());		//リスト内容確認用
		
		//リクエストスコープに保存
		request.setAttribute("foods", foods);
		
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		//食品名の取得
		String[] name = request.getParameterValues("name");
		//摂取量の取得
		int[] amount = new int[name.length];
		for(int i = 0; i < name.length; i++) {
			amount[i] = Integer.parseInt(request.getParameter("amount" + i));
		}
		
		//リクエストパラメータのチェック
		
		//FoodインスタンスとCalculataインスタンスの生成
		List<Food> foods = new ArrayList<>();
		for(int i = 0; i < name.length; i++) {
			foods.add(new Food(name[i], amount[i]));
		}
		Calculate calculate = new Calculate();
		
		//プリン体摂取量の計算
		calculate.calculatePurine(foods);
		
		//リクエストスコープに保存
		request.setAttribute("foods", foods);
		
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}

}
