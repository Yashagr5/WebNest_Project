<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Purple → Blue */
            min-height: 100vh; 
            padding: 20px; 
            margin: 0;
        }
        .container { 
            max-width: 1200px; 
            margin: 0 auto; 
            background: #fff; 
            padding: 30px; 
            border-radius: 12px; 
            box-shadow: 0px 6px 20px rgba(0,0,0,0.15); 
        }
        h1 { 
            text-align: center; 
            margin-bottom: 30px; 
            color: #6a11cb; /* Elegant Purple */
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .dashboard-card {
            background: #f5f0ff;
            padding: 20px;
            border-radius: 10px;
            border-left: 5px solid #2575fc; /* Blue accent */
            transition: transform 0.2s;
        }
        .dashboard-card:hover {
            transform: translateY(-3px);
            background: #ece6ff;
        }
        .dashboard-card h3 {
            margin-top: 0;
            color: #6a11cb;
        }
        .stats {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .nav-menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 30px;
        }
        .nav-btn {
            display: block;
            padding: 15px;
            background: #6a11cb; 
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background 0.3s, transform 0.2s;
        }
        .nav-btn:hover {
            background: #4b0f91; /* Darker Purple */
            transform: translateY(-2px);
        }
        table {
            width: 100%; 
            border-collapse: collapse; 
            margin-bottom: 20px;
        }
        table th {
            background: #6a11cb; 
            color: white; 
            padding: 12px; 
            text-align: left;
        }
        table td {
            padding: 12px; 
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <!-- Statistics Cards -->
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <h3>Pending Tasks</h3>
                <div class="stats">${pendingTasks != null ? pendingTasks.size() : 0}</div>
            </div>
            <div class="dashboard-card">
                <h3>In Progress</h3>
                <div class="stats">${inProgressTasks != null ? inProgressTasks.size() : 0}</div>
            </div>
            <div class="dashboard-card">
                <h3>Completed</h3>
                <div class="stats">${completedTasks != null ? completedTasks.size() : 0}</div>
            </div>
            <div class="dashboard-card">
                <h3>Delayed</h3>
                <div class="stats">${delayedTasks != null ? delayedTasks.size() : 0}</div>
            </div>
        </div>

        <!-- Navigation Menu -->
        <div class="nav-menu">
            <a href="${pageContext.request.contextPath}/admin/tasks" class="nav-btn">Manage Tasks</a>
            <a href="${pageContext.request.contextPath}/admin/comments" class="nav-btn">View All Comments</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-btn">Logout</a>
        </div>

        <!-- Task Status Sections -->
        <c:if test="${not empty pendingTasks}">
            <h2>Pending Tasks</h2>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Assigned To</th>
                    <th>Due Date</th>
                </tr>
                <c:forEach var="task" items="${pendingTasks}">
                    <tr>
                        <td>${task.title}</td>
                        <td>${task.description}</td>
                        <td>${task.assignedTo.name}</td>
                        <td>${task.dueDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${not empty inProgressTasks}">
            <h2>Tasks In Progress</h2>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Assigned To</th>
                    <th>Due Date</th>
                </tr>
                <c:forEach var="task" items="${inProgressTasks}">
                    <tr>
                        <td>${task.title}</td>
                        <td>${task.assignedTo.name}</td>
                        <td>${task.dueDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</body>
</html>
