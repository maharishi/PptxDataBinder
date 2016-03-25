using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Xml.Xsl;
using System.Xml;

namespace PptxBinder {
	class Processor
	{
		#region Properties to be moved to xml / json
		public string BasePath { get; set; } = @"C:\XML2PPTX Converter\";
		public string PptxFileName { get; set; } = "test_copy.pptx";

		public List<FileData> FileList { get; set; } = new List<FileData>() {
			new FileData { FileName = "[Content_Types].xml" , ZipPath = "/" } ,
			new FileData { FileName =  "app.xml" , ZipPath = "/docProps" } ,
			new FileData { FileName = "presentation.xml" , ZipPath = "/ppt" } ,
			new FileData { FileName = "presentation.xml.rels" , ZipPath = "/ppt/_rels" } ,
		};
		public Dictionary<string , string> Xslt { get; set; } = new Dictionary<string , string> {
			{ "DataTransform" , "Products.xslt" },
			{ "DataRefTransform" , "SlideRef.xslt" },
			{ "AppTransform" , "app.xslt" },
			{ "ContentTypeTransform" , "Content_Types.xslt" },
			{ "PresentationTransform" , "presentation.xslt" },
			{ "PresentationRelsTransform" , "presentation.rels.xslt" }
		};

		public int NoOfRows { get; set; } = 5;
		public int SlideStartNumber { get; set; } = 1;
		public int RelationshipIDStartNumber { get; set; } = 6;

		public int RelationshipRunningStartNumber { get; set; } = 256;
		#endregion

		XslCompiledTransform slideTransform = new XslCompiledTransform( );
		XslCompiledTransform slideRelsTransform = new XslCompiledTransform( );
		XslCompiledTransform appTransform = new XslCompiledTransform( );
		XslCompiledTransform contentTypesTransform = new XslCompiledTransform( );
		XslCompiledTransform presentationTransform = new XslCompiledTransform( );
		XslCompiledTransform presentationRelsTransform = new XslCompiledTransform( );


		public Processor( ) {
			slideTransform.Load( string.Format( "{0}{1}" , BasePath , Xslt[ "DataTransform" ] ) );
			slideRelsTransform.Load( string.Format( "{0}{1}" , BasePath , Xslt[ "DataRefTransform" ] ) );
			appTransform.Load( string.Format( "{0}{1}" , BasePath , Xslt[ "AppTransform" ] ) );
			contentTypesTransform.Load( string.Format( "{0}{1}" , BasePath , Xslt[ "ContentTypeTransform" ] ) );
			presentationTransform.Load( string.Format( "{0}{1}" , BasePath , Xslt[ "PresentationTransform" ] ) );
			presentationRelsTransform.Load( string.Format( "{0}{1}" , BasePath , Xslt[ "PresentationRelsTransform" ] ) );
			Console.WriteLine( "Loaded all transformers" );
		}

		public void Process( ) {
			int slideno = 1;
			for( ; ; ) {
				var products = GetProductsData( slideno , NoOfRows );
				if( !products.Root.Elements( ).Any( ) ) {
					break;
				}
				CreateSlides( products , slideno );
				Console.WriteLine( "Transformed Slide {0}" , slideno );
				slideno++;
			}
			CreateMetaData( slideno );
			CreatePPTX( );
		}

		public void CreateSlides( XDocument data , int slidenum ) {
			XDocument result = new XDocument( );
			using( XmlWriter xw = result.CreateWriter( ) ) {
				slideTransform.Transform( data.Document.CreateReader( ) , xw );
				xw.Close( );
			}
			FileList.Add( new FileData {
				FileName = string.Format( "slide{0}.xml" , ( SlideStartNumber + slidenum ) ) ,
				ZipPath = "/ppt/slides" ,
				RelationshipRID = RelationshipIDStartNumber + slidenum ,
				RelationshipID = RelationshipRunningStartNumber + slidenum 
			} );
			result.Save( string.Format( "{0}slide{1}.xml" , BasePath , ( SlideStartNumber + slidenum ) ) , SaveOptions.DisableFormatting );

			result = new XDocument( );
			var temp = new XDocument( new XElement( "root" ) );
			using( XmlWriter xw = result.CreateWriter( ) ) {
				slideRelsTransform.Transform( temp.Document.CreateReader( ) , xw );
				xw.Close( );
			}
			FileList.Add( new FileData {
				FileName = string.Format( "slide{0}.xml.rels" , ( SlideStartNumber + slidenum ) ) ,
				ZipPath = "/ppt/slides/_rels"
			} );
			result.Save( string.Format( "{0}slide{1}.xml.rels" , BasePath , ( SlideStartNumber + slidenum ) ) , SaveOptions.DisableFormatting );
		}

