<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/">
<xsl:decimal-format name="digit" decimal-separator="." grouping-separator="," infinity="&#x221E;" minus-sign="-" NaN="0" percent="%" per-mille="&#x03BC;" zero-digit="0" digit="#" pattern-separator=";" />
<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" />
<xsl:template match="/">
<html lang="ko">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW" />
<title> App_form </title>
<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
<!-- CSS -->
<!-- <xsl:template match="/*//*[1]"> -->
<!-- <link rel="stylesheet" type="text/css" href="/public/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/public/css/sm-admin.css" />
<link rel="stylesheet" type="text/css" href="/public/css/md-admin.css" media="screen and (min-width: 768px)" />
<link rel="stylesheet" type="text/css" href="/public/css/lg-admin.css" media="screen and (min-width: 1240px)" /> -->
<!-- </xsl:template> -->
<!-- <style type="text/css"></style> -->

<link type="text/css" href="http://220.76.95.91:3000/public/vendor/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<link type="text/css" href="http://220.76.95.91:3000/public/css/sm-admin.css" rel="stylesheet"/>
<link type="text/css" href="http://220.76.95.91:3000/public/css/md-admin.css" rel="stylesheet" media="screen and (min-width: 768px)" />
<link type="text/css" href="http://220.76.95.91:3000/public/css/lg-admin.css" rel="stylesheet" media="screen and (min-width: 1240px)" />

<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxControl.js"></script>
<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxCommon.js"></script>
<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery-ui.1.10.3.min.js"></script>
<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery.uniform.js"></script>
<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jSignature.custom.js"></script>
<script type="text/javascript">
	function basexml_checktype() {
		$("input, textarea, select, button").uniform();
		$("input[type='radio']").each(function(){
			$(this).attr("disabled","true");
		});
		$("input[type='checkbox']").each(function(){
			$(this).attr("disabled","true");
		});
		$("select").each(function(){
			$(this).attr("disabled","true");
		});
	}
</script>
<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxFormForMongo.js"></script>

</head>
<body onLoad='javascript:basexml_checktype( );' class="app-form-body">
<form name="App_form">
	<div id="3" class="app-form-header">
		<xsl:value-of select="root/contents/title"/>증명 신청서
	</div>
	<div class="app-form-body">
		<table id="20190531_162323" class="table-style2">
			<tbody>
				<tr>
					<th>이  름</th>
					<td><div class="form-group">
							<xsl:value-of select="root/contents/name"/>
						</div></td>
					<th>전공학과</th>
					<td><div class="form-group">
							<xsl:value-of select="root/contents/department"/>
						</div></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><div class="form-group">
							<xsl:value-of select="root/contents/birthday"/>
						</div></td>
					<th>학  번</th>
					<td><div class="form-group">
							<xsl:value-of select="root/contents/class_of"/>
						</div></td>
				</tr>
				<tr>
					<th>용  도</th>
					<td><div class="form-group">
							<xsl:value-of select="root/contents/purpose"/>
						</div></td>
					<th>신청일</th>
					<td><div class="form-group">
							<xsl:value-of select="root/contents/Application_date"/>
						</div></td>
				</tr>
				<tr >
					<th>기타사항</th>
					<td colspan="3"><div class="form-group">
							<xsl:apply-templates select="root/contents/Other"/>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="1" class="app-form-footer">
		<p class="app-form-txt">상기 본인은 증명서 발급을 요청 합니다.</p>
		<div class="app-form-sign-wrap">
			<div class="app-form-sign-box"> 
				<span class="app-form-sign-txt">신청자</span>
				<div id="20190526_124756">
					<div id="div_root_contents_sign" class="app-form-sign"></div>
				</div>
			</div>
		</div>
		<p class="app-form-txt2">3K 대학교 교무처 귀중</p>
	</div>
</form>

<div class="btn-wrap btn-flex">
	<input type="button" value="반려" onclick='adminReject();'/>
	<input type="button" value="승인" onclick='adminAccept();'/>
</div>

<script type="text/javascript">

    function adminAccept(seq, file_name){
        var answer = confirm('해당 신청서를 승인하겠습니까?');
		if(answer){
			var url =new URL(window.location.href);
			var seq = url.searchParams.get('seq');
			var param = 'seq='+seq;
			var client = new XMLHttpRequest();
            client.open("POST",'http://220.76.95.91:3000/admin/createContract/accept/'+seq, true);
            client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            client.send(param);
			alert('신청서가 승인되었습니다.');
			location.href='http://220.76.95.91:3000/admin/cetificate/'+seq;
		}
    }

    function adminReject(){
        var answer = confirm('해당 증명서를 반려하겠습니까?');
		if(answer){
			var url =new URL(window.location.href);
			var seq = url.searchParams.get('seq');
			var param = 'seq='+seq;
			var client = new XMLHttpRequest();
            client.open("POST",'http://220.76.95.91:3000/admin/reject/'+seq, true);
            client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            client.send(param);
			alert('반려 되었습니다.');
			self.close();
		}
    }
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$signImg = $("#div_root_contents_sign");
	sign = new Image();
	sign.src = '<xsl:value-of select="root/contents/sign"/>';
	$(sign).appendTo($signImg);
	});
</script>
</body>
</html>
</xsl:template>
<xsl:template match="BR"><br/></xsl:template>
<xsl:template match="br"><br/></xsl:template>
<xsl:template match="li"><li/></xsl:template>
<xsl:template match="LI"><LI/></xsl:template>
<xsl:template match="A">
<xsl:element name="a">
	<xsl:attribute name="href" ><xsl:value-of select="@href"/></xsl:attribute>
	<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
	<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
	<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="FONT">
<xsl:element name="FONT">
	<xsl:attribute name="color"><xsl:value-of select="@color"/></xsl:attribute>
	<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
	<xsl:attribute name="face"><xsl:value-of select="@face"/></xsl:attribute>
	<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="IMG">
<xsl:element name="img">
	<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
	<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
	<xsl:attribute name="hspace"><xsl:value-of select="@hspace"/></xsl:attribute>
	<xsl:attribute name="vspace"><xsl:value-of select="@vspace"/></xsl:attribute>
	<xsl:attribute name="border"><xsl:value-of select="@border"/></xsl:attribute>
	<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="HR"><hr/></xsl:template>
</xsl:stylesheet>
