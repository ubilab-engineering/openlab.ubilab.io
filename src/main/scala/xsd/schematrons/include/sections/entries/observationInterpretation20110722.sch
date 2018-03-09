<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    observationInterpretation.sch :
    Contenu :
        Contrôle du contenu d'un élément observation/interpretationCode par rapport au jeu de valeurs observationInterpretation 
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        22/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="observationInterpretation" is-a="dansJeuDeValeurs">
    <p>Conformité du code d'une interpretation d'observation / jeu de valeurs observationInterpretation</p>
    <param name="path_jdv" value="$jdv_observationInterpretation"/>
    <param name="vue_elt" value="'observation/interpretationCode'"/>
    <param name="xpath_elt" value="cda:observation/cda:interpretationCode"/>
    <param name="nullFlavor" value="1"/>
</pattern>   
