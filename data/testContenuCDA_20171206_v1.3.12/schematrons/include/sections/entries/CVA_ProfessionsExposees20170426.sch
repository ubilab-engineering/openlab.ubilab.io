<?xml version="1.0" encoding="UTF-8"?>

<!--
 Historique :
        26/04/2017 : NMA : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CVA_ProfessionsExposees" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_CVA_ProfessionsExposees"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='S-00520']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
