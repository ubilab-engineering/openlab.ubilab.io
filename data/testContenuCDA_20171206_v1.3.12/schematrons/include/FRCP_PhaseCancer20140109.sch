<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    FRCP_PhaseCancer20140109.sch :
    Contenu :

    Paramètres d'appel :
        Néant 
    Historique :
        10/01/2014 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_PhaseCancer" is-a="dansJeuDeValeurs">
    <p>Nature de la tumeur</p>
    <param name="path_jdv" value="$jdv_FRCP_PhaseCancer"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.25']/cda:entry/cda:observation[cda:code/@code='RCP_051']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

