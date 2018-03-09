<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_hemisphereLobaire20131025.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_hemisphereLobaire" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_hemisphereLobaire"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89200']/cda:entryRelationship/cda:observation[cda:value/@code='AVC-161']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
