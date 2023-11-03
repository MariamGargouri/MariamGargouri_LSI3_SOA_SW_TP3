<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="ttalSolde">
	<xsl:value-of select="sum (//getComptes/solde)"> </xsl:value-of>
	</xsl:variable>
	<xsl:variable name="totalSoldeFiltre">
	<xsl:value-of select="sum(BanqueService/getComptes[substring(date,1,4) > 2000]/solde)" > </xsl:value-of>
	</xsl:variable>
	<xsl:template match="/">
	
	<html>
	<head>
	<title>Liste des Comptes </title>
	</head>
	<body>
		<h1>Liste des soldes</h1>
		
		<table>
			<tr>
			    <th>code</th>
				<th>solde</th>
				<th>date</th>
			</tr>
			<xsl:for-each select="BanqueService/getComptes">
				<tr>
					<td>
						<xsl:value-of select="code" />
					</td>
					<td>
						<xsl:value-of select="solde" />
					</td>
					<td>
						<xsl:value-of select="date" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
		
		<p>
			Somme totale des soldes: <xsl:value-of select="$totalSolde" /> 
		</p>
		
		<h1>Liste des comptes crees apres 2000</h1>

		<table>
			<tr>
				<th>Code</th>

				<th>Solde</th>

				<th>date</th>
			</tr>
			<xsl:for-each select="//getComptes[substring(dateCreation,1,4) > 2000]">
			<tr>
				<td>
				<xsl:value-of select="code" />
				</td>
				<td>
				<xsl:value-of select="solde" />
				</td>
				<td>
				<xsl:value-of select="dateCreation" />
				</td>
			</tr>
			</xsl:for-each>
		</table>
		
		<p>
			Somme totale des soldes des comptes crees apres 2000:<xsl:value-of select="$totalSoldefiltre" />
		</p>
		
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>

