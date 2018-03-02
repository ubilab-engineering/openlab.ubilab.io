<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  Section: 1.3.6.1.4.1.19376.1.5.3.1.3.27 -->

<!--                  -=<<o#%@O[ results.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Results" (1.3.6.1.4.1.19376.1.5.3.1.3.27)
    aux spécifications du volet VSM du CI-SIS de l'ASIP Santé.    
   Pas d'entrée.

    
    Historique :
    30/05/12 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="results-errors">
    <title>CI-SIS Section Results</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.27"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [results] Ce template ne peut être utilisé que pour une section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "30954-2"]'> 
            [results] Le code de la section 'results' doit être 30954-2
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [results] L'élément 'codeSystem' de la section 'Results' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
    </rule>
    
</pattern>