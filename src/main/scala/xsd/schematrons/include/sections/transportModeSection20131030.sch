<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ transportModeSection20131030.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Transport Mode" (1.3.6.1.4.1.19376.1.5.3.1.1.10.3.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    30/10/2013 : CRI : Création transportModeSection20131030.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="transportModeSection-errors">
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.10.3.2"]'> 
        <!-- Verify that the template id is used on the appropriate type of object --> 
        <assert test='../cda:section'> 
            [transportModeSection] Transport Mode ne peut être utilisé qu'en tant que section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "11459-5"]'> 
            [transportModeSection] Le code de la section Transport Mode doit être 11459-5 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [transportModeSection] Le code de la section doit être tiré de la terminologie LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.10.4.1"]'> 
            <!-- Verify that all required data elements are present -->
            [transportModeSection] La section Transport Mode Section doit contenir des entrées 
            du type Transport Entry (1.3.6.1.4.1.19376.1.5.3.1.1.10.4.1).
            
        </assert> 
    </rule> 
</pattern>

