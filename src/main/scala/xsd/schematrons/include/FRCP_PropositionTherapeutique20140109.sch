<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    FRCP_PropositionTherapeutique20140109.sch :
    Contenu :

    Paramètres d'appel :
        Néant 
    Historique :
        10/01/2014 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_PropositionTherapeutique" is-a="dansJeuDeValeurs">
    <p>Nature de la tumeur</p>
    <param name="path_jdv" value="$jdv_FRCP_TypeTraitement"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/procedure/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.31']/cda:entry/cda:procedure/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

