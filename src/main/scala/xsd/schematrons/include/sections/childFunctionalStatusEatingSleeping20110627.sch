<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ childFunctionalStatusEatingSleeping.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Eating and sleeping Assessment" (1.3.6.1.4.1.19376.1.7.3.1.1.13.5)
    aux spécifications d'IHE PCC v3.0
       
    Historique :
    24/06/11 : CRI : Création
    14/11/16 : NMA : Modification du code dans le message d'erreur
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="childFunctionalStatusEatingSleeping-errors">
    <title>IHE PCC v3.0 Eating and sleeping Assessment</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.5"]'> 
        <!-- Verifier que le templateId est utilisé pour une section -->        
        <assert test='../cda:section'> 
            [childFunctionalStatusEatingSleeping] 'Eating and sleeping Assessment' ne peut être utilisé que comme section.
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47420-5"]'> 
            [childFunctionalStatusEatingSleeping] Le code de la section 'Eating and sleeping Assessment' doit être '47420-5'
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [childFunctionalStatusEatingSleeping] L'élément 'codeSystem' de la section 'Eating and sleeping Assessment' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        
    </rule>
</pattern>
