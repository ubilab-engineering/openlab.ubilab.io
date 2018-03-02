<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  Section: 1.2.250.1.213.1.1.2.31 -->

<!--                  -=<<o#%@O[ FdR.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Facteurs de Risques (1.2.250.1.213.1.1.2.31)
    aux spécifications du volet VSM du CI-SIS de l'ASIP Santé.    
   Pas d'entrée.

    
    Historique :
    30/05/12 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FdR-errors">
    <title>CI-SIS Section Facteurs de Risques</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.31"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [FDR] : Ce template ne peut être utilisé que pour une section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "57207-3"]'> 
            [FDR] : Le code de la section 'Facteurs de Risques' doit être 57207-3
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [FDR] : L'élément 'codeSystem' de la section 'Facteurs de Risques' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
    </rule>
    
</pattern>