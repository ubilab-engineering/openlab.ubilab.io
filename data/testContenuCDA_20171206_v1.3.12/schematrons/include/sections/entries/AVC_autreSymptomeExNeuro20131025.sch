<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_autreSymptomeExNeuro20131025.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_autreSymptomeExNeuro" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_autreSymptomeExNeuro"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.9.35']/cda:entry/cda:observation/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
