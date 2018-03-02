<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ Identification.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Identification Section" (1.2.250.1.213.1.1.2.56)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    24/03/17 : NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Identification-errors">
    
    
    <title>IHE PCC v3.0 Identification Section</title>
    
    <rule context="*[cda:templateId/@root=&quot;1.2.250.1.213.1.1.2.56&quot;]">
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            [IdentificationSection] : 'Identification' ne peut être utilisé que comme section.</assert>
     
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;45964-4&quot;]"> 
            [IdentificationSection] : Le code de la section 'Identification' doit être '45964-4'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [IdentificationSection] : L'élément 'codeSystem' de la section 
            'Identification' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
         
        
    </rule>
</pattern>
