<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:exsl="http://exslt.org/common"
    exclude-result-prefixes="xs exsl"
    version="2.0">
    
    <!--footers -->
    <xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body odd footer'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:text>&#160;&#160;</xsl:text>
                <fo:external-graphic src="url({concat($artworkPrefix,'common/artwork/verticaldots.png')})" content-height="7mm"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBodyEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <fo:external-graphic src="url({concat($artworkPrefix,'common/artwork/verticaldots.png')})" content-height="7mm"/>
                <xsl:text>&#160;&#160;</xsl:text>
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body even footer'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template> 
    
    <xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer">
            <fo:block xsl:use-attribute-sets="__toc__even__footer">
                <fo:external-graphic src="url({concat($artworkPrefix,'common/artwork/verticaldots.png')})"
                    content-height="7mm"/>
                <xsl:text>&#160;&#160;</xsl:text>
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Toc even footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__toc__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <fo:block xsl:use-attribute-sets="__toc__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Toc odd footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__toc__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:text>&#160;&#160;</xsl:text>
                <fo:external-graphic src="url({concat($artworkPrefix,'common/artwork/verticaldots.png')})"
                    content-height="7mm"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
</xsl:stylesheet>