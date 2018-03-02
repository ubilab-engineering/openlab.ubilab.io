<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CodedAntenatalTestingAndSurveillance.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Coded Antenatal Testing and Surveillance" (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5.1)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CodedAntenatalTestingAndSurveillance-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing and Surveillance Section</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5.1"]'> 
        
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test='../cda:section'> 
            [CodedAntenatalTestingAndSurveillance] 'Coded Antenatal Testing and Surveillance' ne peut être utilisé que comme section.
        </assert> 

        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "57078-8"]'> 
            [CodedAntenatalTestingAndSurveillance] Le code de la section 'Prenatal Events' doit être '57078-8'
        </assert> 
        <!-- Vérifier que le système de codification de la section est bien LOINC. -->
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [CodedAntenatalTestingAndSurveillance] L'élément 'codeSystem' de la section 
            'Coded Antenatal Testing and Surveillance Section' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Vérifier que le templateId parent est bien présent. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5"]'> 
            [CodedAntenatalTestingAndSurveillance] L'OID du template parent de la section 'Coded physical Exam' est absent. 
        </assert> 
        
        <!-- Verifier qu'un organizer 'Antenatal Testing and Surveillance' est present -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10"]'>
            [CodedAntenatalTestingAndSurveillance] Une section 'Antenatal Testing and Surveillance' doit contenir un élément 'Antenatal Testing and Surveillance Battery'.
        </assert> 
    </rule>
</pattern>