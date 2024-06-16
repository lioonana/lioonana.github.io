<xsl:stylesheet version="2.0" 
    xmlns:html="http://www.w3.org/TR/REC-html40"
    xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>XML Image Sitemap</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style type="text/css">
			body {
				font-family: Helvetica, Arial, sans-serif;
				font-size: 13px;
				color: #545353;
			}
			a img {
				border: none;
			}
			table {
				border: none;
				border-collapse: collapse;
			}
			#sitemap tr.odd {
				background-color: #eee;
			}
			#sitemap tbody tr:hover {
				background-color: #ccc;
			}
			#sitemap tbody tr:hover td, #sitemap tbody tr:hover td a {
				color: #000;
			}
			#content {
				margin: 0 auto;
				width: 1000px;
			}
			p.expl {
				margin: 10px 3px;
				line-height: 1.3em;
			}
			p.expl a {
				color: #da3114;
				font-weight: bold;
			}
			a {
				color: #000;
				text-decoration: none;
			}
			a:visited {
				color: #777;
			}
			a:hover {
				text-decoration: underline;
			}
			td {
				font-size:11px;
				padding: 5px 15px 5px 0;
				vertical-align: top;
			}
			td img {
				padding: 0 5px;
			}
			th {
				text-align:left;
				padding-right:30px;
				font-size:11px;
			}
			thead th {
				border-bottom: 1px solid #000;
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div id="content">
			<h1>XML Image Sitemap</h1>
			<p class="expl">
				Generated by <a href="http://udinra.com/">Udinra</a>'s <a href="http://udinra.com/blog/udinra-image-sitemap/">Udinra All Image Sitemap plugin</a>, this is an XML Image Sitemap, meant for consumption by Search Engines.
			</p>
			<p class="expl">
				You can find more information about XML Image sitemaps <a href="http://sitemaps.org">Sitemap.org</a>.
			</p>
			<p class="expl">
				This sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs and <xsl:value-of select="count(sitemap:urlset/sitemap:url/image:image)"/> images.
			</p>			

			<div id="content">
				<table id="sitemap" width="100%">
				<thead>
					<tr>
						<th width="25%">URL</th>
						<th width="75%"><table width="100%"><tbody><tr><th width="40%"><b>Image location</b></th><th width="30%"><b>Image Caption</b></th><th width="30%"><b>Image Title</b></th></tr></tbody></table></th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="sitemap:urlset/sitemap:url"><tr>
							<td width="25%">
								<xsl:variable name="itemURL">
									<xsl:value-of select="sitemap:loc"/>
								</xsl:variable>
								<a href="{$itemURL}">
									<strong><xsl:value-of select="sitemap:loc"/></strong>
								</a>
							</td>
					<td><table width="100%">
					<xsl:for-each select="image:image">
					<tr>
							<td width="40%">
								<xsl:value-of select="image:loc"/>
							</td>
			
							<td width="30%">
								<xsl:variable name="capt">
									<xsl:value-of select="image:caption"/>
								</xsl:variable>      
								<xsl:choose>
									<xsl:when test="string-length($capt) &lt; 200">
										<xsl:value-of select="$capt"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat(substring($capt,1,200),' ...')"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>

							<td width="30%">
								<xsl:variable name="titl">
									<xsl:value-of select="image:title"/>
								</xsl:variable>      
								<xsl:choose>
									<xsl:when test="string-length($titl) &lt; 200">
										<xsl:value-of select="$titl"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat(substring($titl,1,200),' ...')"/>
									</xsl:otherwise>
								</xsl:choose>
							</td></tr>
					</xsl:for-each></table></td></tr>
					</xsl:for-each>
					</tbody>
				</table>
			</div>
		
		</div>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>