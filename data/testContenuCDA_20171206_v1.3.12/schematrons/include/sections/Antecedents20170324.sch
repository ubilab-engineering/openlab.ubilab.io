<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ Antecedents.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Antecedents Section" (1.2.250.1.213.1.1.2.57)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    24/03/17 : NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Antecedents-errors">
    
    
    <title>IHE PCC v3.0 Antecedents Section</title>
    
    <rule context="*[cda:templateId/@root=&quot;1.2.250.1.213.1.1.2.57&quot;]">
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            [AntecedentsSection] : 'Antecedents' ne peut être utilisé que comme section.</assert>
     
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;11349-8&quot;]"> 
            [AntecedentsSection] : Le code de la section 'Antecedents' doit être '11349-8'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [AntecedentsSection] : L'élément 'codeSystem' de la section 
            'Antecedents' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
         
        
    </rule>
</pattern>
