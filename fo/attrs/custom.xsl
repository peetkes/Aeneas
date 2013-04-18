<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">

    <xsl:include href="custom-layout-masters-attr.xsl"/>
    
    <!-- basic settings -->
    <xsl:variable name="page-margin-inside" select="$page-margins"/>
    <xsl:variable name="page-margin-outside" select="$page-margins"/>
    <xsl:variable name="mirror-page-margins" select="true()"/>
 
    <!-- colors -->
    <xsl:variable name="ae-darkblue">#89ACD6</xsl:variable>
    <xsl:variable name="ae-mediumblue">#D3DEEE</xsl:variable>
    <xsl:variable name="ae-lightblue">#E9EDF7</xsl:variable>
    <xsl:variable name="ae-grey">#6F7073</xsl:variable>
    
    <!-- page size -->
    <!-- The default of 215.9mm x 279.4mm is US Letter size (8.5x11in) -->
    <xsl:variable name="page-width">210.0mm</xsl:variable>
    <xsl:variable name="page-height">297.0mm</xsl:variable>

    <!-- page margins -->
    <xsl:variable name="page-margin-left">19mm</xsl:variable>
    <xsl:variable name="page-margin-right">25mm</xsl:variable>
    <xsl:variable name="page-margin-top">27mm</xsl:variable>
    <xsl:variable name="page-margin-bottom">30mm</xsl:variable>

    <!--The side column width is the amount the body text is indented relative to the margin. -->
    <xsl:variable name="side-col-width">30mm</xsl:variable>

    <xsl:variable name="default-font-size">9pt</xsl:variable>

    <!-- header margins -->
    <xsl:attribute-set name="__body__header__container">
        <xsl:attribute name="absolute-position">fixed</xsl:attribute>
        <xsl:attribute name="top">12mm</xsl:attribute>
        <xsl:attribute name="left">20mm</xsl:attribute>
        <xsl:attribute name="bottom">0mm</xsl:attribute>
        <xsl:attribute name="right">16mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__first__header">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-right">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">20mm</xsl:attribute>
        <xsl:attribute name="margin-top">12mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__header__left">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__first__header__right">
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__odd__header__left">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__header__right">
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__even__header__left">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__header__right">
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-right">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">20mm</xsl:attribute>
        <xsl:attribute name="margin-top">12mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__header">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="margin-right">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">20mm</xsl:attribute>
        <xsl:attribute name="margin-top">12mm</xsl:attribute>
    </xsl:attribute-set>

    <!-- footer margins -->
    <xsl:attribute-set name="__body__odd__footer">
        <xsl:attribute name="margin-right">16mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">12mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__footer">        
        <xsl:attribute name="margin-left">16mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">12mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__footer">
        <xsl:attribute name="margin-right">16mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">12mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__footer">
        <xsl:attribute name="margin-right">16mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">12mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__even__footer">
        <xsl:attribute name="margin-right">16mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">12mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__first__footer">
        <xsl:attribute name="margin-right">16mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">12mm</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- font -->
   <xsl:attribute-set name="__fo__root">
       <xsl:attribute name="font-family">"News Gothic Std"</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
       <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
   </xsl:attribute-set>
    
    <!-- front matter -->
    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__title">
        <xsl:attribute name="margin-top">10mm</xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- map title, map/title -->
    <xsl:attribute-set name="map.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="margin-top">0pc</xsl:attribute>
        <xsl:attribute name="margin-bottom">0pc</xsl:attribute>
        <xsl:attribute name="font-size">20pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">0pc</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="border-bottom">none</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- topic title, Hoofdstuktitel -->
    <xsl:attribute-set name="topic.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="margin-top">0pc</xsl:attribute>
        <xsl:attribute name="margin-bottom">0pc</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">0.4pc</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="border-bottom">none</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:template name="aeneas_topic.title.atts">
        <!-- formatting for aeneas_topic.title -->
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:template>
    
    <xsl:attribute-set name="topic.topic.title">
        <xsl:attribute name="border-bottom">none</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="margin-top">1pc</xsl:attribute>
        <xsl:attribute name="padding-top">1pc</xsl:attribute>
        <xsl:attribute name="space-after">12pt</xsl:attribute>
        <xsl:attribute name="space-before">18pt</xsl:attribute>
    </xsl:attribute-set>

	<!-- Kop 1 -->    
    <xsl:template name="mainsection.title">
        <xsl:attribute name="border-bottom">none</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="margin-bottom">5pt</xsl:attribute>
        <!--<xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>-->
        <xsl:attribute name="margin-top">1pc</xsl:attribute>
        <xsl:attribute name="padding-top">1pc</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="space-before">18pt</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:template>
    
	<!-- Kop 2 -->
    <xsl:template name="subsection.title">
        <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="margin-bottom">0mm</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="space-before">14pt</xsl:attribute>
    </xsl:template>
    
    <!-- Kop 3 crosssection -->
    <xsl:template name="div.crosstitle.atts">
        <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="space-before">6pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
    </xsl:template>
    
    <xsl:template name="subdiv.crosstitle.atts">
        <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="space-before">3pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:template>
    
    <!-- titlealts and subtitle -->
    <xsl:attribute-set name="shortdesc">
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
 
    <xsl:attribute-set name="titlealts">
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
        <xsl:attribute name="background-color">none</xsl:attribute>
        <xsl:attribute name="border-style">none</xsl:attribute>
        <xsl:attribute name="border-color">none</xsl:attribute>
        <xsl:attribute name="border-width">none</xsl:attribute>
        <xsl:attribute name="margin-bottom">18pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="subtitle.atts">
    	<xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:template>
    
    <xsl:template name="aeneas_topic.abstract">
        <xsl:attribute name="margin-left"><xsl:value-of select="$side-col-width"/></xsl:attribute>
         <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:template>

    <!-- alinea -->   
     <xsl:attribute-set name="p">
        <!-- <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute> -->
        <xsl:attribute name="font-weight">inherit</xsl:attribute>
        <xsl:attribute name="font-style">inherit</xsl:attribute>
        <xsl:attribute name="text-indent">0em</xsl:attribute>
        <xsl:attribute name="space-before">0em</xsl:attribute>
         <xsl:attribute name="space-after">0em</xsl:attribute>
     </xsl:attribute-set>
    
    <xsl:template name="div">
        <xsl:attribute name="space-after">12pt</xsl:attribute>
    </xsl:template>
  
    <!-- lists -->
    <!--Unordered list-->
    <xsl:attribute-set name="ul">
        <xsl:attribute name="provisional-distance-between-starts">5mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
        <xsl:attribute name="space-after">0em</xsl:attribute>
        <xsl:attribute name="space-before">0em</xsl:attribute>
        <!--        <xsl:attribute name="margin-left">-8pt</xsl:attribute>-->
    </xsl:attribute-set>
    
    <!--Ordered list-->
    <xsl:attribute-set name="ol">
        <xsl:attribute name="provisional-distance-between-starts">5mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
        <xsl:attribute name="space-after">0em</xsl:attribute>
        <xsl:attribute name="space-before">0em</xsl:attribute>
        <!--		<xsl:attribute name="margin-left">-8pt</xsl:attribute>-->
    </xsl:attribute-set>
    
    <xsl:attribute-set name="ul.li">
        <xsl:attribute name="space-after">1.5pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="ol.li">
        <xsl:attribute name="space-after">1.5pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:attribute-set>
           
    
    
    <!-- notes -->
    <xsl:attribute-set name="note">
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__table">
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        <xsl:attribute name="background-color"><xsl:value-of select="$ae-lightblue"/></xsl:attribute>
        <!--<xsl:attribute name="border">solid <xsl:value-of select="$ae-darkblue"/> 1px</xsl:attribute>-->
    </xsl:attribute-set>
  
    <xsl:attribute-set name="note__image__column">
        <xsl:attribute name="column-number">1</xsl:attribute>
        <xsl:attribute name="column-width">32pt</xsl:attribute>
    </xsl:attribute-set>
  
    <xsl:attribute-set name="note__text__column">
      <xsl:attribute name="column-number">2</xsl:attribute>
    </xsl:attribute-set>  

    <xsl:attribute-set name="note__image__entry">
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__text__entry">
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="padding">0.6em</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:template name="notewithtitle__table">
        <xsl:attribute name="background-color"><xsl:value-of select="$ae-lightblue"/></xsl:attribute>
        <!--<xsl:attribute name="border">solid <xsl:value-of select="$ae-darkblue"/> thin</xsl:attribute>-->
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        
    </xsl:template>
    
    <xsl:template name="notewithtitle__cell">
        <xsl:attribute name="padding">0.6em</xsl:attribute>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="space-after">0.6em</xsl:attribute>
        <xsl:attribute name="margin-left">20mm</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute> 
    </xsl:template>
    
    <xsl:template name="notewithtitle.title">
         <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:template>
    
    <!-- quotes -->
    <xsl:attribute-set name="q">
        <!-- small caps not supported in FOP 
        <xsl:attribute name="font-variant">small-caps</xsl:attribute> -->
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="lq">
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="space-before">1em</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="color">red</xsl:attribute>
        <xsl:attribute name="padding-left">1em</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="end-indent">0pt</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="border-style">none</xsl:attribute>
        <xsl:attribute name="border-color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="border-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lq_simple">
        <xsl:attribute name="border-color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="border-style">none</xsl:attribute>
        <xsl:attribute name="border-width">0pt</xsl:attribute>
        <xsl:attribute name="end-indent">0pt</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="margin-left">1em<!--<xsl:value-of select="$side-col-width"/>--></xsl:attribute>
        <xsl:attribute name="padding-left">0pt</xsl:attribute>
        <xsl:attribute name="space-after">1em</xsl:attribute>
        <xsl:attribute name="space-before">1em</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- streamer -->
    <xsl:template name="aeneas-topic.streamer">
        <!-- no specs for difference in lq and streamer known -->
    </xsl:template>
    
    <!-- images -->
    <xsl:attribute-set name="image__float">
    </xsl:attribute-set>

    <xsl:attribute-set name="image__block">
    </xsl:attribute-set>

    <xsl:attribute-set name="image__inline">
    </xsl:attribute-set>

    <xsl:attribute-set name="image">
   	 	<!-- scale image if too large -->
    	<xsl:attribute name="content-height">scale-down-to-fit</xsl:attribute>
    	<xsl:attribute name="content-width">scale-down-to-fit</xsl:attribute>
        <xsl:attribute name="inline-progression-dimension.maximum">100%</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:template name="fig.title">
        <xsl:attribute name="font-size">9pt</xsl:attribute>
         <xsl:attribute name="color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">0.5em</xsl:attribute>
        <xsl:attribute name="space-after">1em</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:template>
    
    <!-- sub en sup -->
    
    <xsl:attribute-set name="sup">
        <xsl:attribute name="font-size">6pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="sub">
        <xsl:attribute name="font-size">6pt</xsl:attribute>
    </xsl:attribute-set>
 
 
 <!-- dl -->
    <xsl:attribute-set name="dl">
        <!--DL is a table-->
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="dl__body">
        <xsl:attribute name="margin-left">-31mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="dlentry.dt__content">
        <xsl:attribute name="margin">3pt 3pt 3pt 3pt</xsl:attribute>
        <xsl:attribute name="font-weight">italic</xsl:attribute>
    </xsl:attribute-set>
    
    
