<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ familyHistoryObservation.sch ]O@%#o>>=-
    
    Teste la conformité de l'élément "PCC Family History Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.3)
    aux spécifications d'IHE PCC v5.0
    
    Historique :
    23/07/12 : CRI : Création
    
-->


<!-- errors -->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="familyHistoryObservation-errors">
    <title>IHE PCC Family History Observation - errors validation phase</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.3"]'>
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"] and 
            cda:templateId[@root="2.16.840.1.113883.10.20.1.22"]'>
            [familyHistoryObservation] : L'élément "Family History Observations" spécialise "Simple Observation" 
            et hérite ses contraintes de CCD. Il incluera deux template IDs additionnels : 
            1.3.6.1.4.1.19376.1.5.3.1.4.13 et 2.16.840.1.113883.10.20.1.22.
        </assert>

<!-- warning -->

        <assert test='cda:value[@codeSystem="2.16.840.1.113883.6.3"]'>
            [familyHistoryObservation] : La pathologie observée est l'une des valeurs de la classification CIM-10 (2.16.840.1.113883.6.3).
        </assert>
        
    </rule>
    
    
</pattern>