<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ problemConcernEntry.sch ]O@%#o>>=-
    
    Teste la conformité de l'élément "Problem Concern Entry" (1.3.6.1.4.1.19376.1.5.3.1.4.5.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    24/06/11 : CRI : Création
    07/11/16 : NMA : Ajout de contraintes
    
-->



<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="problemConcernEntry-errors">
    <title>IHE PCC v3.0 Problem Concern Entry - errors validation phase</title>
    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&quot;]">

        <assert test="cda:templateId[@root = &quot;1.3.6.1.4.1.19376.1.5.3.1.4.5.1&quot;]"> 
            [problemConcernEntry] Problem Concern Entry a un template OID 1.3.6.1.4.1.19376.1.5.3.1.4.5.2. 
            Elle spécialise Concern Entry et doit donc se conformer à ses spécifications 
            en déclarant son template OID qui est 1.3.6.1.4.1.19376.1.5.3.1.4.5.1. Ces éléments 
            sont requis.
        </assert>
        
        <assert test="cda:templateId[@root = &quot;2.16.840.1.113883.10.20.1.27&quot;]"> 
            [problemConcernEntry] Le template parent de Problem Concern est absent.
        </assert>
<!-- 
        <assert
            test="(cda:entryRelationship[@typeCode = &quot;SUBJ&quot;] and
                cda:entryRelationship//cda:templateId[@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.5&quot;] and
                cda:entryRelationship[@inversionInd=&quot;false&quot;])"> 
            [problemConcernEntry] Problem Concern Entry contiendra une ou plusieurs entrées qui se conformeront 
            au template Problem Entry (1.3.6.1.4.1.19376.1.5.3.1.4.5) et qui se matérialiseront sous 
            la forme d'éléments 'entryRelationship'. L'attribut 'typeCode' prend la valeur 'SUBJ'
            et l'attribut 'inversionInd' prend la valeur 'false'. 
        </assert> -->
        
        
        <!-- Ajouts de contraites par NMA -->
        
        <assert test='../cda:act[@classCode="ACT"] and ../cda:act[@moodCode="EVN"]'>
            [problemConcernEntry] une entrée "Concern Entry" est l'acte ("act classCode='ACT'") qui consiste 
            à enregistrer un événement (moodCode='EVN') relatif à un problème, une allergie ou tout autre élément se rapportant
            à l'état clinique d'un patient.
        </assert>

        <assert test='cda:id'>
            [problemConcernEntry] L'entrée "Problem Concern Entry" requiert un élément "id".</assert>
        
        <assert test='cda:statusCode[@code="active" or 
            @code="suspended" or
            @code="aborted" or
            @code="completed"]'>
            [problemConcernEntry] L'élément "statusCode" associé à tout élément concern doit prendre l'une des valeurs suivantes: 
            "active", "suspended", "aborted" ou "completed".</assert>
        
        <assert test='(cda:effectiveTime[@nullFlavor])or(cda:effectiveTime/cda:low)'>
            [problemConcernEntry] l'élément "effectiveTime" indique le début et la fin de la période durant laquelle l'élément "Concern Entry" était actif. 
            Son composant "low" ou un élément nullFlavor sera au moins présent.</assert>
       
        <assert test='(cda:entryRelationship[@typeCode="SUBJ"] and cda:entryRelationship/*/cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.5"])'>
            [concernEntry] Tout élément "Problem Concern Entry" concerne un ou plusieurs problèmes ou allergies. 
            Cette entrée contient une ou plusieurs entrées qui se conforment aux spécifications de "Problem Entry" ou "Allergies and Intolerance Entry" 
            permettant à une série d'observations d'être regroupées en un unique élément "Concern Entry", ce à partir de liens de type entryRelationship 
            d'attribut typeCode='SUBJ' et inversionInd='false'</assert>
        
        
    </rule>
</pattern>
