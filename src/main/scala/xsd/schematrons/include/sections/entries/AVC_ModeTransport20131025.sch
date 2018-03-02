<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_ModeTransport20131025.sch :
    Contenu :
    Contrôle du code des Types de mode de transport (Coded Event Outcome subsection)
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_ModeTransport" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_ASIP_ModeDeTransport"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/act/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.10.3.2']/cda:entry/cda:act/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   


