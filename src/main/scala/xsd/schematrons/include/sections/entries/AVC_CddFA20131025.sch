<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_CddFA20131025.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_CddFA" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_CddFA"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='D3-31520']/cda:entryRelationship/cda:observation[cda:code/@code='AVC-006']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


