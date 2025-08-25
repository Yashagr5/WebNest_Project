//package com.company.WebNestApp.Servlet;
//
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//import org.springframework.transaction.PlatformTransactionManager;
//import org.springframework.transaction.TransactionDefinition;
//import org.springframework.transaction.TransactionStatus;
//import org.springframework.transaction.support.DefaultTransactionDefinition;
//
//import com.company.WebNestApp.config.AppConfig;
//import com.company.WebNestApp.model.Task;
//import com.company.WebNestApp.model.User;
//import com.company.WebNestApp.service.TaskService;
//
//@WebServlet("/UserDashboard")
//public class UserDashboardServlet extends HttpServlet {
//
//    private TaskService taskService;
//
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        try {
//            AnnotationConfigApplicationContext ctx =
//                    new AnnotationConfigApplicationContext(AppConfig.class);
//            taskService = ctx.getBean(TaskService.class);
//            
//            PlatformTransactionManager txManager = ctx.getBean(PlatformTransactionManager.class);
//            
//            TransactionDefinition def = new DefaultTransactionDefinition();
//            TransactionStatus status = txManager.getTransaction(def);
//        } catch (Exception e) {
//            throw new ServletException("Failed to init", e);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession(false);
//
//        if (session == null || session.getAttribute("loggedUser") == null) {
//            response.sendRedirect("Login.jsp?error=PleaseLogin");
//            return;
//        }
//
//        // get logged-in user
//        User user = (User) session.getAttribute("loggedUser");
//
//        //fetch tasks for this user
//        List<Task> tasks = taskService.findByAssignedUserId(user.getId());
//
//        // put tasks into request scope
//        request.setAttribute("assignedTasks", tasks);
//        request.setAttribute("user", user);
//
//        // forward to JSP
//        request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//}
