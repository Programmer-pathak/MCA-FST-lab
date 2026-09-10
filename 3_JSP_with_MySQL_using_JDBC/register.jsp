<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>

    <h2>Student Registration Form</h2>

    <form method="post">
        Student ID:
        <input type="text" name="sid" required>
        <br><br>

        Student Name:
        <input type="text" name="sname" required>
        <br><br>

        Course:
        <input type="text" name="course" required>
        <br><br>

        <input type="submit" value="Register">
    </form>

    <%
        String id = request.getParameter("sid");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");

        if (id != null && name != null && course != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentdb",
                    "root",
                    "Enter password here"
                );

                String sql = "INSERT INTO student (sid, sname, course) VALUES (?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, course);

                ps.executeUpdate();

                out.println("<h3>Student Registered Successfully</h3>");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM student");

                out.println("<h3>Student Records</h3>");
                out.println("<table border='1' cellpadding='8'>");
                out.println("<tr><th>ID</th><th>Name</th><th>Course</th></tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("sid") + "</td>");
                    out.println("<td>" + rs.getString("sname") + "</td>");
                    out.println("<td>" + rs.getString("course") + "</td>");
                    out.println("</tr>");
                }

                out.println("</table>");

                rs.close();
                st.close();
                ps.close();
                con.close();

            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            }
        }
    %>

</body>
</html>