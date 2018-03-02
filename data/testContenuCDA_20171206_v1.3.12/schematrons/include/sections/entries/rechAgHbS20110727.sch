<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    rechAgHbS.sch :
    Contenu :
    Contrôle de l'état d'immunisation à l'hépatite de la patiente  (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="rechAgHbS" is-a="dansJeuDeValeurs">
    <p>Conformité de la catégorie professionnelle de la personne au CI-SIS</p>
    <param name="path_jdv" value="$jdv_rechAgHbS"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/cda:value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:code/@code='5196-1']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>
