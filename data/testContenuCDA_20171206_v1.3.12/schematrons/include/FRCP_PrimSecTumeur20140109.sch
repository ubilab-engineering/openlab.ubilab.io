<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    FRCP_PrimSecTumeur20140109.sch :
    Contenu :

    Paramètres d'appel :
        Néant 
    Historique :
        10/01/2014 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_PrimSecTumeur" is-a="dansJeuDeValeurs">
    <p>Nature de la tumeur</p>
    <param name="path_jdv" value="$jdv_FRCP_PrimSecTumeur"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.3.14.1']/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code='G-1009']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


