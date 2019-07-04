<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/">
<xsl:decimal-format name="digit" decimal-separator="." grouping-separator="," infinity="&#x221E;" minus-sign="-" NaN="0" percent="%" per-mille="&#x03BC;" zero-digit="0" digit="#" pattern-separator=";" />
<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" />
<xsl:template match="/">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title> graduate </title>
	<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
	
	<link type="text/css" href="http://220.76.95.91:3000/public/vendor/bootstrap/css/bootstrap.css" rel="stylesheet"/>
	<link type="text/css" href="http://220.76.95.91:3000/public/css/sm-admin.css" rel="stylesheet"/>
	<link type="text/css" href="http://220.76.95.91:3000/public/css/md-admin.css" rel="stylesheet" media="screen and (min-width: 768px)" />
	<link type="text/css" href="http://220.76.95.91:3000/public/css/lg-admin.css" rel="stylesheet" media="screen and (min-width: 1240px)" />
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&amp;display=swap&amp;subset=korean" rel="stylesheet" />

	<style type="text/css">
	body {
		font-family: 'Noto Sans KR', "Nanum Gothic", NanumGothic, 나눔고딕, "Malgun Gothic", MalgunGothic, 맑은고딕, Arial, sans-serif
	}
	</style>

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
<body onLoad='javascript:basexml_checktype( );' class="certificate-body">

<form name="graduate">
	<div class="certificate-box" id="1">
		<div class="certificate-box-container">			
			<div id="20190531_192027">
				<div class="certificate-box-header">
					졸&#160; 업&#160; 증 &#160;명 &#160;서
				</div>
				<div class="certificate-box-body">
					<div class="table-responsive">
						<table class="table-style3">
							<tr>
								<th>성명</th>
								<td><xsl:value-of select="root/contents/name"/></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><xsl:value-of select="root/contents/registration_num"/></td>
							</tr>
							<tr>
								<th>학과/전공</th>
								<td><xsl:value-of select="root/contents/department_major"/></td>
							</tr>
							<tr>
								<th>학위</th>
								<td><xsl:value-of select="root/contents/degree"/></td>
							</tr>
							<tr>
								<th>졸업일자</th>
								<td><xsl:value-of select="root/contents/graduation_date"/></td>
							</tr>
							<tr>
								<th>학위등록번호</th>
								<td><xsl:value-of select="root/contents/degree_num"/></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="certificate-box-footer">
					<p class="certificate-txt">위의 사실을 증명 합니다.</p>
					<p class="certificate-date"><xsl:value-of select="root/contents/date"/></p>
					<div class="certificate-sign">
						<strong>3K 대학교 총장</strong>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script language="JavaScript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxXsl.js"></script>

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