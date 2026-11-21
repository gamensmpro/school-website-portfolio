
# =========================
# HTML TEMPLATES
# =========================

write_file src/main/resources/templates/index.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>ABC Public School</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" th:href="@{/css/style.css}">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<div class="container">
<a class="navbar-brand" href="/">ABC Public School</a>
<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav"><span class="navbar-toggler-icon"></span></button>
<div class="collapse navbar-collapse" id="nav">
<ul class="navbar-nav ms-auto">
<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
<li class="nav-item"><a class="nav-link" href="/about">About</a></li>
<li class="nav-item"><a class="nav-link" href="/courses">Courses</a></li>
<li class="nav-item"><a class="nav-link" href="/admission">Admission</a></li>
<li class="nav-item"><a class="nav-link" href="/contact">Contact</a></li>
<li class="nav-item"><a class="nav-link" href="/login">Admin</a></li>
</ul>
</div>
</div>
</nav>
<header class="hero text-center">
<div class="container">
<h1>Welcome to ABC Public School</h1>
<p>Education Today, Success Tomorrow</p>
<a href="/admission" class="btn btn-warning btn-lg">Apply for Admission</a>
</div>
</header>
<section class="container py-5">
<h2 class="text-center mb-4">Why Choose Our School?</h2>
<div class="row g-4">
<div class="col-md-4"><div class="card p-4 shadow text-center"><h3>Quality Education</h3><p>Excellent academic education.</p></div></div>
<div class="col-md-4"><div class="card p-4 shadow text-center"><h3>Expert Teachers</h3><p>Qualified and experienced educators.</p></div></div>
<div class="col-md-4"><div class="card p-4 shadow text-center"><h3>Modern Facilities</h3><p>Technology-enabled learning.</p></div></div>
</div>
</section>
<footer class="footer">© 2026 ABC Public School. All Rights Reserved.</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script th:src="@{/js/script.js}"></script>
</body>
</html>
EOF

write_file src/main/resources/templates/about.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>About Us</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" th:href="@{/css/style.css}">
</head>
<body>
<nav class="navbar navbar-dark bg-primary p-3">
<a class="navbar-brand" href="/">ABC Public School</a>
<a class="text-white" href="/">Home</a>
</nav>
<div class="container py-5">
<h1>About Our School</h1>
<p>ABC Public School is dedicated to providing quality education and developing responsible citizens.</p>
<h3>Our Mission</h3><p>To provide excellent education and encourage creativity.</p>
<h3>Our Vision</h3><p>To create confident, knowledgeable and responsible students.</p>
<h3>Our Values</h3><p>Discipline, respect, honesty, teamwork and excellence.</p>
</div>
</body>
</html>
EOF

write_file src/main/resources/templates/login.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Admin Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" th:href="@{/css/style.css}">
</head>
<body>
<div class="login-box shadow">
<h2 class="text-center mb-4">Admin Login</h2>
<div th:if="${param.error}" class="alert alert-danger">Invalid username or password.</div>
<div th:if="${param.logout}" class="alert alert-success">Logged out successfully.</div>
<form th:action="@{/login}" method="post">
<div class="mb-3"><label>Username</label><input name="username" class="form-control" required></div>
<div class="mb-3"><label>Password</label><input type="password" name="password" class="form-control" required></div>
<button class="btn btn-primary w-100">Login</button>
</form>
<a href="/" class="d-block text-center mt-3">Back to Home</a>
</div>
</body>
</html>
EOF

write_file src/main/resources/templates/dashboard.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark p-3">
<a class="navbar-brand" href="/dashboard">School Admin</a>
<form th:action="@{/logout}" method="post"><button class="btn btn-danger">Logout</button></form>
</nav>
<div class="container py-5">
<h2>Admin Dashboard</h2>
<div class="row g-4 mt-3">
<div class="col-md-3"><div class="card dashboard-card"><h4>Students</h4><h2 th:text="${students}">0</h2><a href="/students">Manage Students</a></div></div>
<div class="col-md-3"><div class="card dashboard-card"><h4>Teachers</h4><h2 th:text="${teachers}">0</h2><a href="/teachers">Manage Teachers</a></div></div>
<div class="col-md-3"><div class="card dashboard-card"><h4>Courses</h4><h2 th:text="${courses}">0</h2><a href="/courses">Manage Courses</a></div></div>
<div class="col-md-3"><div class="card dashboard-card"><h4>Admissions</h4><h2 th:text="${admissions}">0</h2><a href="/admissions">View Applications</a></div></div>
</div>
</div>
</body>
</html>
EOF

