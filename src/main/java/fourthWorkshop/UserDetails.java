package fourthWorkshop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDetails", value = "/user/show")
public class UserDetails extends HttpServlet {
    private UserDao userDao;

    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        User user = userDao.read(userId);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/user-details.jsp").forward(request, response);
    }
}