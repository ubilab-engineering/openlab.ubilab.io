<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ concernEntry.sch ]O@%#o>>=-
    
    Teste les entrées de la section PCC Concern Entry (1.3.6.1.4.1.19376.1.5.3.1.4.5.1)
    
    25/07/11 : CRI : Création
    11/03/15 : JDS : Correction message affiché (erreur de frappe)
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="concernEntry-errors">
    <title>IHE PCC v3.0 Concern Entry</title>
        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.5.1"]'>
            <assert test='../cda:act'>
                [concernEntry]  L'entrée "Concern Entry" ne peut être utilisée que comme un élément "act".</assert>
            
            <assert test='../cda:act[@classCode="ACT"] and ../cda:act[@moodCode="EVN"]'>
                [concernEntry] une entrée "Concern Entry" est l'acte ("act classCode='ACT'") qui consiste 
                à enregistrer un événement (moodCode='EVN') relatif à un problème, une allergie ou tout autre élément se rapportant
                à l'état clinique d'un patient.</assert>
            
            <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.27"]'>
                [concernEntry] Ces élément templateId indiquent que l'entrée "Concern Entry" se conforme 
                au module de contenu Concern. Celui-ci hérite des contraintes du template HL7 CCD pour les "problem acts", 
                et déclarera sa conformité à patir du templateId 2.16.840.1.113883.10.20.1.27.</assert>
            
            <assert test='cda:id'>
                [concernEntry] L'entrée "Concern Entry" requiert un élément "id".</assert>
            
            <assert test='cda:code[@nullFlavor="NA"]'>
                [concernEntry] l'élément "code" n'est pas applicable à un élément "Concern Entry", et prendra la valeur nullFlavor='NA'.</assert>
            
            <assert test='cda:statusCode[@code="active" or 
                @code="suspended" or
                @code="aborted" or
                @code="completed"]'>
                [concernEntry] L'élément "statusCode" associé à tout élément concern doit prendre l'une des valeurs suivantes: 
                "active", "suspended", "aborted" ou "completed".</assert>
            
            <assert test='(cda:effectiveTime[@nullFlavor])or(cda:effectiveTime/cda:low)'>
                [concernEntry] l'élément "effectiveTime" indique le début et la fin de la période durant laquelle l'élément "Concern Entry" était actif. 
                Son composant "low" ou un élément nullFlavor sera au moins présent.</assert>
            
            <assert test='(cda:effectiveTime[@nullFlavor]) or ((cda:statusCode[@code="completed" or @code="aborted"] and cda:effectiveTime/cda:high) or
                (cda:statusCode[@code="active" or @code="suspended"] and not(cda:effectiveTime/cda:high)))'>
                [concernEntry] l'élément "effectiveTime" indique le début et la fin de la période durant laquelle l'élément 
                "Concern Entry" était actif. 
                Son composant "high" (ou un élément nullFlavor ) sera présent pour les éléments "Concern entry" ayant un statut "completed" ou "aborted" 
                et sera absent dans tous les autres cas</assert>
            
            <assert test='(cda:entryRelationship[@typeCode="SUBJ"] and cda:entryRelationship/*/cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.5" or @root="1.3.6.1.4.1.19376.1.5.3.1.4.6"]) or  
                (cda:sourceOf[@typeCode="SUBJ" and @inversionInd="false"] and cda:sourceOf/*/cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.5" or @root="1.3.6.1.4.1.19376.1.5.3.1.4.6"]) '>
                [concernEntry] Tout élément "Concern Entry" concerne un ou plusieurs problèmes ou allergies. 
                Cette entrée contient une ou plusieurs entrées qui se conforment aux spécifications de "Problem Entry" ou "Allergies and Intolerance Entry" 
                permettant à une série d'observations d'être regroupées en un unique élément "Concern Entry", ce à partir de liens de type entryRelationship 
                d'attribut typeCode='SUBJ' et inversionInd='false'</assert>
        </rule>
    </pattern>