write_file src/main/resources/templates/students.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Students</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Student Management</h2>
<a href="/students/new" class="btn btn-primary mb-3">Add Student</a>
<a href="/dashboard" class="btn btn-secondary mb-3">Dashboard</a>
<table class="table table-bordered table-striped">
<thead class="table-dark"><tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Class</th><th>Actions</th></tr></thead>
<tbody>
<tr th:each="s : ${students}">
<td th:text="${s.id}"></td><td th:text="${s.name}"></td><td th:text="${s.email}"></td><td th:text="${s.phone}"></td><td th:text="${s.className}"></td>
<td>
<a th:href="@{/students/edit/{id}(id=${s.id})}" class="btn btn-warning btn-sm">Edit</a>
<form th:action="@{/students/delete/{id}(id=${s.id})}" method="post" style="display:inline"><button class="btn btn-danger btn-sm" onclick="return confirm('Delete student?')">Delete</button></form>
</td>
</tr>
</tbody>
</table>
</body>
</html>
EOF

write_file src/main/resources/templates/student-form.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Student Form</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Student Registration</h2>
<form th:action="@{/students/save}" th:object="${student}" method="post">
<input type="hidden" th:field="*{id}">
<div class="mb-3"><label>Name</label><input th:field="*{name}" class="form-control" required><small class="text-danger" th:errors="*{name}"></small></div>
<div class="mb-3"><label>Email</label><input type="email" th:field="*{email}" class="form-control" required><small class="text-danger" th:errors="*{email}"></small></div>
<div class="mb-3"><label>Phone</label><input th:field="*{phone}" class="form-control"></div>
<div class="mb-3"><label>Class</label><input th:field="*{className}" class="form-control"></div>
<div class="mb-3"><label>Address</label><textarea th:field="*{address}" class="form-control"></textarea></div>
<button class="btn btn-success">Save Student</button><a href="/students" class="btn btn-secondary">Cancel</a>
</form>
</body>
</html>
EOF

write_file src/main/resources/templates/teachers.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Teachers</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Teacher Management</h2>
<a href="/teachers/new" class="btn btn-primary mb-3">Add Teacher</a><a href="/dashboard" class="btn btn-secondary mb-3">Dashboard</a>
<table class="table table-bordered">
<thead class="table-dark"><tr><th>ID</th><th>Name</th><th>Email</th><th>Subject</th><th>Qualification</th><th>Phone</th><th>Action</th></tr></thead>
<tbody><tr th:each="t : ${teachers}">
<td th:text="${t.id}"></td><td th:text="${t.name}"></td><td th:text="${t.email}"></td><td th:text="${t.subject}"></td><td th:text="${t.qualification}"></td><td th:text="${t.phone}"></td>
<td><form th:action="@{/teachers/delete/{id}(id=${t.id})}" method="post"><button class="btn btn-danger btn-sm">Delete</button></form></td>
</tr></tbody>
</table>
</body>
</html>
EOF

write_file src/main/resources/templates/teacher-form.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Teacher Form</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Add Teacher</h2>
<form th:action="@{/teachers/save}" th:object="${teacher}" method="post">
<input type="hidden" th:field="*{id}">
<div class="mb-3"><label>Name</label><input th:field="*{name}" class="form-control" required></div>
<div class="mb-3"><label>Email</label><input type="email" th:field="*{email}" class="form-control"></div>
<div class="mb-3"><label>Subject</label><input th:field="*{subject}" class="form-control"></div>
<div class="mb-3"><label>Qualification</label><input th:field="*{qualification}" class="form-control"></div>
<div class="mb-3"><label>Phone</label><input th:field="*{phone}" class="form-control"></div>
<button class="btn btn-success">Save Teacher</button><a href="/teachers" class="btn btn-secondary">Cancel</a>
</form>
</body>
</html>
EOF

