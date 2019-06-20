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
	<style></style>
<style>
.texts { background-color: rgba( 255, 255, 255, 0.5 ); }
.inputs { font-size: 10pt }
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
<body onLoad='javascript:basexml_checktype( );'>
<form name="graduate">
<P>
<TABLE id="1" style="WIDTH: 98%" borderColor="#000000" cellSpacing="0" cellPadding="5" align="center" border="2">
<COLGROUP>
<COL width="700">
</COL>
</COLGROUP>
<TBODY id="1">
<TR>
<TD>
<P>
<TABLE style="WIDTH: 100%" borderColor="#e0e0e0" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD style="BACKGROUND-IMAGE: url(http://www.uccxml.com/SOAXML/XCMS/sys/client/kr/usr/kura71/uploads/images/Image/Ethereumlogo.png); BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: center center" bgColor="#ffffff">
<P>
<TABLE id="20190531_192027" class="texts" style="WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL width="7%">
</COL>
<COL width="43%">
</COL>
<COL width="43%">
</COL>
<COL width="7%">
</COL>
</COLGROUP>
<TBODY>
<TR style="HEIGHT: 25px">
<TD>
<P>&#160;
</P>
</TD>
<TD>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD colSpan="2">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">졸&#160; 업&#160; 증 &#160;명 &#160;서
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR style="HEIGHT: 35px">
<TD>
<P>&#160;
</P>
</TD>
<TD>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD colSpan="2">
<SPAN style="FONT-SIZE: 10pt">
<STRONG>성명 :
<xsl:value-of select="root/contents/name"/>
</STRONG>
</SPAN>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR style="HEIGHT: 4px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD colSpan="2">
<P>
<SPAN style="FONT-SIZE: 10pt">
<STRONG>주민등록번호 :
<xsl:value-of select="root/contents/registration_num"/>
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR style="HEIGHT: 4px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD colSpan="2">
<SPAN style="FONT-SIZE: 10pt">
<STRONG>학과/전공 :
<xsl:value-of select="root/contents/department_major"/>
</STRONG>
</SPAN>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD colSpan="2">
<SPAN style="FONT-SIZE: 10pt">
<STRONG>학위 :
<xsl:value-of select="root/contents/degree"/>
</STRONG>
</SPAN>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR style="HEIGHT: 4px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD colSpan="2">
<SPAN style="FONT-SIZE: 10pt">
<STRONG>졸업일자 :&#160;
<xsl:value-of select="root/contents/graduation_date"/>
</STRONG>
</SPAN>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 4px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD colSpan="2">
<SPAN style="FONT-SIZE: 10pt">
<STRONG>학위등록번호 :&#160;
<xsl:value-of select="root/contents/degree_num"/>
</STRONG>
</SPAN>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 30px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD colSpan="2">
<P align="center">
<SPAN style="FONT-SIZE: 10pt">위의 사실을 증명 합니다.
</SPAN>
</P>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD colSpan="2">
<P align="center">
<xsl:value-of select="root/contents/date"/>
</P>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 15px">
<TD>
</TD>
<TD colSpan="2">
<P align="center">&#160;
</P>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
<P>&#160;
</P>
<P>&#160;
</P>
<P>&#160;
</P>
<P>&#160;
</P>
<P>&#160;
</P>
<P>&#160;
</P>
<P>&#160;
</P>
</TD>
<TD>
<P align="center">&#160;
</P>
<TABLE style="HEIGHT: 85px; WIDTH: 100px" borderColor="#000000" cellSpacing="0" cellPadding="1" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P align="center">
<IMG src="http://www.uccxml.com/SOAXML/XCMS/sys/client/kr/usr/kura71/uploads/images/Image/dojang_signature.jpg" width="95" height="80"/>
</P>
</TD>
</TR>
</TBODY>
</TABLE>&#160;
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD colSpan="2">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">3K 대학교 총장
</SPAN>
</STRONG>
</P>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
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
