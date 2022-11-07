<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<p>Select your favorite programming language:</p>
		<div>
			<input type="radio" id="java" name="language" value="java" 체크>
			<label for="java">Java</label> <input type="radio" id="cpp"
				name="language" value="cpp"> <label for="cpp">C++</label> <input
				type="radio" name="language" value="python"> <label
				for="python">Python</label>
		</div>
		<button id="submit">Submit</button>
	</div>

	<script>
		document.getElementById('submit').onclick = function() {
			var radio = document
					.querySelector('input[type=radio][name=language]:checked');
			radio.checked = false;
		}
	</script>
</body>
</html>