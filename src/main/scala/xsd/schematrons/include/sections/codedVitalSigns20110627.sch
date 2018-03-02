<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedVitalSigns.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Coded Vital Signs" (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2)
    aux spécifications d'IHE PCC v3.0
    Teste la présence d'un élément Vital Sign Organizer comme unique entrée de cette section
    
    Historique :
    27/06/11 : CRI : Création
    
-->



<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedVitalSigns-errors">
    <title>IHE PCC v3.0 Coded Vital Signs Section - errors validation phase</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2"]'>
        
<!-- Verifier que le templateId est utilisépour une section -->
        <assert test='../cda:section'> 
            [codedVitalSigns] ce template ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "8716-3"]'> 
            [codedVitalSigns] Le code de la section Coded Vital signs doit être 8716-3
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [codedVitalSigns] L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        <!-- Verifier que le templateId parent est présent. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.3.25"]'> 
            [codedVitalSigns] L'identifiant du template parent pour la section est absent. 
        </assert>
        <!-- Verifier la présence d'un vital signs organizer comme élément d'entrée -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13.1"]'>
            [codedVitalSigns] Une section 'Coded Vital Signs' doit contenir un élément 'Vital Signs Organizer'.
        </assert> 
    </rule>
</pattern>
