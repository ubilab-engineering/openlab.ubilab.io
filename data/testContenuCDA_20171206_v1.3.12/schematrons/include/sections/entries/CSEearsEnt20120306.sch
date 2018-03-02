<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEearsEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs aux fonctions auditives du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Ears" 
    
    Historique :
    27/06/11 : CRI : Création
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEearsEnt-errors">
    <title>IHE PCC v3.0 Ears</title>
    
    <!-- ****** Contexte = sous-section Apparence générale ****** -->
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.21"]'>
        
        <!-- Entrée Examen auditif -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="MED-178"'>
            [CSEearsEnt] L'absence ou la présence d'un examen auditif normal doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
    </rule>
</pattern>
