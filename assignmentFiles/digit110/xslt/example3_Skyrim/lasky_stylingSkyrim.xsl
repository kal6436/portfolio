<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>

    <!-- general page layout -->
    <xsl:template match="skyrim">
        <html>
            <head>
                <title>Lasky Skyrim Styling</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="skyrimStyles.css"/>
            </head>
            <body>
                <div class="container">
                    <xsl:apply-templates select="child::* except cast"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- cover styling -->
    <xsl:template match="cover">
        <h1>
            <xsl:apply-templates select="title"/>
        </h1>
        <h2>
            <em>
                <xsl:apply-templates select="attribution"/>
            </em>
        </h2>
        <h3>
            <xsl:apply-templates select="child::subtitle"/>
        </h3>
        <hr/>
    </xsl:template>

    <!-- paragraph styling -->
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="QuestEvent">
        <span class="questEvent">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- faction styling with awesome choose function -->
    <xsl:template match="faction">
        <xsl:choose>
            <xsl:when test="@ref = ('blades', 'empire')">
                <span class="good">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@ref = 'DarkBrotherhood'">
                <span class="neutral">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="evil">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="QuestItem">
        <span class="questItem">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="character">
        <span class="character"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="epithet">
        <span class="epithet"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>
