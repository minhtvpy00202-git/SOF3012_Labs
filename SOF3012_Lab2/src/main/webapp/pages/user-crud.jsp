<%@ page pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>User CRUD</title>
        <style>
            table, th, td {
              border: 1px solid black;
            }
            table {
              border-collapse: collapse;
            }
        </style>
    </head>

    <body>
        <i>${message}</i>
        <c:url var="url" value="/user/crud" />
        <form method="post">
            <label>User Id: </label>
            <input name="id" value="${user.id}" placeholder="Nhập Id"><br>
            <label>Password: </label>
            <input name="password" type="password" value="${user.password}" placeholder="Nhập mật khẩu"><br>
            <label>Fullname: </label>
            <input name="fullname" value="${user.fullname}" placeholder="Nhập Họ và tên"><br>
            <label>Email: </label>
            <input name="email" value="${user.email}" placeholder="user@example.com"><br>
            <label>Vai trò: </label>
            <input name="admin" type="radio" value="true" ${user.admin?'checked':''}>
            Manager
            <input name="admin" type="radio" value="false" ${!user.admin?'':'checked'}>
            User
            <hr>
            <button formaction="${url}/create">Create</button>
            <button formaction="${url}/update">Update</button>
            <button formaction="${url}/delete">Delete</button>
            <button formaction="${url}/reset">Reset</button>
        </form>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Password</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.password}</td>
                        <td>${u.fullname}</td>
                        <td>${u.email}</td>
                        <td>${u.admin?'Admin':'User'}</td>
                        <td><a href="${url}/edit/${u.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>