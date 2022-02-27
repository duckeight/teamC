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
  position: relative; /* absolute는 부모가 relative일 때 부모를 따라간다. */
  width: 100%;
  /*padding-bottom: 56.25%; /* 16:9 비율 */
  padding-bottom: 79%;
}

#ifm {
  position: absolute;
  width: 100%; /* 부모에 맞게 꽉 채운다. h:1020px*/
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
		<h1>여기가 이제.. 식당 디테일이긴 합니다..?</h1>
	</div>
	
	<!-- 위에 style은 iframe 잘라보려고 달았던 css.. 일단 둔다. -->
   	<iframe id="ifm" src="${url}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
	
	<!-- 이자식은 작동이 안되던거였다고..? -->
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