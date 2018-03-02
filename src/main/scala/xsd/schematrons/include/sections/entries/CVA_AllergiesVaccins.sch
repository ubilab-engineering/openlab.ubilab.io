<?xml version="1.0" encoding="UTF-8"?>

<!--
 Historique :
        26/10/2017 : NMA : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CVA_AllergiesVaccins" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_CVA_AllergiesVaccins"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/act/entryRelationship/observation/participant/participantRole/playingEntity/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code[@code='ALG']]/cda:participant/cda:participantRole/cda:playingEntity/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
