<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:ns1="http://www.example.org" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                exclude-result-prefixes="oracle-xsl-mapper xsi xsd xsl ns1 socket dvm mhdr oraxsl oraext xp20 xref">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/Test.xsd"/>
        <oracle-xsl-mapper:rootElement name="TrasferisciInPresenzaInput" namespace="http://www.example.org"/>
      </oracle-xsl-mapper:source>
      <!-- <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/Test.xsd"/>
            <oracle-xsl-mapper:rootElement name="TrasferisciInPresenzaInput" namespace="http://www.example.org"/>
            <oracle-xsl-mapper:param name="trasferisciInPresenza"/>
         </oracle-xsl-mapper:source>-->
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/Test.xsd"/>
        <oracle-xsl-mapper:rootElement name="TabulatoCasconf" namespace="http://www.example.org"/>
        <oracle-xsl-mapper:param name="tabulatoCasconf"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/Test.xsd"/>
        <oracle-xsl-mapper:rootElement name="Tabulato" namespace="http://www.example.org"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU FEB 23 12:10:17 CET 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <!-- <xsl:param name="trasferisciInPresenza"/> -->
  <xsl:param name="tabulatoCasconf"/>
  <xsl:template match="/">
    <ns1:Tabulato>
      <ns1:Intestazione>
        <xsl:value-of select="$tabulatoCasconf/ns1:TabulatoCasconf/ns1:Intestazione"/>
      </ns1:Intestazione>
      <xsl:if test="count($tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListConfezioni) > 0 and count(/ns1:TrasferisciInPresenzaInput/ns1:Confezione)>0">
        <ns1:Riga>
          <ns1:ansiCC>0</ns1:ansiCC>
          <ns1:testo>ELENCO CONFEZIONI TRASFERITE</ns1:testo>
        </ns1:Riga>
        <xsl:for-each select="/ns1:TrasferisciInPresenzaInput/ns1:Confezione">
          <ns1:Riga>
            <ns1:ansiCC></ns1:ansiCC>
            <ns1:testo>
                   <xsl:value-of select="concat($tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListConfezioni/ns1:Confezione/ns1:SSCC,' ',./ns1:SSCC,' ',$tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListConfezioni/ns1:Confezione/ns1:Taglio,' ',./ns1:Taglio,' ',$tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListConfezioni/ns1:Confezione/ns1:Quantita,' ',./ns1:Quantita)"/>
                   <!--,' ',$tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListConfezioni/ns1:Confezione/ns1:Quantita,' ',./ns1:Quantita,' ',$tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListConfezioni/ns1:Confezione/ns1:Taglio,' ',./ns1:Taglio"/>     -->
              </ns1:testo>
          </ns1:Riga>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="count($tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListSuperConfezioni) > 0 and count(/ns1:TrasferisciInPresenzaInput/ns1:SuperConfezione)>0">
        <ns1:Riga>
          <ns1:ansiCC>0</ns1:ansiCC>
          <ns1:testo>ELENCO SUPER CONFEZIONI TRASFERITE</ns1:testo>
        </ns1:Riga>
        <xsl:for-each select="/ns1:TrasferisciInPresenzaInput/ns1:SuperConfezione">
          <ns1:Riga>
            <ns1:ansiCC></ns1:ansiCC>
            <ns1:testo>
              
              <xsl:value-of select="concat($tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListSuperConfezioni/ns1:Confezione/ns1:SSCC,' ',./ns1:SSCC,' ',$tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListSuperConfezioni/ns1:Confezione/ns1:Taglio,' ', ./ns1:Taglio,' ',$tabulatoCasconf/ns1:TabulatoCasconf/ns1:ListSuperConfezioni/ns1:Confezione/ns1:Quantita,' ',./ns1:Quantita)"/>
              
            </ns1:testo>
          </ns1:Riga>
        </xsl:for-each>
      </xsl:if>
    </ns1:Tabulato>
  </xsl:template>
  
  
  
  
  
  
</xsl:stylesheet>
