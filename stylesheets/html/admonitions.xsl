<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:f="http://docbook.org/xslt/ns/extension" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:db="http://docbook.org/ns/docbook" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:m="http://docbook.org/xslt/ns/mode" xmlns:ghost="http://docbook.org/ns/docbook/ephemeral" xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://docbook.org/xslt/ns/template" xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="h f m fn db doc xs t ghost" version="2.0">
    <xsl:template match="db:note|db:important|db:warning|db:caution|db:tip">
        <xsl:choose>
            <xsl:when test="$admonition.graphics">
                <xsl:apply-templates select="." mode="m:graphical-admonition"/>
            </xsl:when>
            <xsl:otherwise>
                <div>
                    <xsl:apply-templates select="." mode="m:html-attributes">
                        <xsl:with-param name="class" select="'admonition'"/>
                    </xsl:apply-templates>
                    <xsl:call-template name="t:titlepage"/>
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- ============================================================ -->
    <doc:mode xmlns="http://docbook.org/ns/docbook" name="m:graphical-admonition">
        <refpurpose>Mode for processing admonitions with graphics</refpurpose>
        <refdescription>
            <para>There are two distinct presentational styles for admonitions, with
graphics and without. Processing an admonition in this mode produces
the graphical form.</para>
        </refdescription>
    </doc:mode>
    <xsl:template match="db:note|db:important|db:warning|db:caution|db:tip" mode="m:graphical-admonition">
        <xsl:variable name="admon.type">
            <xsl:choose>
                <xsl:when test="self::db:note">Note</xsl:when>
                <xsl:when test="self::db:warning">Warning</xsl:when>
                <xsl:when test="self::db:caution">Caution</xsl:when>
                <xsl:when test="self::db:tip">Tip</xsl:when>
                <xsl:when test="self::db:important">Important</xsl:when>
                <xsl:otherwise>Note</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="alt">
            <xsl:call-template name="gentext">
                <xsl:with-param name="key" select="$admon.type"/>
            </xsl:call-template>
        </xsl:variable>

  <!-- I'd really rather not do this with a table, but getting the -->
  <!-- alignment with and without a title without using a table is -->
  <!-- painfully complicated. That said, the vertical spacing is   -->
  <!-- awfully complicated with a table. -->
        <div>
            <xsl:apply-templates select="." mode="m:html-attributes">
                <xsl:with-param name="class" select="'admonition'"/>
            </xsl:apply-templates>
            <table border="0" cellspacing="0" cellpadding="4" summary="Presentation of a {local-name(.)}">
                <tbody>
                    <tr>
                        <td valign="top">
                            <span class="admon-graphic">
                                <img alt="{$alt}">
                                    <xsl:attribute name="src">
                                        <xsl:call-template name="admonition-graphic"/>
                                    </xsl:attribute>
                                </img>
                            </span>
                        </td>
                        <td>
                            <xsl:if test="db:info/db:title[not(@ghost:title)                       or $admonition.default.titles != 0]">
                                <div class="admon-title-text">
                                    <xsl:call-template name="t:titlepage"/>
                                </div>
                            </xsl:if>
                            <div class="admon-text">
                                <xsl:apply-templates/>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>

<!-- ============================================================ -->
    <doc:template xmlns="http://docbook.org/ns/docbook" name="admonition-graphic">
        <refpurpose>Returns the name of the appropriate admonition graphic</refpurpose>
        <refdescription>
            <para>This template returns the name (URI) of the graphic to be used
for the specified admonition.</para>
        </refdescription>
        <refparameter>
            <variablelist>
                <varlistentry>
                    <term>node</term>
                    <listitem>
                        <para>The admonition node.</para>
                    </listitem>
                </varlistentry>
            </variablelist>
        </refparameter>
        <refreturn>
            <para>A URI for the graphic that should be used for the specified
kind of admonition.</para>
        </refreturn>
    </doc:template>
    <xsl:template name="admonition-graphic">
        <xsl:param name="node" select="."/>
        <xsl:value-of select="$admonition.graphics.path"/>
        <xsl:choose>
            <xsl:when test="local-name($node)='note'">note</xsl:when>
            <xsl:when test="local-name($node)='warning'">warning</xsl:when>
            <xsl:when test="local-name($node)='caution'">caution</xsl:when>
            <xsl:when test="local-name($node)='tip'">tip</xsl:when>
            <xsl:when test="local-name($node)='important'">important</xsl:when>
            <xsl:otherwise>note</xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$admonition.graphics.extension"/>
    </xsl:template>
</xsl:stylesheet>