<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_InterpretationScoreFisher20131025.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_InterpretationScoreFisher" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_InterpretationScoreFisher"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:value/@code='D3-89110']/cda:entryRelationship/cda:observation/cda:interpretationCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