<!-- table --> 

    <xsl:attribute-set name="__tableframe__top">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">1pt</xsl:attribute>
        <xsl:attribute name="border-top-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">white</xsl:attribute>
        <xsl:attribute name="border-after-width.conditionality">retain</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="thead__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__left">
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">1pt</xsl:attribute>
        <xsl:attribute name="border-left-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__right">
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">1pt</xsl:attribute>
        <xsl:attribute name="border-right-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table">
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="space-after">6pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table.tgroup">
        <xsl:attribute name="table-layout">fixed</xsl:attribute>
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table__tableframe__all">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">1pt</xsl:attribute>
        <xsl:attribute name="border-top-color">white</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">white</xsl:attribute>
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">1pt</xsl:attribute>
        <xsl:attribute name="border-left-color">white</xsl:attribute>
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">1pt</xsl:attribute>
        <xsl:attribute name="border-right-color">white</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="table__tableframe__top">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">1pt</xsl:attribute>
        <xsl:attribute name="border-top-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table__tableframe__sides">
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">1pt</xsl:attribute>
        <xsl:attribute name="border-left-color">white</xsl:attribute>
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">1pt</xsl:attribute>
        <xsl:attribute name="border-right-color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="thead.row.entry">
        <xsl:attribute name="background-color"><xsl:value-of select="$ae-darkblue"/></xsl:attribute>
        <xsl:attribute name="margin-left">0pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="thead.row.entry__content">
        <xsl:attribute name="margin">3pt 3pt 3pt 3pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="tbody.row">
        <xsl:attribute name="background-color"><xsl:value-of select="$ae-lightblue"/></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="tbody.row.entry">
        <xsl:attribute name="background-color"><xsl:value-of select="$ae-lightblue"/></xsl:attribute>
        <xsl:attribute name="margin-left">0pt</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">white</xsl:attribute>
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">1pt</xsl:attribute>
        <xsl:attribute name="border-right-color">white</xsl:attribute>
    </xsl:attribute-set>
   
    
</xsl:stylesheet>


