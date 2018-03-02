<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ MedicationEntry_ASIP.sch ]O@%#o>>=-
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    MedicationEntry_ASIP (1.2.250.1.213.1.1.3.13)  
    
    
    Historique :
    30/01/2017 : NMA : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="MedicationEntry_ASIP-errors">
    <title>MedicationEntry_ASIP</title>
       
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.13"]'>
       
        <!-- Verifier que le templateId est utilisé pour une entrée --> 
        <assert test='../../cda:entry'> 
            Erreur [Medications_ASIP] : le templateId de 'MedicationEntry_ASIP' ne peut être utilisé que pour une entrée. 
        </assert> 
    </rule>
</pattern>