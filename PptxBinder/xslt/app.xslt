<?xml version="1.0" encoding="utf-8"?>
<!--
	Author: 
	File: 
	Date: 
	Purpose: 
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
      <Template>Angles</Template>
      <TotalTime>4</TotalTime>
      <Words>28</Words>
      <Application>Microsoft Office PowerPoint</Application>
      <PresentationFormat>On-screen Show (4:3)</PresentationFormat>
      <Paragraphs>14</Paragraphs>
      <Slides>
        <xsl:value-of select="app/totalslides"/>
      </Slides>
      <Notes>0</Notes>
      <HiddenSlides>0</HiddenSlides>
      <MMClips>0</MMClips>
      <ScaleCrop>false</ScaleCrop>
      <LinksUpToDate>false</LinksUpToDate>
      <SharedDoc>false</SharedDoc>
      <HyperlinksChanged>false</HyperlinksChanged>
      <AppVersion>14.0000</AppVersion>
    </Properties>
  </xsl:template>
</xsl:stylesheet>