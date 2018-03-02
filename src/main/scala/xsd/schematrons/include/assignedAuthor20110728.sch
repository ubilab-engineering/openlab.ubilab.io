<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    assignedAuthor.sch :
    Contenu :
        Contrôle d'un élément assignedAuthor : 
        Présence d'au moins une adresse géographique (addr) et d'au moins une adresse telecom
        nullFlavor autorisé.
    Paramètres d'appel :
        Néant
    Historique :
        28/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="assignedAuthor">
    <rule context="cda:assignedAuthor">
        <assert test="cda:addr"> Erreur de conformité CI-SIS : L'élément assignedAuthor doit
            comporter une adresse géographique (nullFlavor autorisé). </assert>
        <assert test="cda:telecom"> Erreur de conformité CI-SIS : L'élément assignedAuthor doit
            comporter une adresse telecom (nullFlavor autorisé). </assert>
    </rule>
</pattern>
