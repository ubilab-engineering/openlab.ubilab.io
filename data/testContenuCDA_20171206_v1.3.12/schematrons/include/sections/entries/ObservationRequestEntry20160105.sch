<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ ObservationRequestEntry.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "Observation Request Entry" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    06/01/16 : HGH : Création
   
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="ObservationRequestEntry-errors">


    <title>IHE PCC v3.0 Observation Request</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1']">
        
        <assert test="@classCode='OBS'"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Observation Request", l'attribut "classCode" sera fixé à la valeur "OBS". </assert>
        
        <assert test="@moodCode = 'INT' or @moodCode = 'PRP' or @moodCode = 'GOL'"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Observation Request", l'élément "moodCode" 
            sera fixé à la valeur "INT" s'il s'agit d'une observation qui fait partie d'un plan de soins à accomplir,
            et il sera fixé à la valeur "PRP" quand l'observation est une proposition faite sur la base d'éléments
            cliniques.
            Dans le cas où l'observation est le but du plan de soins, l'élément "moodCode" sera fixé à la valeur "GOL".
        </assert>
        
        <assert test="cda:id"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Observation Request", l'élément "id" est obligatoire. </assert>
        
        <assert test="cda:text"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Observation Request", l'élément "text" contiendra
            une référence à la partie narrative décrivant les circonstances du transfert. </assert>
        
        <assert test='cda:statusCode[@code="active"] or 
            cda:statusCode[@code="suspended"] or
            cda:statusCode[@code="aborted"] or
            cda:statusCode[@code="completed"] or
            cda:statusCode[@code="cancelled"] or
            cda:statusCode[@code="normal"] or
            cda:statusCode[@code="new"] or
            cda:statusCode[@code="held"]'>
            [Observation Request] L'élément "statusCode" associé à tout élément "observation request" doit prendre l'une des valeurs suivantes: 
            "active", "suspended", "aborted" ou "completed" ou "cancelled" ou "normal" ou "new" ou "held".</assert>
        
        <assert test="cda:effectiveTime" > 
            Erreur de Conformité PCC: 
            Dans une entrée "Observation Request", l'élément "effectiveTime" est obligatoire. </assert>
        
        <assert test="cda:value"> 
            Erreur de Conformité PCC: 
            Dans une entrée "Observation Request", l'élément "value" est obligatoire. </assert>
        
    </rule>
</pattern>
