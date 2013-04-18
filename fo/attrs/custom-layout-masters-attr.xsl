<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:attribute-set name="region-body" use-attribute-sets="region-body.odd"/>
    
    <xsl:attribute-set name="region-body.odd">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <!-- support legacy parameter -->
                <xsl:when test="normalize-space($page-margin-left)">
                    <xsl:call-template name="output-message">
                        <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="$page-margin-left"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$page-margin-inside"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <!-- support legacy parameter -->
                <xsl:when test="normalize-space($page-margin-right)">
                    <xsl:call-template name="output-message">
                        <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="$page-margin-right"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$page-margin-outside"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-body.even">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <!-- support legacy parameter -->
                <xsl:when test="normalize-space($page-margin-left)">
                    <xsl:call-template name="output-message">
                        <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="$page-margin-left"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$page-margin-outside"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <!-- support legacy parameter -->
                <xsl:when test="normalize-space($page-margin-right)">
                    <xsl:call-template name="output-message">
                        <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="$page-margin-right"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$page-margin-inside"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-body__frontmatter.odd" use-attribute-sets="region-body.odd">
    </xsl:attribute-set>
    <xsl:attribute-set name="region-body__frontmatter.even" use-attribute-sets="region-body.even">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-body__index" use-attribute-sets="region-body__index.odd"/>
    
    <xsl:attribute-set name="region-body__index.odd" use-attribute-sets="region-body.odd">
        <xsl:attribute name="column-count">2</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-body__index.even" use-attribute-sets="region-body.even">
        <xsl:attribute name="column-count">2</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-before">
        <xsl:attribute name="extent">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="display-align">before</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-after">
        <xsl:attribute name="extent">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="display-align">after</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>