package yhPrj.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import yhPrj.dto.VO;

@WebServlet("/page")
public class LoginServl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		request.getRequestDispatcher("login.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		VO vo = new VO();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		vo.setId(id);
		vo.setPwd(pwd);
		
		int result = yhPrj.dao.DAO.Login(vo);
		
		switch(result) {
	
		case 0:
			request.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
			doGet(request, response);
			break;
						
		case 1:
			request.setAttribute("id", vo.getId());
			System.out.println(vo.getId());
			HttpSession session = request.getSession();
			session.setAttribute("vo", vo);
			request.setAttribute("list", yhPrj.dao.DAO.rlist());
			request.setAttribute("tCount", Integer.toString(yhPrj.dao.DAO.TotalCount()));
			request.setAttribute("fCount", yhPrj.dao.DAO.resultCodeCount());
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		}
	}
}