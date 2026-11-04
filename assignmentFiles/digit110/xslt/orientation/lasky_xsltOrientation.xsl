<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- Line to do an indentity transformation -->
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- Write template rules below here -->
    
    <xsl:template match="sonnets">
        <xml>
            <dateProcessed>
                <xsl:value-of select="current-dateTime()"/>
            </dateProcessed>
            <xsl:apply-templates/>
        </xml>
    </xsl:template>
    
    <!-- Rule adds and counts number of sonnets via sibling relation -->
    <xsl:template match="sonnet">
        <poem type="sonnet" roman="{@number}" number="{preceding-sibling::sonnet => count()+1}">
        <xsl:apply-templates/>
        </poem>
    </xsl:template>
    
    <!-- Rule changes line element to ln, adds number attribute and counts lines, and keeps text inside -->
    <!-- precending counts the total of lines, preceding-sibling counts by the groups of lines -->
    <xsl:template match="line">
        <ln number="{preceding::line => count() +1}"><xsl:apply-templates/></ln>
    </xsl:template>
    
    
</xsl:stylesheet>