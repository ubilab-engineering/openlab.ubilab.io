<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ transfusionHistory20130821.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Transfusion History" (1.3.6.1.4.1.19376.1.5.3.1.1.9.12)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="transfusionHistory-errors">
    <title>IHE PCC v3.0 Transfusion History Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.12"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [transfusionHistory (Section)]: Allergies and Intolerance ne peut être utilisé que dans une section. 
        </assert> 
               <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "56836-0"]'> 
            [transfusionHistory (Section)]: Le code de la section Transfusion History doit être 56836-0 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [transfusionHistory (Section)]: L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
    </rule> 
</pattern>

