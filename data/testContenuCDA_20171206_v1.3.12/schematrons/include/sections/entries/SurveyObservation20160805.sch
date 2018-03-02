<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ SurveyObservation.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "Survey Observation Entry" (1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    05/08/16 : HGH : Création
    02/03/17 : NMA : changer la valeur du statuscode de 'active' à 'completed'
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SurveyObservation-errors">
    
    
    <title>IHE PCC v3.0 Survey observation</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6']">
        
        <assert test="@classCode='OBS'"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Survey Observation, l'attribut "classCode" sera fixé à la valeur "OBS". 
        </assert>
        
        <assert test="@moodCode = 'EVN'"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Survey Observation", l'élément "moodCode" 
            sera fixé à la valeur "EVN".
        </assert>
        
        <assert test="cda:id"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Survey Observation", l'élément "id" est obligatoire. 
        </assert>
        
        <assert test="cda:text"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Survey Observation", l'élément "text" est obligatoire . 
        </assert>
        
        <assert test='cda:statusCode[@code="completed"]'>
            [Survey Observation] L'élément "statusCode" associé à tout élément "Survey Observation" doit prendre la valeur suivante: 
            "completed".
        </assert>
        
        <assert test="cda:effectiveTime"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Survey observation", l'élément "effectiveTime" est obligatoire. 
        </assert>
        
        <assert test="cda:value"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Survey Observation", l'élément "value" est obligatoire.
        </assert>
        
    </rule>
</pattern>
