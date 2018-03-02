:: ---------------------------------------------------------------------------------------
:: Execution : compilverif contenu schema
:: Le fichier ..\..\contenu.xml est valid� / au standard (..\..\infrastructure\cda\CDA.xsd),
:: puis v�rifi� s�mantiquement suivant le sch�matron ..\schema.xsl
:: Le moteur xslt2 utilise est  saxon9he.jar, open source ecrit en java
:: Le resultat est produit dans un rapport au standard svrl : ..\rapports\contenu_verif.xml
:: Le rapport est visualisable dans n'importe quel navigateur grace a la feuille de style 
:: rapportSchematronToHtml4.xsl qui lui est attachee.
:: ---------------------------------------------------------------------------------------
@echo off
if "%1"=="" goto USAGE
set schema=%2
if "%2"=="" set schema=CI-SIS_StructurationCommuneCDAr2
::echo.
::echo Selection de l'arbre ClinicalDocument dans %1.xml
::@echo on
::java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\%1.xml -xsl:selectCDA.xsl -o:tmp\%1.xml
::@echo off
echo.
echo Validation du fichier %1.xml par rapport au schema CDA
@echo on
java -jar xsdvalidator-1.3.jar ..\..\%1.xml "..\..\infrastructure\cda\CDA_extended.xsd" 1> ..\rapports\%1_validCDA.xml
@echo off
:: Partie � ne garder qu'en d�veloppement
del colle.sch concret.sch
echo.
echo 1) precompilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\%schema%.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) precompilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) compilation en xslt2 : produit %schema%.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\%schema%.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\%1.xml -xsl:..\%schema%.xsl -o:..\rapports\%1_verif.xml 
@echo off
echo.
echo Rapport de Verification : ..\rapports\%1_verif.xml
echo.
goto END
:USAGE
echo.
echo USAGE: %0 fichier_a_verifier_sans_extension schematron_sans_extension
echo.
echo le fichier a verifier doit exister avec l'extension xml dans le repertoire ..\.. 
echo le schematron (par defaut CI-SIS_StructurationCommuneCDAr2.xsl) 
echo doit etre sous la forme xslt2 dans le repertoire .. ;
echo le rapport de verification est produit dans le repertoire ..\rapports
echo sous le nom fichier_a_verifier_verif.xml
echo.
:END
