package servlet;

import java.io.IOException;

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
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int amount = Integer.parseInt(request.getParameter("amount"));
		double contain = Double.parseDouble(request.getParameter("contain"));
		
		//リクエストパラメータのチェック
		
		//FoodインスタンスとCalculataインスタンスの生成
		Food food = new Food(name, amount, contain);
		Calculate calculate = new Calculate();
		
		//プリン体摂取量の計算
		calculate.calculatePurine(food);
		
		//リクエストスコープに保存
		request.setAttribute("food", food);
		
		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}

}
