<?xml version="1.0" encoding="UTF-8"?>

<!--
     Version 1.2
	 Description : Jeux de valeurs contenant toutes les modalités de sortie possible d'un EHPAD (Etablissement Hébergement pour Personnes Agées Dépendantes)
	 Historique : 19/12/16 NMA : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="LDL_ModaliteSortie" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_ModaliteSortie"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='LDL-32']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>