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
	<title> App_form </title>
	<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
	<style></style>
<style>
.titlefsize14 { font-size: 14pt; }
.textboxs { font-size: 8pt; }
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
<form name="App_form">
<P>
<TABLE style="WIDTH: 98%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="700">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>
<TABLE id="3" style="WIDTH: 95%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR style="HEIGHT: 10px">
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 18pt">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">
<SPAN style="FONT-SIZE: 18pt">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">&#160;
</SPAN>
</STRONG>
</SPAN>
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<FONT size="5">
<SPAN style="FONT-SIZE: 18pt">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">
<SPAN style="FONT-SIZE: 18pt">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">
<xsl:value-of select="root/contents/title"/>
&#160;
</SPAN>
</STRONG>
</SPAN>
</SPAN>
</STRONG>
</SPAN>
<STRONG>증명 신청서
</STRONG>
</FONT>
</P>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<P>
<TABLE id="20190531_162323" style="WIDTH: 95%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="20%">
</COL>
<COL width="30%">
</COL>
<COL width="20%">
</COL>
<COL width="30%">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD bgColor="#8cabf2" colSpan="4">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 10pt">신청 내역
</SPAN>
</STRONG>
</P>
</TD>
</TR>
<TR>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">이름*
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/name"/>
</P>
</TD>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">전공학과*
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/department"/>
</P>
</TD>
</TR>
<TR>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">생년월일
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/birthday"/>
</P>
</TD>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">학번*
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/class_of"/>
</P>
</TD>
</TR>
<TR>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">
<STRONG>용도*
</STRONG>
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/purpose"/>
</P>
</TD>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">신청일
</SPAN>
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/Application_date"/>
</P>
</TD>
</TR>
<TR style="HEIGHT: 55px">
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 8pt">기타사항
</SPAN>
</STRONG>
</P>
</TD>
<TD colSpan="3">
<P>
<xsl:apply-templates select="root/contents/Other"/>&#160;
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<TABLE id="1" style="WIDTH: 95%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY id="1">
<TR style="HEIGHT: 10px">
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">상기 본인은&#160;증명서 발급을 요청 합니다.
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 40px">
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<TABLE id="20190526_124756" style="WIDTH: 55%" borderColor="#e0e0e0" cellSpacing="0" cellPadding="1" align="right" border="1">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">신청자
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 180px">
<TD>
<DIV align="center">
<DIV id="div_root_contents_sign" class="signature" style="HEIGHT: 175px; WIDTH: 95%; POSITION: relative">
<DIV align="left">&#160;
</DIV>
</DIV>
</DIV>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">3K BICAS 대학교 교무처 귀중
</SPAN>
</STRONG>
</P>
</TD>
</TR>
<TR style="HEIGHT: 10px">
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
</form>
<script language="JavaScript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxXsl.js"></script>
	<div class="docBtn_list">
		<input type="button" value="Update" onclick="javascript:bxfXmlModifyMongodb();" /> &#160;
		<input type="button" value="List" onclick="javascript:bxfXmlListMongodb();" /> &#160;
		<input type="button" value="Search" onclick="javascript:bxfXmlSearchMongodb();" />
	</div>
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
