package fourthWorkshop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserCreate", value = "/user/add")
public class UserCreate extends HttpServlet {
    private UserDao userDao;
    public void init() {
        userDao = new UserDao();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setUserName(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword (request.getParameter("password"));
        userDao.create(user);
        response.sendRedirect(request.getContextPath() + "/user/list");

    }
}