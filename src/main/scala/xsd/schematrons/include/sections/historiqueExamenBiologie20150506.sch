<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ historiqueExamenBiologie.sch ]O@%#o>>=-
    
    Teste la conformité de la section "ASIP Section Historique des Examens de Biologie" (1.2.250.1.213.1.1.2.28)
    
    Historique :
    06/05/15 : JDS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="historiqueExamenBiologieSection-errors">
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.28"]'>
        <!-- Verifier que le templateId n'est utilisé que pour une section -->
        <assert test='../cda:section'> 
            [historiqueExamensBiologieSection] "ASIP Section Historique des Examens de Biologie" ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="26436-6"]'> 
            [historiqueExamensBiologieSection] Le code de la section "ASIP Section Historique des Examens de Biologie" doit être '26436-6'
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [historiqueExamensBiologieSection] L'attribut 'codeSystem' de la section "ASIP Section Historique des Examens de Biologie" doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
    </rule>
    
</pattern>




