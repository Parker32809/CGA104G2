<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->

<!--     <title>��ܮ�</title> -->
<!--     <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css"> -->
<!--     <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script> -->
<!--     <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script> -->
<!--     <link rel="stylesheet" href="jqueryui/style.css"> -->
<style>
div{
	padding: 5px;
	text-align: center;
}

</style>
</head>
<body>
	<div class="border border-info">
		<div>
			<span>11��޲z�O</span>
		</div>
		<div>
			<span>ú�O����</span>
		</div>
		<div>
			<span>�ݾP�b���B</span>
		</div>
		<div>
			<span>���ة���</span>
		</div>
		<div>
			<span>�޲z�O</span>
		</div>
		<div>
			<span>����M��O</span>
		</div>
		<div>
			<span>--------------------------</span>
		</div>
		<div>
			<span>�X�p</span>
		</div>
	</div>
	<div>
		<button id="opener">�e��ú�O</button>
		<div>
			<ul>
				<div id="dialog" onclick="transfer()" title="Basic dialog">
					<a href="../../transfer?action=transfer">
						<p>�״�</p>
					</a> <a href="Card.html">
						<p>��d</p>
					</a>
					<button id="save">�T�{</button>
				</div>

				</li>
			</ul>
		</div>
	</div>
	<script>
		$(function() {
			$("#dialog").dialog({
				autoOpen : false,
				show : {
					effect : "blind",
					duration : 1000
				},
				hide : {
					effect : "explode",
					duration : 1000
				}
			});
			$("#opener").click(function() {
				$("#dialog").dialog("open");
			});

		})

		function transfer() {
			windows.location.href = "Transfer.jsp"
		}
	</script>
</body>
</html>