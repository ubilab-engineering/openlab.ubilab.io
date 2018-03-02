<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ BilanCancerologie.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Bilan cancérologie Section" (1.2.250.1.213.1.1.2.59)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    24/03/17 : NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BilanCancerologie-errors">
    
    
    <title>IHE PCC v3.0 Bilan cancérologie Section</title>
    
    <rule context="*[cda:templateId/@root=&quot;1.2.250.1.213.1.1.2.59&quot;]">
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            [BilanCancerologieSection] : 'Bilan cancérologie' ne peut être utilisé que comme section.</assert>
     
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;72135-7&quot;]"> 
            [BilanCancerologieSection] : Le code de la section 'Bilan cancérologie' doit être '72135-7'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [BilanCancerologieSection] : L'élément 'codeSystem' de la section 
            'Bilan cancérologie' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
         
        
    </rule>
</pattern>
