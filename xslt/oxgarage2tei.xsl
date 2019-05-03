<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:variable name="startpage">1r</xsl:variable>
    <xsl:variable name="endpage">200v</xsl:variable>
    <xsl:template match="/">
        <teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Digitale Edition der Wiener Grundbücher</title>
                        <title type="sub">Digitale Edition Grundbuch 1577, C</title>
                        <respStmt>
                            <resp>Transkription</resp>
                            <name><rs type="person" ref="#mustermann_max">Max Mustermann</rs></name>
                        </respStmt>
                        <respStmt>
                            <resp>Transkription</resp>
                            <name><rs type="person" ref="#musterfrau_hanni">Hanni Musterfrau</rs></name>
                        </respStmt>
                        <respStmt>
                            <resp>Annotation</resp>
                            <name><rs type="person" ref="#musterfrau_hanni">Hanni Musterfrau</rs></name>
                        </respStmt>
                        <respStmt>
                            <resp>Kommentar</resp>
                            <name><rs type="person" ref="#musterfrau_hanni">Hanni Musterfrau</rs></name>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>whatever you think fit bests here</publisher>
                        <availability>
                            <licence target="https://creativecommons.org/licenses/by-sa/4.0/">
                                <p>The (CC BY-SA 4.0)-License applies to this document.</p>
                                <p>You are allowed to share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material) for any purpose, even commercially.</p>
                                <p>You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.</p>
                                <p>ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.</p>
                            </licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <msDesc type="invetory">
                            <msIdentifier>
                                <institution>Wiener Stadt- und Landesarchiv (WStLA)</institution>
                                <repository>Grundbürcher</repository>
                            </msIdentifier>                            
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <p/>
                </encodingDesc>
            </teiHeader>
            <xsl:for-each-group group-starting-with="tei:p[@rend='Urkundendatum']" select="//tei:body/tei:*">
                <xsl:variable name="datum">
                    <xsl:value-of select="replace(replace(., '\[', ''), '\]', '')"/>
                </xsl:variable>
                <xsl:variable name="rubrik">
                    <xsl:value-of select="preceding::tei:p[@rend='Rubrik'][1]"/>
                </xsl:variable>
                <xsl:variable name="rubrik_text">
                    <xsl:value-of select="normalize-space(string-join($rubrik, ' '))"/>
                </xsl:variable>
                <xsl:variable name="facs_id">
                    <xsl:value-of select="preceding::tei:p[@rend='FAKSIMILELINK'][1]/text()"/>
                </xsl:variable>
                <xsl:variable name="seitenautor">
                    <xsl:value-of select="./preceding::tei:p[@rend='Seitenautor'][1]/text()"/>
                </xsl:variable>
                <xsl:variable name="respstmt">
                    <xsl:choose>
                        <xsl:when test="starts-with($seitenautor, 'Richard')">
                            <respStmt>
                                <resp>Transkription</resp>
                                <name>
                                    <rs type="person" ref="#weinbergmaier_richard">
                                        Richard Weinbergmaier
                                    </rs>
                                </name>
                            </respStmt>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="starts-with($seitenautor, 'Patrick')">
                            <respStmt><resp>Transkription</resp><name><rs type="person" ref="#fiska_patrick">Patrick Fiska</rs></name></respStmt>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="starts-with($seitenautor, 'Korbinian (Richard)')">
                            <respStmt><resp>Transkription</resp><name><rs type="person" ref="#gruenwald_korbinian">Korbinian Grünwald</rs></name><name><rs type="person" ref="#weinbergmaier_richard">Richard Weinbergmaier</rs></name></respStmt>
                        </xsl:when>
                        <xsl:otherwise>
                            <respStmt><resp>Transkription</resp><name><rs type="person" ref="#gruenwald_korbinian">Korbinian Grünwald</rs></name></respStmt>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <TEI>
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title type="main">Eintrag vom <xsl:value-of select="$datum"/></title>
                                <title type="rubrik"><xsl:value-of select="$rubrik_text"/></title>
                                <title type="sub">Digitale Edition der Wiener Grundbücher</title>
                                <xsl:copy-of select="$respstmt"/>
                            </titleStmt>
                            <publicationStmt>
                                <publisher>Thomas Ertl, Korbinian Grünwald, Richard Weinbergmaier, Patrick Fiska, Peter Andorfer</publisher>
                                <availability>
                                    <licence target="https://creativecommons.org/licenses/by/4.0/">
                                        <p>
                                            CC-BY
                                        </p>
                                        <p>
                                            You are free to: Share — copy and redistribute the material in any medium or format. Adapt — remix, transform, and build upon the material for any purpose, even commercially.
                                        </p>
                                    </licence>
                                </availability>
                            </publicationStmt>
                            <sourceDesc>
                                <msDesc type="invetory">
                                    <msIdentifier>
                                        <institution>Wiener Stadt- und Landesarchiv (WStLA)</institution>
                                        <repository>Grundbücher</repository>
                                    </msIdentifier>
                                    <msContents>
                                        <msItem>
                                            <locus>
                                                <xsl:attribute name="from">
                                                    <xsl:value-of select="preceding::tei:p[@rend='Folioangabe'][1]"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="to">
                                                    <xsl:value-of select="following::tei:p[@rend='Folioangabe'][1]"/>
                                                </xsl:attribute>
                                            </locus>
                                            <p>
                                                <xsl:value-of select="preceding::tei:p[@rend='Folioangabe'][1]"/> - <xsl:value-of select="following::tei:p[@rend='Folioangabe'][1]"/>
                                            </p>
                                        </msItem>
                                    </msContents>
                                    <history>
                                        <origin>
                                            <xsl:attribute name="notBefore">
                                                <xsl:value-of select="$datum"/>
                                            </xsl:attribute>      
                                        </origin>
                                    </history>
                                </msDesc>
                            </sourceDesc>
                        </fileDesc>
                        <encodingDesc>
                            <projectDesc>
                                <p>Die original Quellen wurden in Microsoft Word transkribiert. Für folgende Textmerkamle wurden dafür projektspezifische Formatvorlagen erstellt:
                                    <table>
                                        <row rend="header">
                                            <cell>Name der Formatvorlage</cell>
                                            <cell>Beschreibung des damit ausgezeichnetem Phänomen</cell>
                                        </row>
                                        <row>
                                            <cell>Folioangabe</cell>
                                            <cell>Seitenangabe durch Angabe von Folio mit recto *r und verso *v (im Nachhinein mit Bleistift im Grundbuch eingetragen). Auf den Seiten befinden sich zudem (ws. zeitnah zur Entstehung angebrachte) Foliozählungen in lateinischen Zahlzeichen in Tinte</cell>
                                        </row>
                                        <row>
                                            <cell>Faksimilelink</cell>
                                            <cell>Dateiname des Faksimiles - zur technischen Verknüpfung des Textes mit der Bilddatei</cell>
                                        </row>
                                        <row>
                                            <cell>Rubrik</cell>
                                            <cell>Gliederung nach Bürgermeistern und Jahren</cell>
                                        </row>
                                        <row>
                                            <cell>Urkundendatum</cell>
                                            <cell>Aufgeschlüsseltes Datum der Urkunde</cell>
                                        </row>
                                        <row>
                                            <cell>Standard</cell>
                                            <cell>Text des Grundbucheintrags</cell>
                                        </row>
                                        <row>
                                            <cell>Summa</cell>
                                            <cell>Für den jeweiligen Grundbucheintrag abgerechnete Summe</cell>
                                        </row>
                                        <row>
                                            <cell>Nachtrag</cell>
                                            <cell>Verschiedene nachträgliche Vermerke und Anmerkungen</cell>
                                        </row>
                                        <row>
                                            <cell>Seitenautor</cell>
                                            <cell>Erstbearbeiter der Seite/des Seitenabschnitts (nicht angezeigt, für die interne Organisation)</cell>
                                        </row>
                                        <row>
                                            <cell>Durchgestrichen</cell>
                                            <cell>Durchgestrichen</cell>
                                        </row>
                                        <row>
                                            <cell>Hochgestellt</cell>
                                            <cell>Hochgestellt</cell>
                                        </row>
                                    </table>
                                    
                                </p>
                                <p>Die Transripte respektive die .docx Dokumente wurden anschließend mittels der TEI community stlye sheets und Oxygen in ein generisches TEI transformiert. Dieses TEI wurde anschließend mit den von Peter Andorfer mit Unterstützung von Dario Kampkaspar geschriebenen XSLTs oxgarage2tei.xsl und splitCorpus.xsl weiter verarbeitet.</p>
                                
                            </projectDesc>
                        </encodingDesc>
                    </teiHeader>
                    <facsimile>
                        <graphic>
                            <xsl:attribute name="url">
                                <xsl:value-of select="$facs_id"/>
                            </xsl:attribute>
                        </graphic>
                    </facsimile>
                    <text>
                        <body>
                            <div type="entry">
                                <xsl:apply-templates select="current-group()"/>
                            </div>
                        </body>
                    </text>
                </TEI>
            </xsl:for-each-group>
        </teiCorpus>
        
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:choose>
                <xsl:when test="./@rend">
                    <xsl:attribute name="rend">
                        <xsl:value-of select="./@rend"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:head"/>
    
    <xsl:template match="tei:hi[@rend='background(yellow)']">
        <unclear><xsl:apply-templates/></unclear>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='superscript']">
        <hi rend="super"><xsl:apply-templates/></hi>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <note><xsl:apply-templates select="./*"/></note>
    </xsl:template>
    
    <xsl:template match="tei:anchor"/>
    
    
    <xsl:template match="tei:p[@rend='Folioangabe']"/>
    <xsl:template match="tei:p[@rend='Urkundendatum']"/>
    <xsl:template match="tei:p[@rend='Seitenautor']"/>
    
    
    
    <xsl:template match="tei:hi[@rend='background(cyan)']">
        <rs type="person"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='underline background(darkYellow)']">
        <rs type="org"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='background(darkYellow)']">
        <rs type="org"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='background(red)']">
        <rs type="book"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <list>
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    
    
</xsl:stylesheet>