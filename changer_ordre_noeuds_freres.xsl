<?xml version="1.0" encoding="UTF-8"?>

<!-- permet de changer l'ordre de noeuds frères -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- L'instruction ci-desssous permet de conserver le DOCTYPE avec référence à l'EAD -->

<xsl:output doctype-public="+//ISBN 1-931666-00-8//DTD ead.dtd (Encoded Archival Description (EAD) Version 2002)//EN"
  doctype-system="/ead.dtd" method="xml" version="1.0" encoding="UTF-8" indent="yes" media-type="text/xml"/>

<xsl:strip-space elements="*"/>

<!-- Ne fonctionne que pour changer l'ordre de noeuds frères qui ont déjà une même balise mère ; si l'un des noeuds frères n'existe pas, le code fonctionnera, le noeud frère en question ne sera pas créé -->

<xsl:template match="ead/eadheader/filedesc/titlestmt">
<!-- Indiquer ici le chemin vers le noeud dont on changera l'ordre des éléments fils -->
    <xsl:copy>
			<!-- Mettre ici les noeuds fils dans l'ordre choisi, sous la forme select="@*|titleproper" -->
			<xsl:apply-templates select="@*|titleproper"/>
            <xsl:apply-templates select="@*|subtitle"/>
			<xsl:apply-templates select="@*|author"/>
			<!-- Ici, <subtitle> sera déplacé sous <titleproper>, conformément aux règles de l'EAD -->
    </xsl:copy>
</xsl:template>

<!-- étape 3 : appliquer les templates -->

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>