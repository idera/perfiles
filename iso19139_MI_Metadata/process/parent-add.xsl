<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by End User (free.org) -->
<!--
  ~ Copyright (C) 2001-2016 Food and Agriculture Organization of the
  ~ United Nations (FAO-UN), United Nations World Food Programme (WFP)
  ~ and United Nations Environment Programme (UNEP)
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or (at
  ~ your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
  ~
  ~ Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
  ~ Rome - Italy. email: geonetwork@osgeo.org
  -->
<!--
Stylesheet used to update metadata adding a reference to a parent record.
-->
<xsl:stylesheet xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gml="http://www.opengis.net/gml" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:geonet="http://www.fao.org/geonetwork" version="2.0">
	<!-- Parent metadata record UUID -->
	<xsl:param name="parentUuid"/>
	<xsl:template match="/gmi:MI_Metadata|*[@gco:isoType='gmi:MI_Metadata']">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:copy-of select="gmd:fileIdentifier|
        gmd:language|
        gmd:characterSet"/>
			<!-- Only one parent identifier allowed
            - overwriting existing one. -->
			<gmd:parentIdentifier>
				<gco:CharacterString>
					<xsl:value-of select="$parentUuid"/>
				</gco:CharacterString>
			</gmd:parentIdentifier>
			<xsl:copy-of select="
      gmd:hierarchyLevel|
      gmd:hierarchyLevelName|
      gmd:contact|
      gmd:dateStamp|
      gmd:metadataStandardName|
      gmd:metadataStandardVersion|
      gmd:dataSetURI|
      gmd:locale|
      gmd:spatialRepresentationInfo|
      gmd:referenceSystemInfo|
      gmd:metadataExtensionInfo|
      gmd:identificationInfo|
      gmd:contentInfo|
        gmd:distributionInfo|
        gmd:dataQualityInfo|
        gmd:portrayalCatalogueInfo|
        gmd:metadataConstraints|
        gmd:applicationSchemaInfo|
        gmd:metadataMaintenance|
        gmd:series|
        gmd:describes|
        gmd:propertyType|
        gmd:featureType|
        gmd:featureAttribute"/>
		</xsl:copy>
	</xsl:template>
	<!-- Remove geonet:* elements. -->
	<xsl:template match="geonet:*" priority="2"/>
</xsl:stylesheet>