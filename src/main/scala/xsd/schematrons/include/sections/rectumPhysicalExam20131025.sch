<?xml version="1.0" encoding="UTF-8"?>


<!--                  -=<<o#%@O[ ORLPhysicalExam.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Rectum" (1.3.6.1.4.1.19376.1.5.3.1.1.9.37)
    aux spécifications d'IHE PCC v3.0
    rectumPhysicalExam20131025.sch
    
    Note: Cette section est utilisée comme sous-section de la section IHE PCC v3.0 Coded Physical Exam Section
    (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1) et non telle quelle
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="rectumPhysicalExam-errors">
    <title>IHE PCC v3.0 Rectum Section</title>
    
    <!-- ****** Contexte = sous-section Rectum ****** -->
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.37"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [rectumPhysicalExam] Ce template ne peut être utilisé que pour une section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10205-3"]'> 
            [rectumPhysicalExam] Le code de la section 'Rectum' doit être 10205-3
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [rectumPhysicalExam] L'élément 'codeSystem' de la section 'Rectum' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
    </rule>
</pattern>
