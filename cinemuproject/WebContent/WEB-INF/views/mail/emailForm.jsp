<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<article>
        <header>
            <h1>Contact</h1>
        </header>
        <ul class="list-unstyled"><li class="border-top my-3"></li></ul>
        <div class="container">
	<form id="sendEmailForm" method="post" action="sendEmail">
		<!-- 
		enctype="multipart/form-data">
		 -->
		<table id="emailFormBeanTable" border="0" width="80%">
			<tr>
				<td>Email To:</td>
				<td><input id="receiverMail" type="text" name="mailTo"
					size="65" /></td>
			</tr>
			<tr>
				<td>Subject:</td>
				<td><input id="mailSubject" type="text" name="subject"
					size="65" /></td>
			</tr>
			<tr>
				<td>Message:</td>
				<td><textarea id="mailMessage" cols="50" rows="10"
						name="message"></textarea></td>
			</tr>
			<tr>
				<td>Attachment:</td>
				<td><input id="mailAttachment" type="file" name="attachFileObj"
					size="60" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="sendEmailBtn"
					type="submit" value="Send Email" /></td>
			</tr>
		</table>
	</form>
</div>
</article>
