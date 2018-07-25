<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:dc="http://purl.org/dc/elements/1.1"
                xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
                exclude-result-prefixes="xs mods"
                version="1.0">

  <xsl:output encoding="UTF-8" method="xml" indent="yes"/>

  <!-- identity transform -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- match mods:mods and serialize a new oai_dc:dc record -->
  <xsl:template match="mods:mods">
    <oai_dc:dc xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
      <xsl:apply-templates select="mods:titleInfo/mods:title"/>
      <xsl:apply-templates select="mods:originInfo/mods:dateIssued[@keyDate='yes'][@encoding='edtf']"/>
      <xsl:apply-templates select="mods:abstract"/>
    </oai_dc:dc>
  </xsl:template>

  <!-- title -->
  <xsl:template match="mods:title">
    <dc:title><xsl:apply-templates/></dc:title>
  </xsl:template>

  <!-- date of award -->
  <xsl:template match="mods:originInfo/mods:dateIssued[@keyDate='yes'][@encoding='edtf']">
    <dc:date><xsl:apply-templates/></dc:date>
  </xsl:template>

  <!-- abstract -->
  <xsl:template match="mods:abstract">
    <dc:description><xsl:apply-templates/></dc:description>
  </xsl:template>
</xsl:stylesheet>