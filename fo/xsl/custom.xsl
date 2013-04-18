<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:exsl="http://exslt.org/common"
    exclude-result-prefixes="xs exsl"
    version="2.0">
 
    <xsl:include href="custom-layout-masters.xsl"/>
    
    <xsl:include href="custom-headers.xsl"/>
    
    <xsl:include href="custom-footers.xsl"/>

    <xsl:template name="rootTemplate">
        <xsl:call-template name="validateTopicRefs"/>
        <fo:root xsl:use-attribute-sets="__fo__root">
            <xsl:call-template name="createCustomLayoutMasters"/>
            <xsl:call-template name="createBookmarks"/>
            <!-- geen frontmatter en toc in PDF -->
            <xsl:call-template name="createFrontMatter"/>
            <!--<xsl:call-template name="createToc"/>-->
            <!--<xsl:call-template name="createPreface"/>-->
            <xsl:apply-templates/>
            <xsl:call-template name="createIndex"/>
        </fo:root>
    </xsl:template>
    
     <!-- front matter using regular page layouts -->
    <xsl:template name="createFrontMatter">
        <xsl:choose>
            <xsl:when test="$ditaVersion &gt;= 1.1">
                <xsl:call-template name="createFrontMatter_1.0"/>
            </xsl:when>
            <xsl:otherwise>
                <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="__force__page__count">
                    <xsl:call-template name="insertFrontMatterStaticContents"/>
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block xsl:use-attribute-sets="__frontmatter">
                            <!-- set the title -->
                            <fo:block xsl:use-attribute-sets="__frontmatter__title">
                                    <xsl:choose>
                                        <xsl:when test="$map/*[contains(@class,' topic/title ')][1]">
                                            <xsl:apply-templates select="$map/*[contains(@class,' topic/title ')][1]"/>
                                        </xsl:when>
                                        <xsl:when test="//*[contains(@class,' bkinfo/bkinfo ')][1]">
                                            <xsl:apply-templates select="//*[contains(@class,' bkinfo/bkinfo ')][1]/*[contains(@class,' topic/title ')]/node()"/>
                                        </xsl:when>
                                        <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
                                            <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                            </fo:block>
                            
                            <!-- set the subtitle -->
                            <xsl:apply-templates select="//*[contains(@class,' bkinfo/bkinfo ')][1]/*[contains(@class,' bkinfo/bktitlealts ')]/*[contains(@class,' bkinfo/bksubtitle ')]"/>
                            
                            <fo:block xsl:use-attribute-sets="__frontmatter__owner">
                                <xsl:choose>
                                    <xsl:when test="//*[contains(@class,' bkinfo/bkowner ')]">
                                        <xsl:apply-templates select="//*[contains(@class,' bkinfo/bkowner ')]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="$map/*[contains(@class, ' map/topicmeta ')]"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:block>
                            
                        </fo:block>
                        
                        <!--<xsl:call-template name="createPreface"/>-->
                        
                    </fo:flow>
                </fo:page-sequence>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
       <!-- toc also using regular page layouts -->
    <xsl:template name="createToc">
        <xsl:variable name="toc">
            <xsl:apply-templates select="/" mode="toc"/>
        </xsl:variable>
        <xsl:if test="count(exsl:node-set($toc)/*) > 0">
            <fo:page-sequence master-reference="body-sequence" format="i" xsl:use-attribute-sets="__force__page__count">
                <xsl:call-template name="insertTocStaticContents"/>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:call-template name="createTocHeader"/>
                    <fo:block>
                        <xsl:copy-of select="exsl:node-set($toc)"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </xsl:if>
    </xsl:template>
    
    <!-- getTitle for topics in UPPERCASE -->
    <xsl:template match="*" mode="processTopicTitle">
        <xsl:variable name="level" select="count(ancestor::*[contains(@class,' topic/topic ')])"/>
        <xsl:variable name="attrSet1">
            <xsl:call-template name="createTopicAttrsName">
                <xsl:with-param name="theCounter" select="$level"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="attrSet2" select="concat($attrSet1, '__content')"/>
        <xsl:if test="$level = 1">
            <fo:block xsl:use-attribute-sets="map.title">
                <xsl:call-template name="commonattributes"/>
                <fo:marker marker-class-name="book-header">
                    <xsl:apply-templates select="//opentopic:map/*[contains(@class,' topic/title ')][1]"/>
                </fo:marker>
                <xsl:apply-templates select="//opentopic:map/*[contains(@class,' topic/title ')][1]"/>
            </fo:block>            
        </xsl:if>
        <fo:block>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="processAttrSetReflection">
                <xsl:with-param name="attrSet" select="$attrSet1"/>
                <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
            </xsl:call-template>
            <fo:block>
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="$attrSet2"/>
                    <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                </xsl:call-template>
                <xsl:if test="$level = 1">
                    <fo:marker marker-class-name="current-header">
                        <xsl:call-template name="getTitle"/>
                    </fo:marker>
                </xsl:if>
                <xsl:if test="$level = 2">
                    <fo:marker marker-class-name="current-h2">
                        <xsl:call-template name="getTitle"/>
                    </fo:marker>
                </xsl:if>
                <fo:inline id="{parent::node()/@id}"/>
                <fo:inline>
                    <xsl:attribute name="id">
                        <xsl:call-template name="generate-toc-id">
                            <xsl:with-param name="element" select=".."/>
                        </xsl:call-template>
                    </xsl:attribute>
                </fo:inline>
                <!-- added by William on 2009-07-02 for indexterm bug:2815485 start-->
                <xsl:call-template name="pullPrologIndexTerms"/>
                <!-- added by William on 2009-07-02 for indexterm bug:2815485 end-->
                <xsl:call-template name="getTitle">
                    <xsl:with-param name="isNumbered" select="if ($level le 4) then true() else false()"/>
                </xsl:call-template>
            </fo:block>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="getTitle">
        <xsl:param name="isNumbered" select="false()"/>
        
        <xsl:variable name="level" select="count(ancestor::*[contains(@class,' topic/topic ') or contains(@class,' topic/section ')])"/>
        <xsl:if test="($level le 4) and $isNumbered">
            <!-- only count the topics that have titles that have a @outputclass that contains 'Heading'
            to skip the frontmatter topics like copyright -->
            <fo:inline xsl:use-attribute-sets="__title__number">
                <xsl:number format="1.1 " 
                    count="*[contains(@class, ' topic/topic ') or contains(@class,' topic/section ')]
                    [child::*[contains(@class,' topic/title ')]]" 
                    level="multiple"/>
            </fo:inline>
            <fo:leader leader-length="5mm" leader-length.maximum="10mm" leader-length.optimum="5mm" leader-pattern="space"/>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="parent::*[contains(@class,' aeneas_topic/aeneas_topic ')]">
                <xsl:apply-templates select="." mode="getTitleUpperCase"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="getTitle"/>
            </xsl:otherwise>
        </xsl:choose>
   </xsl:template>
    
    <xsl:template match="*" mode="getTitleUpperCase">
        <fo:inline>
            <xsl:call-template name="aeneas_topic.title.atts"/>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <!-- headings -->
    <xsl:attribute-set name="__title__number">
        <xsl:attribute name="margin-right">6mm</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- sections -->
    <xsl:template match="*[contains(@class,' aeneas_topic/mainsection ')]/*[contains(@class,' topic/title ')]">
        <fo:block>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="mainsection.title"/>
            <xsl:call-template name="getTitle">
                <xsl:with-param name="isNumbered" select="true()"/>
            </xsl:call-template>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="*[contains(@class,' aeneas_topic/subsection ')]/*[contains(@class,' topic/title ')]">
        <fo:block>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="subsection.title"/>
            <xsl:call-template name="getTitle">
                <xsl:with-param name="isNumbered" select="true()"/>
            </xsl:call-template>
        </fo:block>
    </xsl:template>
   
     <!-- no prefix 'navigation title' before crosstitles; apply correct attribute sets to crosstitle -->
     <xsl:template match="*[contains(@class,' topic/navtitle ')]">
        <fo:block xsl:use-attribute-sets="navtitle">
            <xsl:call-template name="commonattributes"/>
           <!-- <fo:inline xsl:use-attribute-sets="navtitle__label">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Navigation title'"/>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
                </fo:inline>-->
            <xsl:if test="contains(@class,' aeneas_topic/crosstitle ')">
                <xsl:choose>
                    <xsl:when test="parent::*[contains(@class,' aeneas_topic/subdiv ')]">
                        <xsl:call-template name="subdiv.crosstitle.atts"/>
                    </xsl:when>
                    <xsl:otherwise>
                         <xsl:call-template name="div.crosstitle.atts"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- abstract indent -->
    <xsl:template match="*[contains(@class,' topic/abstract ')]">
        <fo:block >
            <xsl:call-template name="aeneas_topic.abstract"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
        
    <xsl:template match="*[contains(@class,' topic/titlealts ')]">
        <xsl:if test="*">
          <fo:block xsl:use-attribute-sets="titlealts">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
          </fo:block>
        </xsl:if>
    </xsl:template>
    
    <!-- subtitle (Aeneas only), class contains " aeneas_topic/subtitle " -->
    <xsl:template match="*[contains(@class,' topic/searchtitle aeneas_topic/subtitle ')]">
        <fo:block>
            <xsl:call-template name="subtitle.atts"/>
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- note (not notewithtitle: no icon, no prefix "Note" -->
    <xsl:template match="*[contains(@class,' topic/note ') and not(contains(@class,' aeneas_topic/notewithtitle '))]">
        <xsl:variable name="noteType">
            <xsl:choose>
                <xsl:when test="@type = 'other' and @othertype">
                    <xsl:value-of select="@othertype"/>
                </xsl:when>
                <xsl:when test="@type">
                    <xsl:value-of select="@type"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'note'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="noteImagePath">
            <xsl:call-template name="insertVariable">
                <xsl:with-param name="theVariableID" select="concat($noteType, ' Note Image Path')"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($noteImagePath = '')">
                <fo:table xsl:use-attribute-sets="note__table">
                    <fo:table-column xsl:use-attribute-sets="note__image__column"/>
                    <fo:table-column xsl:use-attribute-sets="note__text__column"/>
                    <fo:table-body>
                        <fo:table-row>
                                <fo:table-cell xsl:use-attribute-sets="note__image__entry">
                                    <fo:block/>
                                </fo:table-cell>
                                <fo:table-cell xsl:use-attribute-sets="note__text__entry">
                                    <xsl:call-template name="placeNoteContent"/>
                                </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="placeNoteContent"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- note with title -->
    <xsl:template match="*[contains(@class,' aeneas_topic/notewithtitle ')]">
        <fo:table>
            <xsl:call-template name="notewithtitle__table"/>
            <fo:table-column/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <xsl:call-template name="notewithtitle__cell"/>
                        <xsl:apply-templates/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
     <xsl:template name="placeNoteContent">
        <xsl:apply-templates select="." mode="placeNoteContent"/>
    </xsl:template>
    <xsl:template match="*" mode="placeNoteContent">
        <fo:block xsl:use-attribute-sets="note">
            <xsl:call-template name="commonattributes"/>
            <fo:inline xsl:use-attribute-sets="note__label">
                <!-- no label -->
            </fo:inline>
            <xsl:text>  </xsl:text>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- kader titel -->
    <xsl:template match="*[contains(@class,' aeneas_topic/notewithtitle ')]/*[contains(@class,' topic/title ')]">
        <fo:block>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="notewithtitle.title"/>
            <xsl:call-template name="getTitle"/>
        </fo:block>
    </xsl:template>
    
    <!-- streamer -->
        <xsl:template match="*[contains(@class,' aeneas_topic/streamer ')]">
        <fo:block xsl:use-attribute-sets="lq_simple">
            <xsl:call-template name="aeneas-topic.streamer"/>
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

   <xsl:template match="*[contains(@class,' topic/fig ')]/*[contains(@class,' topic/title ')]">
        <fo:block>
            <xsl:call-template name="fig.title"/>
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    
    
    <xsl:template name="commonattributes">
      <xsl:apply-templates select="@id"/>
    </xsl:template>
 
    <!-- superscript and subscript -->
    <xsl:template match="*[contains(@class,' topic/sup ')]">
        <fo:inline xsl:use-attribute-sets="sup">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    <xsl:template match="*[contains(@class,' topic/sub ')]">
        <fo:inline xsl:use-attribute-sets="sub">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>   
    
<!-- sub-lists -->
    <xsl:template match="*[contains(@class, ' topic/ul ')]/*[contains(@class, ' topic/li ')]/*[contains(@class, ' topic/ul ')]/*[contains(@class, ' topic/li ')]">
        <fo:list-item xsl:use-attribute-sets="ul.li">
            <fo:list-item-label xsl:use-attribute-sets="ul.li__label">
                <fo:block xsl:use-attribute-sets="ul.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Unordered List dash'"/>
                    </xsl:call-template>
                </fo:block>
            </fo:list-item-label>
            
            <fo:list-item-body xsl:use-attribute-sets="ul.li__body">
                <fo:block xsl:use-attribute-sets="ul.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
            
        </fo:list-item>
    </xsl:template>   
    <xsl:template match="*[contains(@class, ' topic/ol ')]/*[contains(@class, ' topic/li ')]/*[contains(@class, ' topic/ol ')]/*[contains(@class, ' topic/li ')]">
        <fo:list-item xsl:use-attribute-sets="ul.li">
            <fo:list-item-label xsl:use-attribute-sets="ul.li__label">
                <fo:block xsl:use-attribute-sets="ul.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Unordered List dash'"/>
                    </xsl:call-template>
                </fo:block>
            </fo:list-item-label>
            
            <fo:list-item-body xsl:use-attribute-sets="ul.li__body">
                <fo:block xsl:use-attribute-sets="ul.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
            
        </fo:list-item>
    </xsl:template>

    <!--Definition list-->
    <xsl:template match="*[contains(@class, ' topic/dl ')]">
        <fo:table xsl:use-attribute-sets="dl">
            <xsl:call-template name="commonattributes"/>
            <fo:table-column column-number="1" column-width="17%"/>
            <fo:table-column column-number="2" column-width="83%"/>
            <xsl:apply-templates select="*[contains(@class, ' topic/dlhead ')]"/>
            <fo:table-body xsl:use-attribute-sets="dl__body">
                <!--<xsl:choose>
                    <xsl:when test="contains(@otherprops,'sortable')">
                        <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]">
                            <xsl:sort select="opentopic-func:getSortString(normalize-space( opentopic-func:fetchValueableText(*[contains(@class, ' topic/dt ')]) ))" lang="{$locale}"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]"/>
                    </xsl:otherwise>
                </xsl:choose>-->
                <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dl ')]/*[contains(@class, ' topic/dlhead ')]">
        <fo:table-header xsl:use-attribute-sets="dl.dlhead">
            <xsl:call-template name="commonattributes"/>
            <fo:table-row xsl:use-attribute-sets="dl.dlhead__row">
                <xsl:apply-templates/>
            </fo:table-row>
        </fo:table-header>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dlhead ')]/*[contains(@class, ' topic/dthd ')]">
        <fo:table-cell xsl:use-attribute-sets="dlhead.dthd__cell">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="dlhead.dthd__content">
                <xsl:apply-templates/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dlhead ')]/*[contains(@class, ' topic/ddhd ')]">
        <fo:table-cell xsl:use-attribute-sets="dlhead.ddhd__cell">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="dlhead.ddhd__content">
                <xsl:apply-templates/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dlentry ')]">
        <fo:table-row xsl:use-attribute-sets="dlentry">
            <xsl:call-template name="commonattributes"/>
            <fo:table-cell xsl:use-attribute-sets="dlentry.dt">
                <xsl:apply-templates select="*[contains(@class, ' topic/dt ')]"/>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="dlentry.dd">
                <xsl:apply-templates select="*[contains(@class, ' topic/dd ')]"/>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dt ')]">
        <fo:block xsl:use-attribute-sets="dlentry.dt__content">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dd ')]">
        <fo:block xsl:use-attribute-sets="dlentry.dd__content">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    
<!-- div -->

    <xsl:template match="//*[contains(@class,' topic/sectiondiv aeneas_topic/div ')]">
        <fo:block >
            <xsl:call-template name="div"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>