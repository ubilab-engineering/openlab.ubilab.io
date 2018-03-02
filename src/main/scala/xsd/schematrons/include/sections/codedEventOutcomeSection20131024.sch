<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedEventOutcomeSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Event Outcome" (1.3.6.1.4.1.19376.1.7.3.1.1.13.7)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    codedEventOutcomeSection20131024.sch : CRI : Création
    06/05/15 : JDS : Correction d'un commmentaire ( fonctionnalités inchangées) 
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedEventOutcomeSection-errors">
    <title>IHE PCC v3.0 Procedures and Intervention Section</title>

        <title>IHE PCC v3.0 Procedures and Interventions Section</title>
        
        
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.7"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
            <assert test='../cda:section'> 
                [codedEventOutcomeSection]: 'Event Outcome' ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "42545-4"]'> 
            [codedEventOutcomeSection]: Le code de la section 'Event Outcome' doit être '42545-4'              
            </assert> 
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                [codedEventOutcomeSection]: L'élément 'codeSystem' de la section 
                'Event Outcome' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13"]'> 
                <!-- Vérifier que la section contient des éléments Simple Observations -->
            [codedEventOutcomeSection]: Une section "Event Outcome"
                doit contenir des entrée de type "Simple observations"
            </assert> 
        </rule> 
        
    </pattern>