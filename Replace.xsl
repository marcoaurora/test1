<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:variable name="params">
        <TrasferisciInPresenzaInput>
            <Intestazione>Intestazione1</Intestazione>
            <Confezione>
                <SSCC>111111</SSCC>
                <Taglio>20</Taglio>
                <Quantita>1000</Quantita>
            </Confezione>
            <Confezione>
                <SSCC>22222</SSCC>
                <Taglio>10</Taglio>
                <Quantita>10000</Quantita>
            </Confezione>
            <Confezione>
                <SSCC>33333</SSCC>
                <Taglio>5</Taglio>
                <Quantita>5000</Quantita>
            </Confezione>
            <SuperConfezione>
                <SSCC>444444</SSCC>
                <Taglio>50</Taglio>
                <Quantita>100000</Quantita>
            </SuperConfezione>
            <SuperConfezione>
                <SSCC>555555</SSCC>
                <Taglio>100</Taglio>
                <Quantita>100</Quantita>
            </SuperConfezione>
            <SuperConfezione>
                <SSCC>666666</SSCC>
                <Taglio>10</Taglio>
                <Quantita>5000</Quantita>
            </SuperConfezione>
        </TrasferisciInPresenzaInput>
        
    </xsl:variable>
     <xsl:template match="node()|@*">
            <xsl:copy>
                <xsl:apply-templates select="node()|@*"/>
            </xsl:copy>
        </xsl:template>
        
    <xsl:template match="dataContabile/text()">
            <xsl:value-of select="current-dateTime()"/>
    </xsl:template>
    <xsl:template match="idRichiesta/text()">
        <xsl:value-of select="'111'"/>
    </xsl:template>
    <xsl:template match="ripetizioneRiga">
        <xsl:for-each select="$params/Confezione">
        <riga>
            <ansiCC>0</ansiCC>
            <testo>./SSCC</testo>
        </riga>
        </xsl:for-each>    
    </xsl:template>
</xsl:stylesheet>