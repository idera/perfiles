<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
										xmlns:csw="http://www.opengis.net/cat/csw/2.0.2"
										xmlns:gmd="http://www.isotc211.org/2005/gmd"
										  xmlns:gmi="http://www.isotc211.org/2005/gmi"
										xmlns:gco="http://www.isotc211.org/2005/gco"
										xmlns:srv="http://www.isotc211.org/2005/srv"
										xmlns:ows="http://www.opengis.net/ows"
										xmlns:geonet="http://www.fao.org/geonetwork">

	<xsl:param name="displayInfo"/>
	
	<!-- =================================================================== -->

	<xsl:template match="gmi:MI_Metadata|*[@gco:isoType='gmi:MI_Metadata']">
		<xsl:variable name="info" select="geonet:info"/>
		<xsl:copy>
			<xsl:apply-templates select="gmd:fileIdentifier"/>
			<xsl:apply-templates select="gmd:language"/>
			<xsl:apply-templates select="gmd:characterSet"/>
			<xsl:apply-templates select="gmd:parentIdentifier"/>
			<xsl:apply-templates select="gmd:hierarchyLevel"/>
			<xsl:apply-templates select="gmd:hierarchyLevelName"/>
			<gmd:contact />
			<xsl:apply-templates select="gmd:dateStamp"/>
			<xsl:apply-templates select="gmd:metadataStandardName"/>
			<xsl:apply-templates select="gmd:metadataStandardVersion"/>
			<xsl:apply-templates select="gmd:referenceSystemInfo"/>
			<xsl:apply-templates select="gmd:identificationInfo"/>
			<xsl:apply-templates select="gmd:distributionInfo"/>
			<xsl:apply-templates select="gmd:dataQualityInfo"/>
			
			<!-- GeoNetwork elements added when resultType is equal to results_with_summary -->
			<xsl:if test="$displayInfo = 'true'">
				<xsl:copy-of select="$info"/>
			</xsl:if>
			
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template match="gmd:CI_Citation">
		<xsl:copy>
			<xsl:apply-templates select="gmd:title"/>
			<xsl:apply-templates select="gmd:date[gmd:CI_Date/gmd:dateType/
				gmd:CI_DateTypeCode/@codeListValue='revision']"/>
			<xsl:apply-templates select="gmd:identifier"/>
			<xsl:apply-templates select="gmd:citedResponsibleParty"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template match="gmd:MD_Distribution">
		<xsl:copy>
			<xsl:apply-templates select="gmd:distributionFormat"/>
			<xsl:apply-templates select="gmd:transferOptions"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template match="gmd:MD_DigitalTransferOptions">
		<xsl:copy>
			<xsl:apply-templates select="gmd:onLine"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- =================================================================== -->
	
	<xsl:template match="gmd:CI_OnlineResource">
        <xsl:copy>
        	<xsl:apply-templates select="gmd:linkage"/>
        </xsl:copy>
    </xsl:template>
	
	<!-- =================================================================== -->

	<xsl:template match="gmd:MD_Format">
		<xsl:copy>
			<xsl:apply-templates select="gmd:name"/>
			<xsl:apply-templates select="gmd:version"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template match="gmd:DQ_DataQuality">
		<xsl:copy>
		    <gmd:scope/>
			<xsl:apply-templates select="gmd:lineage"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template match="gmd:EX_Extent">
		<xsl:copy>
			<xsl:apply-templates select="gmd:geographicElement[child::gmd:EX_GeographicBoundingBox]"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="gmd:EX_GeographicBoundingBox">
		<xsl:copy>
			<xsl:apply-templates select="gmd:westBoundLongitude"/>
			<xsl:apply-templates select="gmd:eastBoundLongitude"/>
			<xsl:apply-templates select="gmd:southBoundLatitude"/>
			<xsl:apply-templates select="gmd:northBoundLatitude"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- =================================================================== -->
	
	<xsl:template match="gmd:CI_ResponsibleParty[gmd:role/gmd:CI_RoleCode/@codeListValue='originator'
		or gmd:role/gmd:CI_RoleCode/@codeListValue='author'
		or gmd:role/gmd:CI_RoleCode/@codeListValue='publisher']">
		<xsl:copy>
			<xsl:apply-templates select="gmd:organisationName"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- =================================================================== -->
	
	<xsl:template match="gmd:MD_LegalConstraints">
		<xsl:copy>
			<xsl:apply-templates select="gmd:accessConstraints"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- =================================================================== -->
	
	<xsl:template match="gmd:MD_BrowseGraphic">
		<xsl:copy>
			<xsl:apply-templates select="gmd:fileName"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->
	<!-- === Data === -->
	<!-- =================================================================== -->

	<xsl:template match="gmd:MD_DataIdentification
		|*[contains(@gco:isoType, 'MD_DataIdentification')]|*[contains(@gco:isoType, 'CI_Date')]">
		<xsl:copy>
			<gmd:citation>
            <gmd:CI_Citation>
                <xsl:apply-templates select="gmd:citation/gmd:CI_Citation/gmd:title"/>
                <xsl:apply-templates select="gmd:citation/gmd:CI_Citation/gmd:date"/>
            </gmd:CI_Citation>
            </gmd:citation>
			<xsl:apply-templates select="gmd:abstract"/>
			<xsl:apply-templates select="gmd:pointOfContact"/>
			<xsl:apply-templates select="gmd:graphicOverview"/>
			<xsl:apply-templates select="gmd:resourceConstraints"/>
			<xsl:apply-templates select="gmd:spatialRepresentationType"/>
			<xsl:apply-templates select="gmd:spatialResolution"/>
			<xsl:apply-templates select="gmd:language"/>
			<xsl:apply-templates select="gmd:characterSet"/>
			<xsl:apply-templates select="gmd:topicCategory"/>
			<xsl:apply-templates select="gmd:extent[child::gmd:EX_Extent
				[child::gmd:geographicElement]]"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->
	<!-- === Services === -->
	<!-- =================================================================== -->

	<xsl:template match="srv:SV_ServiceIdentification|
		*[contains(@gco:isoType, 'SV_ServiceIdentification')]|*[contains(@gco:isoType, 'CI_Date')]">
		<xsl:copy>
			<gmd:citation>
            <gmd:CI_Citation>
                <xsl:apply-templates select="gmd:citation/gmd:CI_Citation/gmd:title"/>
                <xsl:apply-templates select="gmd:citation/gmd:CI_Citation/gmd:date"/>
            </gmd:CI_Citation>
            </gmd:citation>
			<xsl:apply-templates select="gmd:abstract"/>
			<xsl:apply-templates select="gmd:pointOfContact"/>
			<xsl:apply-templates select="gmd:graphicOverview"/>
			<xsl:apply-templates select="gmd:resourceConstraints"/>
			<xsl:apply-templates select="srv:serviceType"/>
			<xsl:apply-templates select="srv:serviceTypeVersion"/>
			<xsl:apply-templates select="srv:extent[child::gmd:EX_Extent
				[child::gmd:geographicElement]]"/>
			<xsl:apply-templates select="srv:couplingType"/>
			<xsl:apply-templates select="srv:containsOperations"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template match="srv:SV_OperationMetadata">
		<xsl:copy>
			<xsl:apply-templates select="srv:operationName"/>
			<xsl:apply-templates select="srv:DCP"/>
			<xsl:apply-templates select="srv:connectPoint"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->
	<!-- === copy template === -->
	<!-- =================================================================== -->

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<!-- =================================================================== -->

</xsl:stylesheet>



