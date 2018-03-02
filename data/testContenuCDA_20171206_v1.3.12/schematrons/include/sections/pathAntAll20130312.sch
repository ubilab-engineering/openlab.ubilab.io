<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  Section: 1.2.250.1.213.1.1.2.30 -->

<!--                  -=<<o#%@O[ pathAntAll.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Pathologie, antécédents et allergies (1.2.250.1.213.1.1.2.30)
    aux spécifications du volet VSM du CI-SIS de l'ASIP Santé.    
   Pas d'entrée.

    
    Historique :
    30/05/12 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="pathAntAll-errors">
    <title>CI-SIS Section Pathologie, antécédents et allergies</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.30"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [pathAntAll] Erreur de Conformité : Ce template ne peut être utilisé que pour une section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "34117-2"]'> 
            [pathAntAll] Erreur de Conformité : Le code de la section 'Pathologie, antécédents et allergies' doit être 34117-2
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [pathAntAll] Erreur de Conformité : L'élément 'codeSystem' de la section 'Pathologie, antécédents, allergies et facteurs de risques' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
    </rule>
    
</pattern>