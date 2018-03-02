<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ Coded Care Plan.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Coded care plan Section" (1.3.6.1.4.1.19376.1.5.3.1.3.31)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    02/08/16 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CodedCarePlanSection-errors">
    
    
    <title>IHE PCC v3.0 Coded Care Plan Section</title>
    
    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.3.36&quot;]"> <!-- ou 1.3.6.1.4.1.19376.1.5.3.1.3.31-->
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            [CodedCarePlanSection] : 'Coded Care Plan' ne peut être utilisé que comme section.</assert>
        
        <!-- Vérifier la présence des templateId parents. -->
        <assert test="cda:templateId[@root=&quot;2.16.840.1.113883.10.20.1.10&quot;]"> 
            [CodedCarePlanSection] : Le templateId parent de la section 'Coded Care Plan' (2.16.840.1.113883.10.20.1.10) doit être présent</assert>
        
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;18776-5&quot;]"> 
            [CodedCarePlanSection] : Le code de la section 'Coded Care Plan' doit être '18776-5'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [CodedCarePlanSection] : L'élément 'codeSystem' de la section 
            'CodedCarePlan' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
         
        
    </rule>
</pattern>
