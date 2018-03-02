<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ intravenousFluidsAdministered.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Intravenous Fluids Administered Section" (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.6)
    aux spécifications d'IHE PCC v3.0

    
    Historique :
    24/06/11 : CRI : Création intravenousFluidsAdministered20131030.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="intravenousFluidsAdministered-errors">
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.6"]'>
        <!-- Verifier que le templateId n'est utilisé que pour une section -->
        <assert test='../cda:section'> 
            [intravenousFluidsAdministered] "Intravenous Fluids Administered" ne peut être utilisé que comme section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="57072-1"]'> 
            [intravenousFluidsAdministered] Le code de la section "Intravenous Fluids Administered" doit être 57072-1
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [intravenousFluidsAdministered] L'attribut 'codeSystem' de la section "Intravenous Fluids Administered" doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>
        
    </rule>
    
</pattern>




