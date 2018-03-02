<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_TopoTrouble20131025.sch :
    Contenu :
    Contrôle de la topographie des troubles moteurs 
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_TopoTrouble" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_TopoTrouble"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/targetSiteCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='DA-21100' or cda:value/@code='F-A4580']/cda:targetSiteCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


