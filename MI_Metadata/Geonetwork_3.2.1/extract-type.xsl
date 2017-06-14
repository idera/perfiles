<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                  xmlns:gco="http://www.isotc211.org/2005/gco"
                  xmlns:gmd="http://www.isotc211.org/2005/gmd"
                  xmlns:gmi="http://www.isotc211.org/2005/gmi">

    <xsl:template match="gmi:MI_Metadata">
        <type><xsl:value-of select="gmd:hierarchyLevel/gmd:MD_ScopeCode/@codeListValue"/></type>
    </xsl:template>
</xsl:stylesheet>