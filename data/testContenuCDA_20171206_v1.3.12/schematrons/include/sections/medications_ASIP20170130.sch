<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ Medications_ASIP.sch ]O@%#o>>=-

Teste la conformité de la section "Medications_ASIP" (1.2.250.1.213.1.1.2.54)

Historique :
30/01/2017 : NMA : Création

-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Medications_ASIP-errors"> 
    <title>Medications_ASIP Section</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.54"]'> 
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            Erreur [Medications_ASIP] : le templateId de 'Medications_ASIP' ne peut être utilisé que pour une section. 
        </assert> 
        <!-- Verify the section type code --> 
        <assert test='cda:code[@code = "10160-0"]'> 
            Erreur [Medications_ASIP] : Le code de la section 'Medications doit être 10160-0
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [Medications_ASIP] : Le code de la section doit être un code LOINC  
            system (2.16.840.1.113883.6.1). 
        </assert> 
    </rule> 
</pattern>