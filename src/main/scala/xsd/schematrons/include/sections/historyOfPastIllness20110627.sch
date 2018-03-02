<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ historyOfPastIllness.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "History of Past Illness" (1.3.6.1.4.1.19376.1.5.3.1.3.8)
    aux spécifications d'IHE PCC v3.0
    - Vérifie que les entrées sont de type Problem Concern Entry
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="historyOfPastIllness-errors">
    <title>IHE PCC v3.0 History of Past Illness Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.8"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [historyOfPastIllness] History of Past Illness ne peut être utilisé que dans une section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "11348-0"]'> 
            [historyOfPastIllness] Le code de la section History of Past Illness doit être 11348-0 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [historyOfPastIllness] L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.2"]'> 
            <!-- Vérifie que les entrées sont de type Problem Concern Entry -->
            [historyOfPastIllness] History of Past Illness doit contenir des éléments Problem Concern Entry.
        </assert> 
    </rule> 
</pattern>

