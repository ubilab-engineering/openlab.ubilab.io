<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    typPres.sch :
    Contenu :
    Contrôle de la présentation du nouveau-né lors du travail  (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="typPres" is-a="dansJeuDeValeurs">
    <p>Conformité de la date de déclaration de grossesse au CI-SIS</p>
    <param name="path_jdv" value="$jdv_typPres"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation[cda:code/@code='F-87000']/cda:value"/>
    <param name="nullFlavor" value="1"/>
</pattern>

