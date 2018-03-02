<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    encompassingEncounterEffectiveTime.sch :
    Contenu :
        Règles de contrôle de la période de prise en charge du patient (nullFlavor autorisé)
    Paramètres d'appel :
        néant
    Historique :
        23/01/13 : FMY ASIP/PTS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="encounterEffectiveTime" is-a="IVL_TS">
    <p>Conformité de la période de prise en charge du patient, nullFlavor autorisé</p>
    <param name="elt" value="cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:effectiveTime"/>
    <param name="vue_elt" value="'ClinicalDocument/componentOf/encompassingEncounter/effectiveTime'"/>
    <param name="nullFlavor" value="1"/>
</pattern>