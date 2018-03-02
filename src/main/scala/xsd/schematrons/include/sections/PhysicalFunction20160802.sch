<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ physical function.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Physical function" (1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    02/08/16 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="PhysicalFunctionSection-errors">
    <title>IHE PCC v3.0 Physical function Section</title>
    
    
    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5&quot;]">  
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            [PhysicalFunctionSection] : 'Physical Function' ne peut être utilisé que comme section.</assert>
         
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;46006-3&quot;]"> 
            [PhysicalFunctionSection] : Le code de la section 'Physical Function' doit être '46006-3'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [PhysicalFunctionSection] : L'élément 'codeSystem' de la section 
            'PhysicalFunction' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
        
        
    </rule>
    
    
</pattern>