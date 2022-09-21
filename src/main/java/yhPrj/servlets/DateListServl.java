package yhPrj.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import yhPrj.dto.VO;

@WebServlet("/dlist")
public class DateListServl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		request.getRequestDispatcher("index.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		VO vv = new VO();
		String fdate = request.getParameter("fdate");
		String bdate = request.getParameter("bdate");
		
		vv.setFdate(fdate);
		vv.setBdate(bdate);
		
		request.setAttribute("dlist", yhPrj.dao.DAO.dlist(vv));
		request.setAttribute("dtCount", Integer.toString(yhPrj.dao.DAO.DtotalCount(vv)));
		request.setAttribute("dfCount", yhPrj.dao.DAO.DresultCodeCount(vv));
		request.getRequestDispatcher("datelist.jsp").forward(request, response);
			
	}
}