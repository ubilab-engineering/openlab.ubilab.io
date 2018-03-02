<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ RankinScoreSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "ASIP Rankin Score Section" (1.2.250.1.213.1.1.2.39)
    

    
    Historique :
    06/05/15 : JDS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="RankinScoreSection-errors">
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.39"]'>
        <!-- Verifier que le templateId n'est utilisé que pour une section -->
        <assert test='../cda:section'> 
            [RankinScoreSection] "ASIP Rankin Score Section" ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="AVC-181"]'> 
            [RankinScoreSection] Le code de la section "ASIP Rankin Score Section" doit être AVC-181
        </assert> 
        <assert test='cda:code[@codeSystem = "1.2.250.1.213.1.1.4.321"]'> 
            [RankinScoreSection] L'attribut 'codeSystem' de la section "Rankin Score" doit être codé dans la nomenclature TA_AVC de l'ASIP 
            (1.2.250.1.213.1.1.4.321). 
        </assert>
        
    </rule>
    
</pattern>




