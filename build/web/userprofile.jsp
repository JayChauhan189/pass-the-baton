<%@page import="java.sql.Statement"%>
<%@include file="logincheck.jsp"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Profile</title>
        <!-- Bootstrap CSS -->
        <!--====================================================================================================================-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <!--====================================================================================================================-->

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">

        <!--====================================================================================================================-->
        <link rel="icon" type="image/png" href="assest/images/img-02.png" />
        <!--===============================================================================================-->
        <link rel="stylesheet" href="assest/style/style.css">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!--====================================================================================================================-->
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&display=swap" rel="stylesheet">
        <!--====================================================================================================================-->
        <script src="https://kit.fontawesome.com/d72e2bd739.js" crossorigin="anonymous"></script>
        <!--====================================================================================================================-->
        <!--====================================================================================================================-->

        
    </head>

    <body>
        <!-- Header Started -->
        <header>
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="home.jsp">
                    <img src="assest/images/img-02.png" width="30" height="30" class="d-inline-block align-top"
                         alt="">
                        PASS-THE-BATON
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    
                    <span>
                        <a href="userprofile.jsp"><button type="button" class="btn btn-outline-warning"><i class='fas fa-user-alt'></i> User Profile</button></a>
                    </span>
                </div>
            </nav>
        </header>
        <!-- Header Ended -->

        <%@page import="java.sql.*" %>
        <%                    String fname, lname, email, password, college;
            int passing_year;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                int userid = Integer.parseInt((String) session.getAttribute("uid"));
                Statement stmt = con.createStatement();
                ResultSet rst = stmt.executeQuery("select * from users where id = " + userid + ";");
                if (rst.first()) {
                    fname = rst.getString(2);
                    lname = rst.getString(3);
                    email = rst.getString(4);
                    password = rst.getString(5);
                    college = rst.getString(6);
                    passing_year = rst.getInt(7);
        %>
        <!-- Main Content -->
        <main>

            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="150px" src="assest/img/userprofile.png"><br>
                            <span class="font-weight-bold h2"><%= fname%> <%= lname%></span>
                            <span class="text-black-50 h5"><%= email%></span>
                        </div>
                    </div>
                        
                    
                        <div class="col-md-4 border-right">
                            <form action="UpdateProfile" method="post">            
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile Settings</h4>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-md-6"><label class="labels">First Name</label><input type="text" class="form-control"
                                                                                                         placeholder="First Name" value="<%= fname%>" name="fname"></div>
                                    <div class="col-md-6"><label class="labels">Last Name</label><input type="text" class="form-control"
                                                                                                        value="<%= lname%>" placeholder="Last Name" name="lname"></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels">&nbsp;Email</label><input type="email" class="form-control"
                                                                                                           placeholder="Email" value="<%= email%>" name="email"></div>
                                    <div class="col-md-12"><label class="labels"><br>&nbsp;Password</label><input type="password" class="form-control"
                                                                                                                      placeholder="New Password" value="<%= password%>"  name="password" minlength="8" maxlength="16"></div>
                                    <div class="col-md-12"><label class="labels"> <br> &nbsp;College</label><input type="text" class="form-control"
                                                                                                                       placeholder="College Name" value="<%= college%>" name="clg"></div>
                                    <div class="col-md-12"><label class="labels"> <br> &nbsp;Passing Year of College</label><input type="number" class="form-control"
                                                                                                                                       placeholder="Passing Year" value="<%= passing_year%>" name="pass_year"></div>
                                </div>
                                <%
                                    }%>

                                <div class="mt-5 text-center">
                                    <button class="mr-4 btn btn-primary profile-button" type="submit" name="submitbutton" value="update">Update Profile </button> 
                                    <a href="logout.jsp"><button class="btn btn-warning profile-button" type="button">Logout</button></a>
                                </div>  
                            </div>         
                    </form>
                        </div>
                    <div class="col-md-4">
                        
                        <div class="row">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center experience h4 mb-3"><span>Submitted Responses</span></div>
                                <div class="col-md-12"><label class="labels h5">List of Projects:</label></div>
                                <%
                                    Statement stmt7 = con.createStatement();
                                    ResultSet rst7 = stmt7.executeQuery("select * from solutions where uid = " + userid + ";");
                                    while (rst7.next()) {
                                        int pid = rst7.getInt(3);
                                        Statement stmt8 = con.createStatement();
                                        ResultSet rst8 = stmt8.executeQuery("select * from projects where pid = " + pid + " and status='posted';");
                                        if (rst8.first()) {
                                %>

                                <div>
                                    <form action="viewprojectdetails.jsp" method="post">
                                        <input type="hidden" name="p_id" value="<%= rst8.getInt(1)%>">
                                        <input type="hidden" name="org_id" value="<%= rst8.getInt(5)%>">
                                        <input type="submit" class="btn btn-link" value="<%= rst8.getString(2)%>">
                                    </form>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="row">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center experience h4 mb-3"><span>Ongoing Projects</span></div>
                                <div class="col-md-12"><label class="labels h5">List of Projects:</label></div>
                                <%
                                    Statement stmt3 = con.createStatement();
                                    ResultSet rst3 = stmt3.executeQuery("select * from solutions where uid = " + userid + ";");
                                    while (rst3.next()) {
                                        int pid = rst3.getInt(3);
                                        Statement stmt4 = con.createStatement();
                                        ResultSet rst4 = stmt4.executeQuery("select * from projects where pid = " + pid + " and status='under development';");
                                        if (rst4.first()) {
                                %>

                                <div>
                                    <form action="viewprojectdetails.jsp" method="post">
                                        <input type="hidden" name="p_id" value="<%= rst4.getInt(1)%>">
                                        <input type="hidden" name="org_id" value="<%= rst4.getInt(5)%>">
                                        <input type="submit" class="btn btn-link" value="<%= rst4.getString(2)%>">
                                    </form>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        
                        
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience h4 mb-3"><span>Past Performance: </span></div>
                            <div class="col-md-12"><label class="labels h5">List of Previously Earned Certificates:</label></div>
                            <%
                                Statement stmt4 = con.createStatement();
                                ResultSet rst4 = stmt4.executeQuery("select * from certificates where userid = " + userid + ";");
                                while (rst4.next()) {
                                    int pid = rst4.getInt(4);
                                    Statement stmt5 = con.createStatement();
                                    ResultSet rst5 = stmt5.executeQuery("select * from projects where pid = " + pid + " and status='completed';");
                                    if (rst5.first()) {
                            %>

                            <div>
                                <form action="printcertificate.jsp" method="post">
                                    <input type="hidden" name="cid" value="<%= rst4.getInt(1)%>">
                                    <input type="submit" class="btn btn-link" value="<%= rst5.getString(2)%>">
                                </form>
                            </div>
                            <%
                                    }
                                }
                            %>
                            <%
                                } catch (Exception e) {
                                    out.println("Exception Occurred: " + e);
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Main Ended -->



<!-- Footer -->
<footer>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="center">
            <ul>
                <li>Copyright &#169; PASS-THE-BATON</li>
            </ul>
        </div>
    </nav>
</footer>
<!-- Footer Ended -->

<!-- jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
crossorigin="anonymous"></script>

</body>

</html>