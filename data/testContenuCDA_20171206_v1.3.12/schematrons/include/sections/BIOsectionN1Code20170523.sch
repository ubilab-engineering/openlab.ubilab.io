<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOsectionN1Code.sch :
    Contenu :
        Contrôle des sections de 1er niveau dans le corps d'un CR d'examens biologiques 
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        21/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOsectionN1Code" is-a="dansJeuDeValeurs">
    <p>Conformité du code d'une section de 1er niveau dans un CR de biologie / jeu de valeurs chapitresBiologie</p>
    <param name="path_jdv" value="$jdv_chapitresBiologie"/>
    <param name="vue_elt" value="'ClinicalDocument/component/structuredBody/component/section/code'"/>
    <param name="xpath_elt" value="cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.3.2.1']/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>   
