<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="D2LM_ConduiteATenir_3" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_D2LM_ConduiteATenir_3"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code[@code='GEN-007']/cda:qualifier[cda:name/@code='MED-121']/cda:value[@code='G-A460' or @code='G-A249']]/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   