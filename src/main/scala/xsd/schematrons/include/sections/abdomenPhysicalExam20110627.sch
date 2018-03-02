<?xml version="1.0" encoding="UTF-8"?>


<!--                  -=<<o#%@O[ abdomenPhysicalExam.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Abdomen" (1.3.6.1.4.1.19376.1.5.3.1.1.9.31)
    aux spécifications d'IHE PCC v3.0
    
    Note: Cette section est utilisée comme sous-section de la section IHE PCC v3.0 Coded Physical Exam Section
    (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1) et non telle quelle
    
    Historique :
    24/06/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="abdomenPhysicalExam-errors">
    <title>IHE PCC v3.0 Abdomen Section</title>
    
    <!-- ****** Contexte = section Abdomen ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.31"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur de Conformité volet PCC: Cet élément ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10191-5"]'> 
            Erreur de Conformité volet PCC: Le code de la section Abdomen doit être 10191-5
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur de Conformité volet PCC: L'élément 'codeSystem' doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        

    </rule>
    
</pattern>

