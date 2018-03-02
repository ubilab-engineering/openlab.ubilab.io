<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    demConsult.sch :
    Contenu :
    Contrôle du type d'intervention demandé par le médecin
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="demConsult" is-a="dansJeuDeValeurs">
    <p>Conformité de l'intervention demandée</p>
    <param name="path_jdv" value="$jdv_demConsult"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/entry/encounter/code'"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.31']/cda:entry/cda:encounter/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

