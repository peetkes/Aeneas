<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:exsl="http://exslt.org/common"
    exclude-result-prefixes="xs exsl"
    version="2.0">

    <!-- headers -->
    <xsl:template name="logo-first">
        <fo:block-container absolute-position="fixed" right="0mm" top="0mm">
            <fo:block>
                <fo:external-graphic src="url({concat($artworkPrefix,'common/artwork/CUR-logo.png')})"
                    content-height="{$page-margin-top}" top="0mm" right="0mm" left="3mm"/>
            </fo:block>
        </fo:block-container>
    </xsl:template>
    
    <xsl:template name="logo">
        <fo:block-container absolute-position="fixed" right="0mm" top="0mm">
            <fo:block>
                <fo:external-graphic src="url({concat($artworkPrefix,'common/artwork/CUR-logo.png')})"
                    content-height="{$page-margin-top}" top="0mm" right="0mm" left="3mm"/>
            </fo:block>
        </fo:block-container>
    </xsl:template>
    
    <xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <xsl:call-template name="logo-first"/>
            <fo:block-container xsl:use-attribute-sets="__body__header__container">
                <fo:table table-layout="fixed" border-collapse="separate">
                    <fo:table-column column-width="50%"/>
                    <fo:table-column column-width="50%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__body__first__header__left">
                                    <xsl:call-template name="insertVariable">
                                        <xsl:with-param name="theVariableID" select="'Body first header left'"/>
                                        <xsl:with-param name="theParameters">
                                            <prodname>
                                                <xsl:value-of select="$productName"/>
                                            </prodname>
                                       </xsl:with-param>
                                    </xsl:call-template>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__body__first__header__right">
                                    <xsl:call-template name="insertVariable">
                                        <xsl:with-param name="theVariableID" select="'Body first header right'"/>
                                        <xsl:with-param name="theParameters">
                                            <heading>
                                                <fo:inline xsl:use-attribute-sets="__body__first__header__heading">
                                                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                                                </fo:inline>
                                            </heading>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block-container>
        </fo:static-content>
    </xsl:template>
        
    <xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block-container xsl:use-attribute-sets="__body__header__container">
                <fo:table table-layout="fixed" border-collapse="separate">
                    <fo:table-column column-width="50%"/>
                    <fo:table-column column-width="50%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__body__odd__header__left">
                                    <xsl:call-template name="insertVariable">
                                        <xsl:with-param name="theVariableID" select="'Body odd header left'"/>
                                        <xsl:with-param name="theParameters">
                                            <prodname>
                                                <xsl:value-of select="$productName"/>
                                            </prodname>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__body__odd__header__right">
                                    <xsl:call-template name="insertVariable">
                                        <xsl:with-param name="theVariableID" select="'Body odd header right'"/>
                                        <xsl:with-param name="theParameters">
                                            <heading>
                                                <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                                                </fo:inline>
                                            </heading>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block-container>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <xsl:call-template name="logo"/>
            <fo:block-container xsl:use-attribute-sets="__body__header__container">
                <fo:table table-layout="fixed" border-collapse="separate">
                    <fo:table-column column-width="50%"/>
                    <fo:table-column column-width="50%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__body__even__header__left">
                                    <xsl:call-template name="insertVariable">
                                        <xsl:with-param name="theVariableID" select="'Body even header left'"/>
                                        <xsl:with-param name="theParameters">
                                            <prodname>
                                                <xsl:value-of select="$productName"/>
                                            </prodname>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__body__even__header__right">
                                    <xsl:call-template name="insertVariable">
                                        <xsl:with-param name="theVariableID" select="'Body even header right'"/>
                                        <xsl:with-param name="theParameters">
                                            <heading>
                                                <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                                                </fo:inline>
                                            </heading>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block-container>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertFrontMatterEvenHeader">
        <fo:static-content flow-name="even-frontmatter-header">
            <xsl:call-template name="logo"/>
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertFrontMatterLastHeader">
        <fo:static-content flow-name="last-frontmatter-header">
            <xsl:call-template name="logo"/>
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
</xsl:stylesheet>