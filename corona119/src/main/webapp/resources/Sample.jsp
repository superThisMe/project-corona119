<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
/* Javascript 샘플 코드 */


var xhr = new XMLHttpRequest();
var url = 'http://newsky3.kma.go.kr/openAPI/VilageFcstInfoService/getUltraSrtNcst'; /*URL*/
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'GG13iBAWc+jBaIeB3tqs4UxLr5IVRIqWf3K0s2QX4K3ivqnb2ZJhP0PRZtvSPSNN6K1H9MqwEHrpxuJTfu6jaQ=='; /*Service Key*/
queryParams += '&' + encodeURIComponent('ServiceKey') + '=' + encodeURIComponent('-'); /**/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /**/
queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20151201'); /**/
queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('18'); /**/
queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('1'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');
</script>
<title>주소 입력 샘플</title>
</head>
<body>
ddd
</body>
</html>