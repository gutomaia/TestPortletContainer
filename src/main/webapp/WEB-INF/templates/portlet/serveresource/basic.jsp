<%@ taglib uri='http://java.sun.com/portlet_2_0' prefix='p' %>
<jsp:useBean id="ajaxResource" class="java.lang.String" scope="request" />

<p:defineObjects  />

<script type="text/javascript"><!--

	function testServeResourceBasic(namespace, ajaxResource){
		var resultMsg = "";
		var xhr = false;
		try {
			xhr = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				try {
					xhr = new XMLHttpRequest();					
				}catch (e){
					xhr = false;
					resultMsg += "- could not get a valid XMLHttpRequest object on this crap browser<br/>";
				}
			}
		}
		var response = "error";
		if (xhr){
			try {
				xhr.open("GET", ajaxResource, false);
		        xhr.send(null);
		        response = xhr.responseText;
		        resultMsg += (xhr.status != 200)?"- invalid http status code: "+xhr.status:"";
		        resultMsg += (response != 'OK')?"- invalid response: "+xhr.responseText:"";
			} catch (e) {
				resultMsg += "a problem occur while using the XMLHttpRequest ";//e.getMessage;
			}
		}
		var resultDiv = document.getElementById("results_"+namespace);
		resultMsg = (resultMsg == "")?response:resultMsg;
		resultDiv.innerHTML = resultMsg;
	}
</script>

<h1>TestServeResourceBasic</h1>

<div>Test Status:</div>
<div id="results_<p:namespace />">No tested yet!</div>

<input type="button" value="Test" onclick="testServeResourceBasic('<p:namespace />', '${ajaxResource}')" />