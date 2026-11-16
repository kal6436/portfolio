<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>


    <xsl:variable name="nixonColl" as="document-node()+"
        select="collection('../transcripts/?select=*.xml')"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Exercise 5 Nixon Links</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="nixonTrialStyle.css"/>
            </head>
            <body>
                <section id="toc">
                    <h2>Contents</h2>
                    <table>
                        <tr>
                            <th>Conversation Number</th>
                            <!--first column table heading-->
                            <th>Date</th>
                            <!--second column table heading-->
                            <th>Participants</th>
                            <!--third column table heading-->
                        </tr>

                        <xsl:apply-templates select="$nixonColl//TEI" mode="toc">
                            <xsl:sort select="descendant::sourceDesc/recordingStmt/recording/date/@when" data-type="text" order="ascending"/>
                        </xsl:apply-templates>
                    </table>
                </section>

                <section id="readingView">

                    <xsl:apply-templates select="$nixonColl//TEI"/>

                </section>
            </body>
        </html>
    </xsl:template>

    <!-- ************************************************* -->
    <!-- TOC mode templates for the table of contents -->
    <!-- ************************************************* -->

    <xsl:template match="TEI" mode="toc">
        <tr>
            <td>
                <a
                    href="#{//titleStmt/title => replace('Conversation Number ', '') => replace('Encoded translation of Nixon Tape number ', '')}">
                    <xsl:text>Conversation: </xsl:text>
                    <xsl:apply-templates select="descendant::titleStmt/title"/>
                </a>
            </td>
            <td>
                <xsl:apply-templates
                    select="descendant::sourceDesc/recordingStmt/recording/date/@when"
                > </xsl:apply-templates>
            </td>
            <td>
                <xsl:apply-templates
                    select="descendant::u/@who => distinct-values() => string-join(', ') => replace('#', '') => sort()"
                />
            </td>
        </tr>
    </xsl:template>

    <!-- ************************************************* -->
    <!-- templates for outputting the reading view of the comic book -->
    <!-- ************************************************* -->

    <xsl:template match="TEI">
        <div class="transcript"
            id="{//titleStmt/title => replace('Conversation Number ', '') => replace('Encoded translation of Nixon Tape number ', '')}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="note">
        <span class="note">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="u">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


</xsl:stylesheet>