		public void CreateMetaData( int totalSlides ) {
			//Generate the app.xml file
			string xml = @"<app><totalslides>{0}</totalslides></app>";
			XDocument data = XDocument.Parse( string.Format( xml , totalSlides ) );
			XDocument result = new XDocument( );
			using( XmlWriter xw = result.CreateWriter( ) ) {
				appTransform.Transform( data.Document.CreateReader( ) , xw );
				xw.Close( );
			}
			result.Save( string.Format( "{0}app.xml" , BasePath ) , SaveOptions.DisableFormatting );
			Console.WriteLine( "Created app.xml");

			//Generate the xml which will be used to bind the rest of the meta xmls
			data = new XDocument( new XElement( "Relationships" ,
				( from r in FileList
				  where r.RelationshipID != null
				  select r ).ToList( ).Select( x => new XElement( "Relationship" ,
					 new XAttribute( "rId" , string.Format( "rId{0}" , x.RelationshipRID ) ) ,
					 new XAttribute( "id" , x.RelationshipID ),
					 new XAttribute( "target" , x.FileName ),
					 new XAttribute( "zippath" , x.ZipPath ) 
					 ) ) ) );
			
			//Generate the presenation.xml
			result = new XDocument( );
			using( XmlWriter xw = result.CreateWriter( ) ) {
				presentationTransform.Transform( data.Document.CreateReader( ) , xw );
				xw.Close( );
			}
			result.Save( string.Format( "{0}presentation.xml" , BasePath ) , SaveOptions.DisableFormatting );
			Console.WriteLine( "Created presentation.xml" );

			//Generate the presenation.xml.rels
			result = new XDocument( );
			using( XmlWriter xw = result.CreateWriter( ) ) {
				presentationRelsTransform.Transform( data.Document.CreateReader( ) , xw );
				xw.Close( );
			}
			result.Save( string.Format( "{0}presentation.xml.rels" , BasePath ) , SaveOptions.DisableFormatting );
			Console.WriteLine( "Created presentation.xml.rels" );

			//Generate the [Content_types].xml
			result = new XDocument( );
			using( XmlWriter xw = result.CreateWriter( ) ) {
				contentTypesTransform.Transform( data.Document.CreateReader( ) , xw );
				xw.Close( );
			}
			result.Save( string.Format( "{0}[Content_Types].xml" , BasePath ) , SaveOptions.DisableFormatting );
			Console.WriteLine( "Created [Content_Types].xml" );
		}

		public void CreatePPTX( ) {
			//Update the zip file
			using( ZipFile zip = ZipFile.Read( string.Format( "{0}{1}" , BasePath , PptxFileName ) ) ) {
				foreach( var item in FileList ) {
					zip.UpdateItem( string.Format( "{0}{1}" , BasePath , item.FileName ) , item.ZipPath );
				}
				zip.Save( );
			}

			Console.WriteLine( "Updated the zip file {0}", PptxFileName );
		}

		public XDocument GetProductsData( int pageno , int pagesize ) {
			using( var ctx = new dbContext( ) ) {
				var products = new XDocument( new XElement( "Products" , (
								from r in ctx.Products
								where r.Discontinued == false
								select new {
									r.ProductID ,
									r.ProductName ,
									r.QuantityPerUnit ,
									r.UnitPrice ,
									r.UnitsInStock ,
									r.Discontinued
								} )
								.OrderBy( x => x.ProductID )
								.Skip( ( pageno - 1 ) * pagesize )
								.Take( pagesize )
								.ToList( ).Select( x => new XElement( "Product" ,
								  new XAttribute( "ProductID" , x.ProductID ) ,
								  new XAttribute( "ProductName" , x.ProductName ) ,
								  new XAttribute( "QuantityPerUnit" , x.QuantityPerUnit ) ,
								  new XAttribute( "UnitPrice" , x.UnitPrice ) ,
								  new XAttribute( "UnitsInStock" , x.UnitsInStock ) ,
								  new XAttribute( "Discontinued" , x.Discontinued ) ) )
								) );
				return products;
			}
		}
	}

	class FileData {
		public string FileName { get; set; }
		public string ZipPath { get; set; }
		public int? RelationshipID { get; set; }
		public int? RelationshipRID { get; set; }
	}
}
