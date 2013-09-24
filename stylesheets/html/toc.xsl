<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:db="http://docbook.org/ns/docbook" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:m="http://docbook.org/xslt/ns/mode" xmlns:t="http://docbook.org/xslt/ns/template" xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" exclude-result-prefixes="db doc m t xs" version="2.0">

<!-- ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- FIXME: Handle all of toc markup -->

<!-- ============================================================ -->
    <xsl:template match="db:toc[not(*)]">
        <xsl:apply-templates select="parent::*" mode="m:toc"/>
    </xsl:template>
    <xsl:template match="db:toc">
        <xsl:message>FIXME: Manually generated TOCs are not yet supported.</xsl:message>
    </xsl:template>
</xsl:stylesheet>