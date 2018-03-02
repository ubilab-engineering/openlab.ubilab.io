<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ VitalSignsObservation20131024.sch ]O@%#o>>=-
    
    Teste la conformité de l'élément "Vital Signs Observation" 1.3.6.1.4.1.19376.1.5.3.1.4.13.2)
    aux spécifications d'IHE PCC v3.0

    
    Historique :
    24/10/2013 : CRI : Création    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="VitalSignsObservation-errors">
    <title>IHE PCC v3.0 Vital Signs Observation</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.2"]'>

        <!-- Verifier que le templateId parent de l'observation est présent. --> 
        <assert test='cda:templateId[@root = "2.16.840.1.113883.10.20.1.31"]'> 
            [VitalSignsObservation] L'identifiant du template parent (2.16.840.1.113883.10.20.1.31) doit être présent. 
        </assert>
        <!-- Verifier que le templateId parent de l'observation est présent. --> 
        <assert test='cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13"]'> 
            [VitalSignsObservation] L'identifiant du template parent (1.3.6.1.4.1.19376.1.5.3.1.4.13) doit être présent. 
        </assert>
    
        
    </rule>
    

</pattern>
