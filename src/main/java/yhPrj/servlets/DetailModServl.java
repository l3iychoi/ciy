package yhPrj.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import yhPrj.dto.VO;

@WebServlet("/detailMod")
public class DetailModServl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usernumber = Integer.parseInt(request.getParameter("usernumber"));
		VO vo = yhPrj.dao.DAO.detail(usernumber);
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("detailMod.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int usernumber = Integer.parseInt(request.getParameter("usernumber"));
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String username = request.getParameter("username");
		String management = request.getParameter("management");
		
		VO vo = new VO();
		
		vo.setUsernumber(usernumber);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setUsername(username);
		vo.setManagement(management);
	
		yhPrj.dao.DAO.update(vo);
		response.sendRedirect("memberList");
		
	}

}
