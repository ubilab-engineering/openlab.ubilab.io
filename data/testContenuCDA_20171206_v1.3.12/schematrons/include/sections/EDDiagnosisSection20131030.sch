<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ EDDiagnosisSection20131030.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "ED Diagnosis" (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.9)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    30/10/2013 : CRI : Création  EDDiagnosisSection20131030.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="EDDiagnosisSection-errors">
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.9"]'> 
        <!-- Verify that the template id is used on the appropriate type of object --> 
        <assert test='../cda:section'> 
            [EDDiagnosisSection] Ce composant ne peut être utilisé qu'en tant que section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "11301-9"]'> 
            [EDDiagnosisSection] Le code de la section doit être 11301-9 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [EDDiagnosisSection] Le code de la section doit être tiré de la terminologie LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5"]'> 
            <!-- Verify that all required data elements are present -->
            [EDDiagnosisSection] La section doit contenir des entrées 
            du type Conditions Entry  (1.3.6.1.4.1.19376.1.5.3.1.4.5).
            
        </assert> 
    </rule> 
</pattern>

