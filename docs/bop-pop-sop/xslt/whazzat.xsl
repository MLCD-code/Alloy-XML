<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0"
                xmlns:f="https://coffeepot.nineml.org/ns/functions">

  <xsl:function name="f:choose-alternative" as="map(*)">
    <xsl:param name="context" as="element()"/>
    <xsl:param name="options" as="map(*)"/>

    <xsl:message>Got this element: <xsl:copy-of select="$context"/></xsl:message>

    <!--
    <xsl:variable name="choice"
                  select="$context/children[symbol[@name='decimal']]/@id"/>
    
    <xsl:sequence select="map { 'selection': $choice }"/>
    -->

    <xsl:sequence select="map { 'selection': $options?available-choices[1] }"/>
  </xsl:function>
  
  
</xsl:stylesheet>
