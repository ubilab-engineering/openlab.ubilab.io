<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  Section: 1.2.250.1.213.1.1.2.29 -->

<!--                  -=<<o#%@O[ pathAntAllFdR.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Pathologie, antécédents, allergies et facteurs de risques" (1.2.250.1.213.1.1.2.29)
    aux spécifications du volet VSM du CI-SIS de l'ASIP Santé sur le contenu de la section (sous-sections "Pathologie, antécédents, allergies" et "Facteurs de risques") .    
   Pas d'entrée.

    
    Historique :
    30/05/12 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="pathAntAllFdR-errors">
    <title>CI-SIS Section Pathologie, antécédents, allergies et facteurs de risques</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.29"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [pathAntAllFDR] : Ce template ne peut être utilisé que pour une section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "46612-8"]'> 
            [pathAntAllFDR] : Le code de la section 'Pathologie, antécédents, allergies et facteurs de risques' doit être 46612-8
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [pathAntAllFDR] : L'élément 'codeSystem' de la section 'Pathologie, antécédents, allergies et facteurs de risques' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <!-- Présence obligatoire de la sous-section Pathologie, antécédents, allergies -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.30"]'>
            [pathAntAllFDR] : Cette section 'Pathologie, antécédents, allergies et facteurs de risques' ne contient pas 
            de sous-section 'Pathologie, antécédents, allergies'.
        </assert> 
        <!-- Présence obligatoire de la sous-section Facteurs de risques -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.31"]'>
            [pathAntAllFDR] : Cette section 'Pathologie, antécédents, allergies et facteurs de risques' ne contient pas de sous-section 'Facteurs de risques'.
        </assert>         
    </rule>
    
</pattern>