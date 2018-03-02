<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CodedReasonForReferral ]O@%#o>>=-
    
    - Teste la conformité de la section "Coded Reason For Referral" (1.3.6.1.4.1.19376.1.5.3.1.3.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    30/10/2013 : CRI : Création  CodedReasonForReferral20131030.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CodedReasonForReferral-errors">
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.2"]'> 
        <!-- Verify that the template id is used on the appropriate type of object --> 
        <assert test='../cda:section'> 
            [CodedReasonForReferral] Ce composant ne peut être utilisé qu'en tant que section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "42349-1"]'> 
            [CodedReasonForReferral] Le code de la section doit être 42349-1 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [CodedReasonForReferral] Le code de la section doit être tiré de la terminologie LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5"]'> 
            <!-- Verify that all required data elements are present -->
            [CodedReasonForReferral] La section doit contenir des entrées 
            du type Conditions Entry  (1.3.6.1.4.1.19376.1.5.3.1.4.5).            
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13"]'> 
            <!-- Verify that all required data elements are present -->
            [CodedReasonForReferral] La section doit contenir des entrées 
            du type Simple Observations  (1.3.6.1.4.1.19376.1.5.3.1.4.13).            
        </assert> 
    </rule> 
</pattern>

