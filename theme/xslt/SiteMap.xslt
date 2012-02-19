<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:CMS="urn:CMS"
    exclude-result-prefixes="msxsl CMS">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="NodeID"/>
  <xsl:param name="TemplatePath"/>

  <xsl:template match="/Pages/Page">

    <xsl:for-each select="Page[@Visible[.='1']]">
      <ul class="grid_3 sitemap" style="width:192px;">
        <xsl:call-template name="tmpl_Page"/>
        <!--xsl:value-of select="CMS:FormatXml(.)" disable-output-escaping="yes"/-->
        <xsl:for-each select="Page[@Visible[.='1']]">
          <xsl:call-template name="tmpl_Page"/>
          <xsl:for-each select="Page[@Visible[.='1']]">
            <xsl:call-template name="tmpl_Page">
              <xsl:with-param name="className"> level3</xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:for-each>
      </ul>
    </xsl:for-each>

  </xsl:template>


  <xsl:template name="tmpl_Page">
    <xsl:param name="className"/>
    <xsl:variable name="classNameAuto">
      <xsl:choose>
        <xsl:when test="count(ancestor::Page)=1">headline</xsl:when>
        <xsl:when test="position()=last()">last</xsl:when>
        <xsl:when test="position()=1">first</xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <li class="{$classNameAuto}{$className}">
      <xsl:if test="$className=' level3'">
        <img src="{$TemplatePath}/theme/images/dots-level3.gif" />
      </xsl:if>
      <a href="{@Url}">
        <xsl:value-of select="CMS:Limit(@NavTitle, 30, '...')"/>
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>