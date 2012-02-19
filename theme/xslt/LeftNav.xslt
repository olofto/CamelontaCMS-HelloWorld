<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:CMS="urn:CMS"
    exclude-result-prefixes="msxsl CMS">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="NodeID"/>
  <xsl:param name="TemplatePath"/>

  <xsl:template match="/Pages/Page">

    <xsl:variable name="haschildren">
      <xsl:for-each select="Page[@Visible='1']">
        <xsl:if test="descendant-or-self::Page/@NodeID = $NodeID and count(child::Page[@Visible='1'])">true</xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <xsl:if test="$haschildren='true'">
      <ul>
        <xsl:for-each select="Page[@Visible='1']">
          <!-- Normal pages -->

          <xsl:if test="descendant-or-self::Page/@NodeID = $NodeID and count(child::Page[@Visible='1'])">

            <xsl:for-each select="Page[@Visible='1']">
              <li>
                <xsl:call-template name="tmpl_NavLink"/>
                <xsl:if test="descendant-or-self::Page/@NodeID = $NodeID">
                  <xsl:if test="count(child::Page[@Visible='1'])">
                    <ul class="submenu">
                      <xsl:for-each select="child::Page[@Visible='1']">
                        <li>
                          <xsl:call-template name="tmpl_SubNavLink"/>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </xsl:if>
                </xsl:if>
              </li>
            </xsl:for-each>
          </xsl:if>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </xsl:template>


  <xsl:template name="tmpl_SubNavLink">
    <a href="{@Url}">
      <xsl:attribute name="title">
        <xsl:value-of select="@NavTitle"/>
      </xsl:attribute>
      <xsl:if test="descendant-or-self::Page/@NodeID = $NodeID">
        <xsl:attribute name="class">sub_selected</xsl:attribute>
      </xsl:if>
      <!--<xsl:value-of select="@NavTitle"/>-->
      <xsl:value-of select="CMS:Limit(@NavTitle, 25, '...')"/>
    </a>
  </xsl:template>

  <xsl:template name="tmpl_NavLink">
    <div>
      <a href="{@Url}">
        <xsl:attribute name="title">
          <xsl:value-of select="@NavTitle"/>
        </xsl:attribute>
        <xsl:if test="descendant-or-self::Page/@NodeID != $NodeID">
          <xsl:attribute name="class">menu_item</xsl:attribute>
        </xsl:if>
        <xsl:if test="descendant-or-self::Page/@NodeID = $NodeID">
          <xsl:attribute name="class">menu_item selected</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="CMS:Limit(@NavTitle, 22, '...')"/>
      </a>
    </div>
  </xsl:template>

</xsl:stylesheet>