write_file src/main/resources/templates/courses.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Courses</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Course Management</h2>
<a href="/courses/new" class="btn btn-primary mb-3">Add Course</a><a href="/dashboard" class="btn btn-secondary mb-3">Dashboard</a>
<table class="table table-bordered">
<thead class="table-dark"><tr><th>ID</th><th>Name</th><th>Description</th><th>Duration</th><th>Fees</th><th>Action</th></tr></thead>
<tbody><tr th:each="c : ${courses}">
<td th:text="${c.id}"></td><td th:text="${c.courseName}"></td><td th:text="${c.description}"></td><td th:text="${c.duration}"></td><td th:text="${c.fees}"></td>
<td><form th:action="@{/courses/delete/{id}(id=${c.id})}" method="post"><button class="btn btn-danger btn-sm">Delete</button></form></td>
</tr></tbody>
</table>
</body>
</html>
EOF

write_file src/main/resources/templates/course-form.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Course Form</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Add Course</h2>
<form th:action="@{/courses/save}" th:object="${course}" method="post">
<input type="hidden" th:field="*{id}">
<div class="mb-3"><label>Course Name</label><input th:field="*{courseName}" class="form-control" required></div>
<div class="mb-3"><label>Description</label><textarea th:field="*{description}" class="form-control"></textarea></div>
<div class="mb-3"><label>Duration</label><input th:field="*{duration}" class="form-control"></div>
<div class="mb-3"><label>Fees</label><input type="number" step="0.01" th:field="*{fees}" class="form-control"></div>
<button class="btn btn-success">Save Course</button><a href="/courses" class="btn btn-secondary">Cancel</a>
</form>
</body>
</html>
EOF

write_file src/main/resources/templates/admission-form.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Admission</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2 class="text-center">Online Admission Form</h2>
<div th:if="${success}" class="alert alert-success" th:text="${success}"></div>
<form th:action="@{/admission/save}" th:object="${admission}" method="post">
<div class="mb-3"><label>Student Name</label><input th:field="*{studentName}" class="form-control" required></div>
<div class="mb-3"><label>Parent Name</label><input th:field="*{parentName}" class="form-control" required></div>
<div class="mb-3"><label>Email</label><input type="email" th:field="*{email}" class="form-control" required></div>
<div class="mb-3"><label>Phone</label><input th:field="*{phone}" class="form-control"></div>
<div class="mb-3"><label>Applying for Class</label>
<select th:field="*{requestedClass}" class="form-select" required>
<option value="">Select Class</option>
<option th:each="n : ${#numbers.sequence(1,12)}" th:value="${'Class '+n}" th:text="${'Class '+n}"></option>
</select></div>
<button class="btn btn-primary w-100">Submit Application</button>
</form>
<a href="/" class="btn btn-secondary mt-3">Home</a>
</body>
</html>
EOF

write_file src/main/resources/templates/admissions.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Admissions</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2>Admission Applications</h2><a href="/dashboard" class="btn btn-secondary mb-3">Dashboard</a>
<table class="table table-bordered">
<thead class="table-dark"><tr><th>ID</th><th>Student</th><th>Parent</th><th>Email</th><th>Phone</th><th>Class</th><th>Status</th></tr></thead>
<tbody><tr th:each="a : ${admissions}">
<td th:text="${a.id}"></td><td th:text="${a.studentName}"></td><td th:text="${a.parentName}"></td><td th:text="${a.email}"></td><td th:text="${a.phone}"></td><td th:text="${a.requestedClass}"></td><td th:text="${a.status}"></td>
</tr></tbody></table>
</body>
</html>
EOF

