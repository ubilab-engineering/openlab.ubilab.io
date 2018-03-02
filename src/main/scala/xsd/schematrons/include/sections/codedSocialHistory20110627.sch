<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedSocialHistory.sch ]O@%#o>>=-

Teste la conformité de la section "Coded Social History" (1.3.6.1.4.1.19376.1.5.3.1.3.16.1)
aux spécifications d'IHE PCC v3.0
Vérification que les entrées sont du type Social History Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13.4)

Historique :
24/06/11 : CRI : Création

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedSocialHistory-errors">
   
    <title>IHE PCC v3.0 Coded Social History Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'> 
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [codedSocialHistory] le templateId de 'Coded Social History' ne peut être utilisé que pour une section.
        </assert> 
        <!-- Vérifier que le templateId parent est bien présent. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.3.16"]'> 
            [codedSocialHistory] L'OID du template parent de la section 'Coded Social History' est absent. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "29762-2"]'> 
            [codedSocialHistory] Le code de la section 'Coded Social History' doit être 29762-2
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [codedSocialHistory] L'attribut 'codeSystem' de la section 'Coded Social History' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]'> 
            <!-- vérifier que les entrées sont bien du type Social History Observation -->
            [codedSocialHistory] La section "Coded Social History"  doit contenir des éléments d'entrée "Social History Observation".
        </assert> 
    </rule>
</pattern>

