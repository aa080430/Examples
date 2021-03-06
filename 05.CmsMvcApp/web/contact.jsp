<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
    <head>
        <title>Contacts</title>
        <link rel="stylesheet" href="css/styles.css" />
    </head>
    <body>

        <jsp:include page="header.jsp" />
        <h3>Contacts</h3>
        
        <c:if test='${not empty message}'>
            <p class='message'>${message}</p>
            <c:remove var="message" scope="session" />
	</c:if>
                
        <table id="contactListTable">
            <thead>
                <tr>
                    <th bgcolor=>ID</th>
                    <th bgcolor=>First Name</th>
                    <th bgcolor=>Last Name</th>
                    <th bgcolor=>Phone</th>
                    <th bgcolor=>Mobile</th>
                    <th bgcolor=>Email</th>
                    <th bgcolor=>Address</th>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="contact" items="${requestScope.contactList}">
                    <tr>
                        <td>${contact.id}</td> 
                        <td>${contact.firstName}</td>
                        <td>${contact.lastName}</td> 
                        <td>${contact.phone}</td>
                        <td>${contact.mobile}</td> 
                        <td>${contact.email}</td> 
                        <td>${contact.address.street} <br/>
                            ${contact.address.city} <br/>
                            ${contact.address.country}  <br/>
                        </td>
                        <td><a href="updatecontact?id=${contact.id}">Edit</a></td>
                        <td><a href="deletecontact?id=${contact.id}" onclick="return confirm('Do you really want to delete this contact?');">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
