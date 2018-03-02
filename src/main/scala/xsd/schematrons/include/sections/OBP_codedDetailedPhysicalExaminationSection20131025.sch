<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ OBP_codedDetailedPhysicalExaminationSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Coded Detailed Physical Examination" (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1)
    aux spécifications d'IHE PCC v3.0
    OBP_codedDetailedPhysicalExaminationSection20131025.sch
    
    Historique :
    25/10/2013 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="OBP_codedDetailedPhysicalExaminationSection-errors">
    <title>IHE PCC Coded Detailed Physical Examination</title>

    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'> 
    <!-- Verifier que le templateId est utilisé pour une section --> 
    <assert test='../cda:section'> 
        [OBP_codedDetailedPhysicalExaminationSection] le templateId de 'Coded Detailed Physical Examination' ne peut être utilisé que pour une section. 
    </assert> 
 
    <!-- Vérifier le code de la section -->

        <assert test='cda:code[@code = "29545-1"]'> 
            [OBP_codedDetailedPhysicalExaminationSection] Le code utilisé pour la section "Coded Detailed Physical Examination " doit être "29545-1" 
            </assert> 
    <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
        [OBP_codedDetailedPhysicalExaminationSection] La nomenclature LOINC doit être utilisée pour coder la section "Coded Detailed Physical Examination"  
        system (2.16.840.1.113883.6.1). 
    </assert> 
        
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.20"]'> 
            <!-- Note any missing optional elements -->
            [OBP_codedDetailedPhysicalExaminationSection]:Cette section doit contenir une sous-section 'Examen ORL'.
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.37"]'> 
            <!-- Note any missing optional elements -->
            [OBP_codedDetailedPhysicalExaminationSection]:Cette section doit contenir une sous-section ' Examen du rectum'.
        </assert>
    </rule> 
        
    </pattern>