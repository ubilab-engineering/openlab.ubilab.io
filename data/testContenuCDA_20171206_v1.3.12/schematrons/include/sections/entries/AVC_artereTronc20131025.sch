<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_artereTronc20131025.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_artereTronc" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_artereTronc"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:value/@code='T-A2050']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
