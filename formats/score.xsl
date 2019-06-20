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
	<title> score </title>
	<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
	<style></style>
<style>
.nobdr { border: none; }
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
<form name="score">
<P>
<TABLE style="WIDTH: 98%" borderColor="#808080" cellSpacing="0" cellPadding="5" align="center" border="1">
<COLGROUP>
<COL width="700">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>
<TABLE id="2" style="WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
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
<TR style="HEIGHT: 20px">
<TD>
<P>
</P>
</TD>
<TD>
<P>
</P>
</TD>
<TD>
<P>
</P>
</TD>
<TD>
<P>
</P>
</TD>
</TR>
<TR>
<TD colSpan="4">
<P align="center">
<SPAN style="FONT-SIZE: 14pt">
<STRONG>성 적 증 명 서
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 20px">
<TD>
<P>
</P>
</TD>
<TD>
<P>
</P>
</TD>
<TD>
<P>
</P>
</TD>
<TD>
<P>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<TABLE id="9" style="WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="22%">
</COL>
<COL width="28%">
</COL>
<COL width="22%">
</COL>
<COL width="28%">
</COL>
</COLGROUP>
<TBODY id="9">
<TR style="HEIGHT: 25px">
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">이름
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/name"/>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">전공학과
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/major_course"/>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">학번
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/class_of"/>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">졸업년도
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/graduation_year"/>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
<HR style="HEIGHT: 0px; WIDTH: 100%; BACKGROUND-COLOR: #e0e0e0"/>
<TABLE id="44" style="HEIGHT: 0px; WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="15%">
</COL>
<COL width="45%">
</COL>
<COL width="15%">
</COL>
<COL width="25%">
</COL>
</COLGROUP>
<TBODY>
<TR style="HEIGHT: 30px">
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>구분
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>과목명
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>학점
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>이수년월
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<P align="left">
<xsl:value-of select="root/Sortation/s1"/>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/Subject_name/sn1"/>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/Grades/g1"/>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/Completion/c1"/>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<xsl:value-of select="root/Sortation/s2"/>
</TD>
<TD>
<xsl:value-of select="root/Subject_name/sn2"/>
</TD>
<TD>
<xsl:value-of select="root/Grades/g2"/>
</TD>
<TD>
<xsl:value-of select="root/Completion/c2"/>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<xsl:value-of select="root/Sortation/s3"/>
</TD>
<TD>
<xsl:value-of select="root/Subject_name/sn3"/>
</TD>
<TD>
<xsl:value-of select="root/Grades/g3"/>
</TD>
<TD>
<xsl:value-of select="root/Completion/c3"/>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<xsl:value-of select="root/Sortation/s4"/>
</TD>
<TD>
<xsl:value-of select="root/Subject_name/sn4"/>
</TD>
<TD>
<xsl:value-of select="root/Grades/g4"/>
</TD>
<TD>
<xsl:value-of select="root/Completion/c4"/>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<xsl:value-of select="root/Sortation/s5"/>
</TD>
<TD>
<xsl:value-of select="root/Subject_name/sn5"/>
</TD>
<TD>
<xsl:value-of select="root/Grades/g5"/>
</TD>
<TD>
<xsl:value-of select="root/Completion/c5"/>
</TD>
</TR>
</TBODY>
</TABLE>
<HR style="HEIGHT: 0px; WIDTH: 100%; BACKGROUND-COLOR: #e0e0e0"/>
<TABLE style="WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="25%">
</COL>
<COL width="25%">
</COL>
<COL width="25%">
</COL>
<COL width="25%">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD colSpan="4">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 9pt">인정학점
</SPAN>
</STRONG>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>전공필수
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>전공선택
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>교양
</STRONG>
</SPAN>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>일반선택
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD>
<P>
<xsl:value-of select="root/recognized_credit/rc1"/>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/recognized_credit/rc2"/>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/recognized_credit/rc3"/>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/recognized_credit/rc4"/>
</P>
</TD>
</TR>
<TR>
<TD colSpan="4">
<P align="right">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>학점합계
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 25px">
<TD colSpan="4">
<P align="right">
<xsl:value-of select="root/recognized_credit/total"/>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
<TABLE id="6" style="HEIGHT: 125px; WIDTH: 100%" borderColor="#c0c0c0" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD class="texts" style="BACKGROUND-IMAGE: url(http://www.uccxml.com/SOAXML/XCMS/sys/client/kr/usr/kura71/uploads/images/Image/SCdojang_signature.jpg); BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: 85% 65%">
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>상기인의 학습과목별 성적을 위와
</STRONG>
</SPAN>
</P>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>같이 증명합니다.
</STRONG>
</SPAN>
</P>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
</SPAN>&#160;
</P>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<xsl:value-of select="root/contents/date"/>
</SPAN>
</P>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
</SPAN>&#160;
</P>
<P align="center">
<SPAN style="FONT-SIZE: 8pt">
<STRONG>
<SPAN style="FONT-SIZE: 14pt">3K 대학교
</SPAN>
</STRONG>
</SPAN>
</P>
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
	</div>
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
