package fourthWorkshop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserUpdate", value = "/user/update")
public class UserUpdate extends HttpServlet {
    private UserDao userDao;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        if (userId != null && !userId.isEmpty()) {
            int id = Integer.parseInt(userId);
            userDao = new UserDao();
            User user = userDao.read(id);
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("/user-edit.jsp").forward(request, response);
                return;
            }
        }
            response.sendRedirect(request.getContextPath() + "/error.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        User updatedUser = userDao.read(id);
        updatedUser.setUserName(username);
        updatedUser.setEmail(email);
        updatedUser.setPassword(password);
        userDao.update(updatedUser);

        response.sendRedirect(request.getContextPath() + "/user/list");
    }

}