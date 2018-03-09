<?xml version="1.0" encoding="UTF-8"?>
<!--                  ### advanceDirectiveObservation20150701.sch ###
    
    Teste la conformité de l'entrée 'Advance Directive Observation Entry' (1.3.6.1.4.1.19376.1.5.3.1.4.13.7)
    aux spécifications d'IHE PCC
    
    Historique :
    01/07/15 : TDA : Création
    
-->

<pattern  xmlns="http://purl.oclc.org/dsdl/schematron" id='advanceDirectiveObservation-errors'> 
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"]'> 
        <!-- Verify that the template id is used on the appropriate type of object --> 
        <assert test='../cda:observation'> 
            [codedAdvanceDirectives]: cette entrée est obligatoirement une observation. 
        </assert> 
        <!-- Verify that the parent templateId is also present. --> 
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.17"]'> 
            Error: The parent template identifier for Advance Directives is not present. 
        </assert> 
    </rule> 
</pattern>
