<?xml version="1.0" encoding="utf-8"?>
<!--
	Author: 
	File: 
	Date: 
	Purpose: 
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
	<xsl:output method="xml" indent="yes" encoding="utf-8"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
			<p:cSld>
				<p:spTree>
					<p:nvGrpSpPr>
						<p:cNvPr id="1" name=""/>
						<p:cNvGrpSpPr/>
						<p:nvPr/>
					</p:nvGrpSpPr>
					<p:grpSpPr>
						<a:xfrm>
							<a:off x="0" y="0"/>
							<a:ext cx="0" cy="0"/>
							<a:chOff x="0" y="0"/>
							<a:chExt cx="0" cy="0"/>
						</a:xfrm>
					</p:grpSpPr>
					<p:sp>
						<p:nvSpPr>
							<p:cNvPr id="2" name="Title 1"/>
							<p:cNvSpPr>
								<a:spLocks noGrp="1"/>
							</p:cNvSpPr>
							<p:nvPr>
								<p:ph type="title"/>
							</p:nvPr>
						</p:nvSpPr>
						<p:spPr/>
						<p:txBody>
							<a:bodyPr/>
							<a:lstStyle/>
							<a:p>
								<a:r>
									<a:rPr lang="en-US" dirty="0" smtClean="0"/>
									<a:t>Testing of tables</a:t>
								</a:r>
								<a:endParaRPr lang="en-US" dirty="0"/>
							</a:p>
						</p:txBody>
					</p:sp>
					<p:graphicFrame>
						<p:nvGraphicFramePr>
							<p:cNvPr id="4" name="Content Placeholder 3"/>
							<p:cNvGraphicFramePr>
								<a:graphicFrameLocks noGrp="1"/>
							</p:cNvGraphicFramePr>
							<p:nvPr>
								<p:ph idx="1"/>
								<p:extLst>
									<p:ext uri="{D42A27DB-BD31-4B8C-83A1-F6EECF244321}">
										<p14:modId val="1703279647" xmlns:p14="http://schemas.microsoft.com/office/powerpoint/2010/main"/>
									</p:ext>
								</p:extLst>
							</p:nvPr>
						</p:nvGraphicFramePr>
						<p:xfrm>
							<a:off x="822323" y="1100138"/>
							<a:ext cx="7559676" cy="2868928"/>
						</p:xfrm>
						<a:graphic>
							<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/table">
								<a:tbl>
									<a:tblPr firstRow="1" bandRow="1">
										<a:tableStyleId>{5C22544A-7EE6-4342-B048-85BDC9FD1C3A}</a:tableStyleId>
									</a:tblPr>
									<a:tblGrid>
										<a:gridCol w="1259946"/>
										<a:gridCol w="1259946"/>
										<a:gridCol w="1259946"/>
										<a:gridCol w="1259946"/>
										<a:gridCol w="1259946"/>
										<a:gridCol w="1259946"/>
									</a:tblGrid>
									<a:tr h="557212">
										<a:tc>
											<a:txBody>
												<a:bodyPr/>
												<a:lstStyle/>
												<a:p>
													<a:r>
														<a:rPr lang="en-US" dirty="0" smtClean="0"/>
														<a:t>Product ID</a:t>
													</a:r>
													<a:endParaRPr lang="en-US" dirty="0"/>
												</a:p>
											</a:txBody>
											<a:tcPr/>
										</a:tc>
										<a:tc>
											<a:txBody>
												<a:bodyPr/>
												<a:lstStyle/>
												<a:p>
													<a:r>
														<a:rPr lang="en-US" dirty="0" smtClean="0"/>
														<a:t>Product Name</a:t>
													</a:r>
													<a:endParaRPr lang="en-US" dirty="0"/>
												</a:p>
											</a:txBody>
											<a:tcPr/>
										</a:tc>
										<a:tc>
											<a:txBody>
												<a:bodyPr/>
												<a:lstStyle/>
												<a:p>
													<a:r>
														<a:rPr lang="en-US" smtClean="0"/>
														<a:t>Quantity Per Unit</a:t>
													</a:r>
													<a:endParaRPr lang="en-US" dirty="0"/>
												</a:p>
											</a:txBody>
											<a:tcPr/>
										</a:tc>
										<a:tc>
											<a:txBody>
												<a:bodyPr/>
												<a:lstStyle/>
												<a:p>
													<a:r>
														<a:rPr lang="en-US" dirty="0" smtClean="0"/>
														<a:t>Unit Price</a:t>
													</a:r>
													<a:endParaRPr lang="en-US" dirty="0"/>
												</a:p>
											</a:txBody>
											<a:tcPr/>
										</a:tc>
										<a:tc>
											<a:txBody>
												<a:bodyPr/>
												<a:lstStyle/>
												<a:p>
													<a:r>
														<a:rPr lang="en-US" dirty="0" smtClean="0"/>
														<a:t>Units In Stock</a:t>
													</a:r>
													<a:endParaRPr lang="en-US" dirty="0"/>
												</a:p>
											</a:txBody>
											<a:tcPr/>
										</a:tc>
										<a:tc>
											<a:txBody>
												<a:bodyPr/>
												<a:lstStyle/>
												<a:p>
													<a:r>
														<a:rPr lang="en-US" dirty="0" smtClean="0"/>
														<a:t>Discontinued</a:t>
													</a:r>
													<a:endParaRPr lang="en-US" dirty="0"/>
												</a:p>
											</a:txBody>
											<a:tcPr/>
										</a:tc>
									</a:tr>
									<xsl:apply-templates></xsl:apply-templates>
								</a:tbl>
							</a:graphicData>
						</a:graphic>
					</p:graphicFrame>
				</p:spTree>
				<p:extLst>
					<p:ext uri="{BB962C8B-B14F-4D97-AF65-F5344CB8AC3E}">
						<p14:creationId val="3668157067" xmlns:p14="http://schemas.microsoft.com/office/powerpoint/2010/main"/>
					</p:ext>
				</p:extLst>
			</p:cSld>
			<p:clrMapOvr>
				<a:masterClrMapping/>
			</p:clrMapOvr>
		</p:sld>
	</xsl:template>
	<xsl:template match="Product">
		<a:tr h="557212">
			<a:tc>
				<a:txBody>
					<a:bodyPr/>
					<a:lstStyle/>
					<a:p>
						<a:r>
							<a:rPr lang="en-US" dirty="0" smtClean="0"/>
							<a:t>
								<xsl:value-of select="@ProductID"/>
							</a:t>
						</a:r>
						<a:endParaRPr lang="en-US" dirty="0"/>
					</a:p>
				</a:txBody>
				<a:tcPr/>
			</a:tc>
			<a:tc>
				<a:txBody>
					<a:bodyPr/>
					<a:lstStyle/>
					<a:p>
						<a:r>
							<a:rPr lang="en-US" dirty="0" err="1" smtClean="0"/>
							<a:t><xsl:value-of select="@ProductName"/></a:t>
						</a:r>
						<a:endParaRPr lang="en-US" dirty="0"/>
					</a:p>
				</a:txBody>
				<a:tcPr/>
			</a:tc>
			<a:tc>
				<a:txBody>
					<a:bodyPr/>
					<a:lstStyle/>
					<a:p>
						<a:r>
							<a:rPr lang="en-US" dirty="0" smtClean="0"/>
							<a:t><xsl:value-of select="@QuantityPerUnit"/></a:t>
						</a:r>
						<a:endParaRPr lang="en-US" dirty="0"/>
					</a:p>
				</a:txBody>
				<a:tcPr/>
			</a:tc>
			<a:tc>
				<a:txBody>
					<a:bodyPr/>
					<a:lstStyle/>
					<a:p>
						<a:r>
							<a:rPr lang="en-US" dirty="0" smtClean="0"/>
							<a:t><xsl:value-of select="@UnitPrice"/></a:t>
						</a:r>
						<a:endParaRPr lang="en-US" dirty="0"/>
					</a:p>
				</a:txBody>
				<a:tcPr/>
			</a:tc>
			<a:tc>
				<a:txBody>
					<a:bodyPr/>
					<a:lstStyle/>
					<a:p>
						<a:r>
							<a:rPr lang="en-US" dirty="0" smtClean="0"/>
							<a:t> <xsl:value-of select="@UnitsInStock"/></a:t>
						</a:r>
						<a:endParaRPr lang="en-US" dirty="0"/>
					</a:p>
				</a:txBody>
				<a:tcPr/>
			</a:tc>
			<a:tc>
				<a:txBody>
					<a:bodyPr/>
					<a:lstStyle/>
					<a:p>
						<a:r>
							<a:rPr lang="en-US" dirty="0" smtClean="0"/>
							<a:t><xsl:value-of select="@Discontinued"/></a:t>
						</a:r>
						<a:endParaRPr lang="en-US" dirty="0"/>
					</a:p>
				</a:txBody>
				<a:tcPr/>
			</a:tc>
		</a:tr>
	</xsl:template>
</xsl:stylesheet>
