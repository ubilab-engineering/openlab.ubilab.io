<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ NIHSSScoreSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "ASIP NIHSS Score Section" (1.2.250.1.213.1.1.2.36)
    aux spécifications d'IHE PCC v3.0

    
    Historique :
    24/06/11 : CRI : Création NIHSSScoreSection20131030.sch
    06/05/15 : JDS : Correction du texte affiché d'une assertion 
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="NIHSSScoreSection-errors">
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.36"]'>
        <!-- Verifier que le templateId n'est utilisé que pour une section -->
        <assert test='../cda:section'> 
            [NIHSSScoreSection] "ASIP NIHSS Score Section" ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="70182-1"]'> 
            [NIHSSScoreSection] Le code de la section "ASIP NIHSS Score Section" doit être 70182-1
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [NIHSSScoreSection] L'attribut 'codeSystem' de la section "NIHSS Score" doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
    </rule>
    
</pattern>




