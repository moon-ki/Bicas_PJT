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
	<title> attend </title>
	<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
	<style></style>
<style>
.circles { border-radius:50%; background-color: lightgrey; }
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
<form name="attend">
<P>
<TABLE id="9" style="WIDTH: 96%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="700">
</COL>
</COLGROUP>
<TBODY id="9">
<TR>
<TD>
<P>
<TABLE id="20190523_160414" style="HEIGHT: 0px; WIDTH: 92%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY id="10">
<TR style="HEIGHT: 30px">
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P>
<SPAN style="FONT-SIZE: 9pt">
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 15px">
<TD>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 22pt">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">재 학 증 명 서
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 30px">
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<P>
<TABLE id="20190603_182418" style="WIDTH: 92%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL width="7%">
</COL>
<COL width="26%">
</COL>
<COL width="2%">
</COL>
<COL width="58%">
</COL>
<COL width="7%">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">
<STRONG>
<SPAN style="FONT-SIZE: 10pt">성&#160;&#160;&#160;&#160;&#160; 명
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/name"/>
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD colSpan="4">
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 10pt">생년월일
</SPAN>
</STRONG>
</P>
</TD>
<TD>
</TD>
<TD>
<xsl:value-of select="root/contents/birthday"/>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD colSpan="5">
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">
<STRONG>
<SPAN style="FONT-SIZE: 10pt">대&#160;&#160;&#160;&#160;&#160; 학
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
<TD>
</TD>
<TD>
<xsl:value-of select="root/contents/name_of_university"/>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD colSpan="5">
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">
<STRONG>
<SPAN style="FONT-SIZE: 10pt">학과(학부)
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
<TD>
</TD>
<TD>
<xsl:value-of select="root/contents/department"/>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD colSpan="5">
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">
<STRONG>
<SPAN style="FONT-SIZE: 10pt">학&#160;&#160;&#160;&#160;&#160; 년
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
<TD>
</TD>
<TD>
<xsl:value-of select="root/contents/class_of"/>
</TD>
<TD>
</TD>
</TR>
<TR style="HEIGHT: 30px">
<TD colSpan="5">
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<TABLE id="4" style="WIDTH: 92%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL width="100%">
</COL>
</COLGROUP>
<TBODY id="3">
<TR>
<TD>
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 9pt">학적원부에 의하여 위 사실을 증명함.
</SPAN>
</STRONG>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<xsl:value-of select="root/contents/date"/>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
</TD>
</TR>
<TR style="HEIGHT: 0px">
<TD>
<P align="right">
<TABLE style="HEIGHT: 100px; WIDTH: 120px" borderColor="#c0c0c0" cellSpacing="0" cellPadding="1" align="right" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P align="center">
<IMG src="http://www.uccxml.com/SOAXML/XCMS/sys/client/kr/usr/kura71/uploads/images/Image/dojang_signature.jpg" width="115" height="95"/>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 12pt">
<STRONG>
</STRONG>
</SPAN>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 12pt">
<STRONG>3K 대학교 교무차장
</STRONG>
</SPAN>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
<P>&#160;
</P>
<P>&#160;
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
