<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Demarche" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_demarche"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[(cda:code/@code='GEN-017')]/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
