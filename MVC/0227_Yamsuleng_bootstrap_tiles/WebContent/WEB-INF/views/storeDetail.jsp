<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
#divF {
	display: flex;
  position: relative; /* absolute�� �θ� relative�� �� �θ� ���󰣴�. */
  width: 100%;
  /*padding-bottom: 56.25%; /* 16:9 ���� */
  padding-bottom: 79%;
}

#ifm {
  position: absolute;
  width: 100%; /* �θ� �°� �� ä���. h:1020px*/
  height: 100%;
}

table, td, th {
  border : 1px solid black;
  border-collapse : collapse;
}

</style>

</head>
<body>

	<div>
		<h1>���Ⱑ ����.. �Ĵ� �������̱� �մϴ�..?</h1>
	</div>
	
	<!-- ���� style�� iframe �߶󺸷��� �޾Ҵ� css.. �ϴ� �д�. -->
   	<iframe id="ifm" src="${url}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
	
	<!-- ���ڽ��� �۵��� �ȵǴ��ſ��ٰ�..? -->
	<!-- 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script language="JavaScript">
		function resizeHeight(fr) {
			var frbody = $("#ifm").contentWindow.document.body;
			$("#ifm").style.height = frbody.scrollHeight + ( frbody.offsetHeight - frbody.clientHeight );
		}
	</script>
	 -->


</body>
</html>