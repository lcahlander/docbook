<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:f="http://docbook.org/xslt/ns/extension" xmlns:db="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:m="http://docbook.org/xslt/ns/mode" xmlns:t="http://docbook.org/xslt/ns/template" xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="db doc f fn m t" version="2.0">

<!-- ********************************************************************
     $Id: autotoc.xsl 7915 2008-03-12 12:12:24Z nwalsh $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ============================================================ -->
    <doc:mode xmlns="http://docbook.org/ns/docbook" name="m:toc">
        <fo:refpurpose>Mode for processing ToC and LoTs</fo:refpurpose>
        <fo:refdescription>
            <fo:para>This mode is used to process Tables of Contents and Lists of Titles.
</fo:para>
        </fo:refdescription>
    </doc:mode>

<!-- ============================================================ -->
    <doc:template xmlns="http://docbook.org/ns/docbook" name="make-toc">
        <refpurpose>Make a ToC</refpurpose>
        <refdescription>
            <para>This template formats a Table of Contents.</para>
        </refdescription>
        <refparameter>
            <variablelist>
                <varlistentry>
                    <term>toc-context</term>
                    <listitem>
                        <para>The context node of the ToC.</para>
                    </listitem>
                </varlistentry>
                <varlistentry>
                    <term>toc-context</term>
                    <listitem>
                        <para>The context node of the ToC.</para>
                    </listitem>
                </varlistentry>
            </variablelist>
        </refparameter>
        <refreturn>
            <para>The formatted ToC.</para>
        </refreturn>
    </doc:template>
    <xsl:template name="make-toc">
        <xsl:param name="toc-context" select="."/>
        <xsl:param name="toc.title" select="true()"/>
        <xsl:param name="nodes" select="()"/>

  <!-- FIXME: -->
    </xsl:template>

<!-- ============================================================ -->
    <doc:template xmlns="http://docbook.org/ns/docbook" name="make-lots">
        <refpurpose>Make LoTs</refpurpose>
        <refdescription>
            <para>This template formats Lists of Titles.</para>
        </refdescription>
        <refparameter>
            <variablelist>
                <varlistentry>
                    <term>toc.params</term>
                    <listitem>
                        <para>The ToC controlling parameters.</para>
                    </listitem>
                </varlistentry>
                <varlistentry>
                    <term>toc</term>
                    <listitem>
                        <para>The result tree that contains the generated Table of Contents.</para>
                    </listitem>
                </varlistentry>
            </variablelist>
        </refparameter>
        <refreturn>
            <para>The formatted ToC and LoTs.</para>
        </refreturn>
    </doc:template>
    <xsl:template name="make-lots">
        <xsl:param name="toc.params" as="element()?" select="()"/>
        <xsl:param name="toc"/>

  <!-- FIXME: -->
    </xsl:template>

<!-- ============================================================ -->
    <doc:template xmlns="http://docbook.org/ns/docbook" name="t:section-toc">
        <refpurpose>Make ToC/LoTs for a section</refpurpose>
        <refdescription>
            <para>This template formats the Table of Contents and
Lists of Titles for a section.</para>
        </refdescription>
        <refparameter>
            <variablelist>
                <varlistentry>
                    <term>toc-context</term>
                    <listitem>
                        <para>The component context.</para>
                    </listitem>
                </varlistentry>
            </variablelist>
        </refparameter>
        <refreturn>
            <para>The formatted ToC and LoTs for the element.</para>
        </refreturn>
    </doc:template>
    <xsl:template name="t:section-toc">
        <xsl:param name="toc-context" select="."/>
        <xsl:param name="toc.title" select="true()"/>

  <!-- FIXME: -->
    </xsl:template>

<!-- ============================================================ -->
    <doc:template xmlns="http://docbook.org/ns/docbook" name="component-toc">
        <refpurpose>Make ToC/LoTs for a component</refpurpose>
        <refdescription>
            <para>This template formats the Table of Contents and
Lists of Titles for a
component (chapter, article, etc.).</para>
        </refdescription>
        <refparameter>
            <variablelist>
                <varlistentry>
                    <term>toc-context</term>
                    <listitem>
                        <para>The component context.</para>
                    </listitem>
                </varlistentry>
            </variablelist>
        </refparameter>
        <refreturn>
            <para>The formatted ToC and LoTs for the element.</para>
        </refreturn>
    </doc:template>
    <xsl:template name="component-toc">
        <xsl:param name="toc-context" select="."/>
        <xsl:param name="toc.title" select="true()"/>

  <!-- FIXME: -->
    </xsl:template>

<!-- ============================================================ -->
    <doc:template xmlns="http://docbook.org/ns/docbook" name="division-toc">
        <refpurpose>Make ToC/LoTs for a division</refpurpose>
        <refdescription>
            <para>This template formats the Table of Contents and
Lists of Titles for a
division (chapter, article, etc.).</para>
        </refdescription>
        <refparameter>
            <variablelist>
                <varlistentry>
                    <term>toc-context</term>
                    <listitem>
                        <para>The division context.</para>
                    </listitem>
                </varlistentry>
            </variablelist>
        </refparameter>
        <refreturn>
            <para>The formatted ToC and LoTs for the element.</para>
        </refreturn>
    </doc:template>
    <xsl:template name="division-toc">
        <xsl:param name="toc-context" select="."/>
        <xsl:param name="toc.title" select="true()"/>

  <!-- FIXME: -->
    </xsl:template>
</xsl:stylesheet>