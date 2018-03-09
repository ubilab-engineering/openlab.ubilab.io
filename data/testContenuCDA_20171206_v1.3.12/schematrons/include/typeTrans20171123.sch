<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    typeTrans.sch :
    Contenu :
    Contrôle du code du type de transfert d'une personne de la section Coded Event Outcome
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        23/11/17 : NMA : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="typeTrans" is-a="dansJeuDeValeurs">
    <p>Conformité du type de transfert de la personne au CI-SIS</p>
    <param name="path_jdv" value="$jdv_typeTrans"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/value'"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:code/@code='ORG-081']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   
