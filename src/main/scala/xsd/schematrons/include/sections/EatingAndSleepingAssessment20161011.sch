<?xml version="1.0" encoding="UTF-8"?>


<!--                  -=<<o#%@O[ EatingAndSleepingAssessment.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Eating And Sleeping Assessment" (1.3.6.1.4.1.19376.1.7.3.1.1.13.5)
    aux spécifications d'IHE PCC v3.0
    

    
    Historique :
    11/10/16 : NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="EatingAndSleepingAssessment-errors">
    <title>IHE PCC v3.0 EatingAndSleepingAssessment Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.5"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur de Conformité volet PCC: Cet élément ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47420-5"]'> 
            Erreur de Conformité volet PCC: Le code de la section Eating And Sleeping Assessment doit être 47420-5
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur de Conformité volet PCC: L'élément 'codeSystem' doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13"]'> 
            <!-- Alert on any missing required if known elements -->
            [SimpleObservation] : la section 'Eating And Sleeping Assessment' doit avoir une 'Simple Observation Entry'
        </assert> 

    </rule>
</pattern>

