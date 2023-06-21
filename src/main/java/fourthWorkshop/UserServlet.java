package fourthWorkshop;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/userServlet")
public class UserServlet extends HttpServlet {
    private UserDao userDao;
    public void init() {
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "show":
                request.getRequestDispatcher("/user/show").forward(request, response);
                break;
            case "delete":
                request.getRequestDispatcher("/user/delete").forward(request, response);
                break;
            case "edit":
                request.getRequestDispatcher("/user/edit").forward(request, response);
                break;
            case "list":
            default:
                List<User> userList = userDao.findAll();
                request.setAttribute("users", userList);
                request.getRequestDispatcher("/user/list").forward(request, response);
                break;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "add":

                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                User newUser = new User();
                newUser.setEmail(email);
                newUser.setUserName(username);
                newUser.setPassword(password);
                // Call the UserDao to create the user
                userDao.create(newUser);
                response.sendRedirect(request.getContextPath() + "/user/list");
                break;

            case "update":
                int userId = Integer.parseInt(request.getParameter("userId"));
                String updatedEmail = request.getParameter("email");
                String updatedUsername = request.getParameter("username");
                String updatedPassword = request.getParameter("password");
                User existingUser = userDao.read(userId);
                if (existingUser != null) {
                    existingUser.setEmail(updatedEmail);
                    existingUser.setUserName(updatedUsername);
                    existingUser.setPassword(updatedPassword);

                    userDao.update(existingUser);
                }
                response.sendRedirect(request.getContextPath() + "/user/list");
                break;
            default:
                request.getRequestDispatcher("/user/list").forward(request, response);
        }
    }
}

