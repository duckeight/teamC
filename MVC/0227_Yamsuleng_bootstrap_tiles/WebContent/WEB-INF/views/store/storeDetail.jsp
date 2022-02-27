<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

   	<iframe id="ifm" src="${url}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
	

