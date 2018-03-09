<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    dateCons.sch :
    Contenu :
    Contrôle de la date de déclaration de grossesse de la patiente  (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="dateCons" is-a="dansJeuDeValeurs">
    <p>Conformité de la date de déclaration de grossesse au CI-SIS</p>
    <param name="path_jdv" value="$jdv_dateCons"/>
    <param name="vue_elt" value="ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='ORG-076']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>
