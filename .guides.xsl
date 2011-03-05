<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output type="xml" doctype-public="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="no" standalone="yes" media-type="application/html+xml" />
	
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="guide/title" /></title>
				<link href="./.guide.css" rel="stylesheet" type="text/css" />
                                <script type="text/javascript" src="./adsense.js"></script>
			</head>
			<body>
				<xsl:apply-templates select="guide/body" />
				<xsl:apply-templates select="guide/revisions" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="//guide/title">
	       <h1><xsl:value-of select="." /></h1>
	</xsl:template>
	
	<xsl:template match="//section/title">
		<h2><xsl:value-of select="." /></h2>
	</xsl:template>
	
	<xsl:template match="body">
                <div id="Heading">
		<xsl:apply-templates select="/guide/title" />
		<xsl:apply-templates select="/guide/author" />
                </div>
                <div id="Floater"><script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
		<div id="Content"><xsl:apply-templates /><div id="License"><xsl:apply-templates select="/guide/author/license" /></div></div>
	</xsl:template>
	
	<xsl:template match="author">
		<div id="Author">Written by <xsl:apply-templates select="name" />, on <xsl:apply-templates select="../date" /></div>
	</xsl:template>
	
	<xsl:template match="name">
		<a><xsl:attribute name="href"><xsl:apply-templates select="../email" /></xsl:attribute><xsl:value-of select="." /></a>
	</xsl:template>
	
	<xsl:template match="email">
		mailto:<xsl:value-of select="@user" />&#64;<xsl:value-of select="@domain" />
	</xsl:template>
	
	<xsl:template match="section">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="text">
		<div class="text"><xsl:apply-templates /></div>
	</xsl:template>
	<xsl:template match="exec">
		<pre class="exec"><xsl:apply-templates /></pre>
	</xsl:template>
	
	<xsl:template match="config">
		<div class="tconfig"><div class="location">File: <xsl:value-of select="@location" /></div><pre class="config"><xsl:apply-templates /></pre></div>
	</xsl:template>
	
	<xsl:template match="tip">
		<div class="tip"><xsl:apply-templates /></div>
	</xsl:template>
	
	<xsl:template match="list[@type='unordered']">
		<ul><xsl:apply-templates /></ul>
	</xsl:template>
	
	<xsl:template match="list[@type='ordered']">
		<ol><xsl:apply-templates /></ol>
	</xsl:template>
	
	<xsl:template match="item">
		<li><xsl:apply-templates /></li>
	</xsl:template>
	
	<xsl:template match="link">
		<a><xsl:attribute name="href"><xsl:value-of select="@xlink:href" /></xsl:attribute><xsl:apply-templates /></a>
	</xsl:template>
	<xsl:template match="license">
	       Copyright &#xA9; <xsl:value-of select="@year" /><xsl:text> </xsl:text><xsl:apply-templates select="../name" /> <br />  License: <a><xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute><xsl:apply-templates /></a>
        </xsl:template>
</xsl:stylesheet>
