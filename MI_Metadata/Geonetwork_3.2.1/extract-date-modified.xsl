<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
						xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmi="http://www.isotc211.org/2005/gmi">

	<xsl:template match="gmi:MI_Metadata">
		 <dateStamp><xsl:value-of select="gmd:dateStamp/*"/></dateStamp>
	</xsl:template>

</xsl:stylesheet>
