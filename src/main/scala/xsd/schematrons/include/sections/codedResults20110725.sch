<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedResults.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Coded Results" (1.3.6.1.4.1.19376.1.5.3.1.3.28)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedResults-errors">

    <title>IHE PCC Coded Results Section</title>
    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.3.28&quot;]">
        <!-- Verifier que le templateId est utilisé correctement --> 
        <assert test="../cda:section"> 
            [codedResults] 'Coded Results' ne peut être utilisé que comme section.</assert>
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = '30954-2']"> 
            [codedResults] Le code de la section 'Coded Results' doit être '30954-2'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            [codedResults] L'élément 'codeSystem' de la section 
            'Coded Results' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1).</assert>
    </rule>
</pattern>
