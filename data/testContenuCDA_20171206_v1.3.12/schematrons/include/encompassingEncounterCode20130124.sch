<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    encompassingEncounterCode.sch :
    Contenu :
        Contrôle du type  de prise en charge du patient dans l'en-tête CDA  (élément optionnel et nullFlavor  autorisé)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        24/01/13 : FMY ASIP/PTS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="encompassingEncounterCode" is-a="dansJeuDeValeurs">
    <p>Conformité au CI-SIS du encompassingEncounter/code si cet élément est présent</p>
    <param name="path_jdv" value="$jdv_encompassingEncounterCode"/>
    <param name="vue_elt" value="'componentOf/encompassingEncounter/code'"/>
    <param name="xpath_elt" value="cda:componentOf/cda:encompassingEncounter/cda:code"/>
    <param name="nullFlavor" value="1"/>
</pattern>   