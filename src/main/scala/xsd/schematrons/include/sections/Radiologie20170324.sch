<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ Radiologie.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Radiologie Section" (1.2.250.1.213.1.1.2.58)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    24/03/17 : NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Radiologie-errors">
    
    
    <title>IHE PCC v3.0 Radiologie Section</title>
    
    <rule context="*[cda:templateId/@root=&quot;1.2.250.1.213.1.1.2.58&quot;]">
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            [RadiologieSection] : 'Radiologie' ne peut être utilisé que comme section.</assert>
     
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;22030-1&quot;]"> 
            [RadiologieSection] : Le code de la section 'Radiologie' doit être '22030-1'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [RadiologieSection] : L'élément 'codeSystem' de la section 
            'Radiologie' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
         
        
    </rule>
</pattern>
