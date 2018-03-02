<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ healthStatusObservation20160809.sch ]O@%#o>>=-
    
    Teste la conformité de la section " IHE PCC health Status Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.1.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    09/08/16 : NMA : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="healthStatusObservation-errors">
    <title>IHE PCC health Status Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.1.2)</title>
    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.1.2&quot;]">
        
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.51"]'>
            [healthStatusObservation] Le templateId parent (2.16.840.1.113883.10.20.1.51) doit être présent.
        </assert>
        
    </rule>
    
    
</pattern>
