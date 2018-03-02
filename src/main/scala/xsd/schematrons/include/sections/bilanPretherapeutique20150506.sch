<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ bilanPretherapeutique.sch ]O@%#o>>=-
    
    Teste la conformité de la section "ASIP Section Bilan Préthérapeutique" (1.2.250.1.213.1.1.2.42)
    
    Historique :
    06/05/15 : JDS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="bilanPretherapeutiqueSection-errors">
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.42"]'>
        <!-- Verifier que le templateId n'est utilisé que pour une section -->
        <assert test='../cda:section'> 
            [bilanPretherapeutiqueSection] "ASIP Section Bilan Préthérapeutique" ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="AVC-182"]'> 
            [bilanPretherapeutiqueSection] Le code de la section "ASIP Section Bilan Préthérapeutique" doit être 'AVC-182'
        </assert> 
        <assert test='cda:code[@codeSystem = "1.2.250.1.213.1.1.4.321"]'> 
            [bilanPretherapeutiqueSection] L'attribut 'codeSystem' de la section "ASIP Section Bilan Préthérapeutique" doit être codé dans la nomenclature TA_AVC 
            (1.2.250.1.213.1.1.4.321). 
        </assert>
        
    </rule>
    
</pattern>




