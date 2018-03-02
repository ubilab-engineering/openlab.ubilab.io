<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEeyesEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs aux fonction visuelles selon
    les spécifications cliniques du volet Certificats de santé de l'enfant CS9, et CS24 
    pour la section "Coded Physical Exam Section/Abdomen" 
    Note: Ce schematron est commun aux deux volets CS9, CS24
    
    Historique :
    24/06/11 : CRI : Création
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEeyesEnt-errors">
    <title>IHE PCC v3.0 Eyes</title>
    
    <!-- ****** Contexte = sous-section Oeil ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.19"]'>
        
        <!-- Examen optique normal -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="MED-187"'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: L'absence ou la présence d'un examen optique normal doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
    </rule>
</pattern>