write_file src/main/resources/templates/contact.html <<'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head><title>Contact Us</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></head>
<body class="container py-5">
<h2 class="text-center">Contact Our School</h2>
<div th:if="${success}" class="alert alert-success" th:text="${success}"></div>
<div class="row mt-4">
<div class="col-md-6"><h4>School Information</h4><p>ABC Public School</p><p>New Delhi, India</p><p>Email: info@abcschool.example</p></div>
<div class="col-md-6">
<form th:action="@{/contact/save}" th:object="${contact}" method="post">
<div class="mb-3"><label>Name</label><input th:field="*{name}" class="form-control" required></div>
<div class="mb-3"><label>Email</label><input type="email" th:field="*{email}" class="form-control" required></div>
<div class="mb-3"><label>Subject</label><input th:field="*{subject}" class="form-control"></div>
<div class="mb-3"><label>Message</label><textarea th:field="*{message}" class="form-control" required></textarea></div>
<button class="btn btn-primary w-100">Send Message</button>
</form></div></div>
<a href="/" class="btn btn-secondary mt-4">Home</a>
</body>
</html>
EOF


# =========================
# CSS
# =========================

write_file src/main/resources/static/css/style.css <<'EOF'
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f5f7fa;
    color: #333;
}

.hero {
    background: linear-gradient(
        rgba(0,45,100,.75),
        rgba(0,45,100,.75)
    ),
    url("https://images.unsplash.com/photo-1503676260728-1c00da094a0b");
    background-size: cover;
    background-position: center;
    padding: 130px 20px;
    color: white;
}

.hero h1 {
    font-size: 45px;
    font-weight: bold;
    margin-bottom: 20px;
}

.hero p {
    font-size: 22px;
    margin-bottom: 30px;
}

.card {
    border: none;
    border-radius: 12px;
    transition: .3s;
}

.card:hover {
    transform: translateY(-5px);
}

.dashboard-card {
    padding: 25px;
    text-align: center;
    background: white;
}

.dashboard-card h2 {
    color: #0d6efd;
    font-size: 35px;
    margin: 15px;
}

.dashboard-card a {
    text-decoration: none;
    color: #0d6efd;
}

.login-box {
    background: white;
    padding: 35px;
    border-radius: 12px;
    max-width: 420px;
    margin: 100px auto;
}

.login-box h2 {
    color: #0d6efd;
}

.footer {
    background: #212529;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 30px;
}

@media(max-width:768px) {
    .hero {
        padding: 80px 15px;
    }

    .hero h1 {
        font-size: 30px;
    }

    .login-box {
        margin: 50px 15px;
    }
}
EOF

# =========================
# JAVASCRIPT
# =========================

write_file src/main/resources/static/js/script.js <<'EOF'
document.addEventListener("DOMContentLoaded", function () {
    console.log("School Website Portfolio Loaded!");

    document.querySelectorAll(".delete-confirm")
        .forEach(function (button) {
            button.addEventListener("click", function (event) {
                if (!confirm("Are you sure you want to delete?")) {
                    event.preventDefault();
                }
            });
        });
});
EOF

# =========================
# README
# =========================

write_file README.md <<'EOF'
# School Website Portfolio

A full-stack school website and management application.

## Technologies

- Java 17
- Spring Boot 3.5.7
- Spring MVC
- Spring Data JPA
- Hibernate
- MySQL / MariaDB
- Spring Security
- Thymeleaf
- HTML5, CSS3, JavaScript
- Bootstrap 5
- Maven

## Features

1. Home page
2. About school
3. Admin login
4. Admin dashboard
5. Student management
6. Teacher management
7. Course management
8. Online admission form
9. Contact form
10. Database integration

## Run the application

1. Install Java 17 and Maven.
2. Install MySQL or MariaDB.
3. Create database school_portfolio.
4. Configure application.properties.
5. Execute mvn spring-boot:run.
6. Open http://localhost:8080.

## Demo admin login

Username: admin
Password: Admin@123

Change the demo credentials before deployment.

## Project

Project C - Backend Web Development
School Website Portfolio
EOF

echo ""
echo "=========================================="
echo " SCHOOL WEBSITE PORTFOLIO CREATED!"
echo "=========================================="
echo "Project: $BASE"
echo "Run: cd $BASE && mvn spring-boot:run"
echo "=========================================="

