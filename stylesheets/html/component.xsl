<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://docbook.org/xslt/ns/extension" xmlns:db="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:m="http://docbook.org/xslt/ns/mode" xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://docbook.org/xslt/ns/template" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="h f m fn db t" version="2.0">
    <xsl:template match="db:dedication        |db:preface|db:chapter|db:appendix        |db:colophon|db:article">
        <article>
            <xsl:sequence select="f:html-attributes(.,f:node-id(.))"/>
            <xsl:call-template name="t:titlepage"/>
            <xsl:if test="not(db:toc)">
      <!-- only generate a toc automatically if there's no explicit toc -->
                <xsl:apply-templates select="." mode="m:toc"/>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="not(parent::db:article)">
                <xsl:call-template name="t:process-footnotes"/>
            </xsl:if>
        </article>
    </xsl:template>
    <xsl:template match="db:dedication        |db:preface|db:chapter|db:appendix        |db:colophon|db:article" mode="m:toc">
        <xsl:param name="toc.params" select="f:find-toc-params(., $generate.toc)"/>
        <xsl:call-template name="t:make-lots">
            <xsl:with-param name="toc.params" select="$toc.params"/>
            <xsl:with-param name="toc">
                <xsl:call-template name="t:component-toc">
                    <xsl:with-param name="toc.title" select="$toc.params/@title != 0"/>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>