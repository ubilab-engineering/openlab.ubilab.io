<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ RankinScoreSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "ASIP Glasgow Score Section" (1.2.250.1.213.1.1.2.40)
    

    
    Historique :
    06/05/15 : JDU : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="GlasgowScoreSection-errors">
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.40"]'>
        <!-- Verifier que le templateId n'est utilisé que pour une section -->
        <assert test='../cda:section'> 
            [GlasgowScoreSection] "ASIP Glasgow Score Section" ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="35088-4"]'> 
            [GlasgowScoreSection] Le code de la section "ASIP Glasgow Score Section" doit être 35088-4
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [GlasgowScoreSection] L'attribut 'codeSystem' de la section "Glasgow Score" doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
    </rule>
    
</pattern>




