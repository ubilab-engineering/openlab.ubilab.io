<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_Severite" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_Severite"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:code[@displayName='']"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
