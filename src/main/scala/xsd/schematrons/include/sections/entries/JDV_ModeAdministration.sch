<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_ModeAdministration" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_modeAdministration"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:substanceAdministration[(cda:code/@code='TE')]/cda:routeCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
