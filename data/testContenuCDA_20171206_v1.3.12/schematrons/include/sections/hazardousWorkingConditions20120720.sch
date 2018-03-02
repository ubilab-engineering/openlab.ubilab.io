<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ hazardousWorkingConditions.sch ]O@%#o>>=-

Teste la conformité de la section "Hazardous Working Conditions" (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.1)
aux spécifications d'IHE PCC v3.0

Historique :
24/06/11 : CRI : Création

-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="hazardousWorkingConditions-errors"> 
    <title>IHE PCC v3.0 Hazardous Working Conditions Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.1"]'> 
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            Erreur [hazardousWorkingConditions] : le templateId de 'Hazardous Working Conditions' ne peut être utilisé que pour une section.
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10161-8"]'> 
            Erreur[hazardousWorkingConditions] : Le code de la section 'Hazardous Working Conditions' doit être "10161-8" 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [hazardousWorkingConditions] : Le code de la section doit être un code LOINC. 
        </assert> 
        <assert test='.//cda:text'> 
            <!-- Verify that all required data elements are present -->
            Erreur [hazardousWorkingConditions] : La section Hazardous Working Conditions doit avoir un élément text.
            
        </assert> 
    </rule> 
</pattern>