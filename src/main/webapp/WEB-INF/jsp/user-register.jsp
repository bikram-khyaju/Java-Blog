<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user"
	cssClass="form-horizontal registration-form">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">Registration successfull!</div>
	</c:if>

	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name</label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" />
			<form:errors path="name" />
		</div>
	</div>
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Email</label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" />
			<form:errors path="email" />
		</div>
	</div>
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" />
			<form:errors path="password" />
		</div>
	</div>
	<div class="form-group">
		<label for="confirm-password" class="col-sm-2 control-label">Confirm
			Password</label>
		<div class="col-sm-10">
			<input type="password" name="confirm_password" id="confirm_password"
				class="form-control">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-2">
			<input type="submit" name="Save" value="Save"
				class="btn btn-lg btn-primary">
		</div>
	</div>
</form:form>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".registration-form")
								.validate(
										{
											rules : {
												name : {
													required : true,
													minlength : 3,
													remote : {
														url : "<spring:url value='/register/available.html' />",
														type : "get",
														data : {
															username : function() {
																return $(
																		"#name")
																		.val();
															}
														}
													}
												},
												password : {
													required : true,
													minlength : 5
												},
												confirm_password : {
													required : true,
													minlength : 5,
													equalTo : "#password"
												},
												email : {
													required : true,
													email : true
												}
											},
											highlight : function(element) {
												$(element).closest(
														".form-group")
														.removeClass(
																"has-success")
														.addClass("has-error");
											},
											unhighlight : function(element) {
												$(element)
														.closest(".form-group")
														.removeClass(
																"has-error")
														.addClass("has-success");
											},
											messages : {
												name : {
													remote : "Username already exists!"
												}
											}
										});
					});
</script>
