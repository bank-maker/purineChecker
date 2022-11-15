package listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.Calculate;
import model.Food;

@WebListener
public class PurineListener implements ServletContextListener {
	public void contextInitialized(ServletContextEvent sce)  {
		//データベースにある食材名の取得
		Calculate calculate = new Calculate();
		List<Food> foods = calculate.execute();
		
		//アプリケーションスコープに保存
		ServletContext application = sce.getServletContext();
		application.setAttribute("foods", foods);
		
		System.out.println(foods.get(0).getName());
	}
	
    public void contextDestroyed(ServletContextEvent sce)  {}

	
}
