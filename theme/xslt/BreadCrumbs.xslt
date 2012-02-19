<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="NodeID"/>

  <xsl:template match="/Pages">
    <xsl:apply-templates select="//Page[@NodeID=$NodeID]"/>
  </xsl:template>

  <xsl:template match="Page">

    <xsl:for-each select="ancestor::Page">
      <a href="{@Url}">
        <xsl:value-of select="@NavTitle"/>
      </a>
      <span class="separator">/</span>
    </xsl:for-each>
    <xsl:value-of select="@NavTitle"/>
  </xsl:template>
</xsl:stylesheet>