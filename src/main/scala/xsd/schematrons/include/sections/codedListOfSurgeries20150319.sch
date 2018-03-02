<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedListOfSurgeries.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Coded List of Surgeries" (1.3.6.1.4.1.19376.1.5.3.1.3.12)
    aux spécifications d'IHE PCC v3.0
    - Vérifie que les entrées sont de type Procedure
    
    Historique :
    24/06/11 : CRI : Création
    19/03/15 : JDS : Suppression de la contrainte fixée sur l'élément title
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedListOfSurgeries-errors">
    <title>IHE PCC v3.0 History of Past Illness Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.12"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [codedListOfSurgeries] Coded List of Surgeries ne peut être utilisé que dans une section. 
        </assert> 
        <!-- Vérifier la présence des templateId parents. -->
        <assert test="cda:templateId[@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.3.11&quot;]"> 
            [codedListOfSurgeries] Le templateId parent de la section 'Coded List of Surgeries' (1.3.6.1.4.1.19376.1.5.3.1.3.11) doit être présent</assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47519-4"]'> 
            [codedListOfSurgeries] Le code de la section Coded List of Surgeries doit être 47519-4 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [codedListOfSurgeries] L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.19"]'> 
            <!-- Vérifie que les entrées sont de type Problem Concern Entry -->
            [codedListOfSurgeries] Coded List of Surgeries doit contenir des éléments Procedure Entry.
        </assert> 
    </rule> 
</pattern>

