<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    observationInterpretation.sch :
    Contenu :
        Contrôle du contenu d'un élément observation/interpretationCode par rapport au jeu de valeurs JDV_BIO_Interpretation_CI-SIS 
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        03/10/17 : NMA  : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="interpretation" is-a="dansJeuDeValeurs">
    <p>Conformité du code d'une interpretation d'observation / jeu de valeurs observationInterpretation</p>
    <param name="path_jdv" value="$jdv_interpretation"/>
    <param name="vue_elt" value="'observation/interpretationCode'"/>
    <param name="xpath_elt" value="cda:observation/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern>   
