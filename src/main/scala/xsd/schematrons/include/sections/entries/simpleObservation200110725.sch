<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ simpleObservation.sch ]O@%#o>>=-
    
    Teste les entrées de la section PCC Simple Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13)

    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="simpleObservation-errors">
    <title>IHE PCC v3.0 Simple Observation</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']">
        
        <assert test='cda:id'>
            Erreur de Conformité PCC: "Simple Observation" requiert un élément identifiant &lt;id&gt;.</assert>
        
        <assert test='cda:code'>
            Erreur de Conformité PCC: "Simple Observation" requiert un élément "code" décrivant ce qui est observé.</assert>
        
        <assert test='cda:statusCode[@code = "completed"]'>
            Erreur de Conformité PCC: L'élément "statusCode" est requis dans "Simple Observations" 
            sont fixés à la valeur "completed".</assert>
        
        <assert test='cda:effectiveTime[@value or @nullFlavor] or cda:effectiveTime/cda:low[@value or @nullFlavor]'>
            Erreur de Conformité PCC: L'élément &lt;effectiveTime&gt; est requis dans "Simple Observations",
            et représentera la date et l'heure de la mesure effectuée. Cet élément devrait être précis au jour. 
            Si la date et l'heure sont inconnues, l'attribut nullFlavor sera utilisé.</assert>
        
        <assert test='cda:value'>
            Erreur de Conformité PCC: L'élément "value" d'un élément "Simple Observation" utilisera un 
            type de donnée approprié à l'observation.</assert>        
        
    </rule>
    
    
</pattern>

