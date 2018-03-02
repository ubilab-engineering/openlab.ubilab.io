<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ HospitalDischargeMedication20161212.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Hospital Discharge Medication Section" (1.3.6.1.4.1.19376.1.5.3.1.3.22)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    12/12/2016 : NMA : Création  HospitalDischargeMedication20161212.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="hospitalDischargeMedication-errors">
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.22"]'> 
        <!-- Verify that the template id is used on the appropriate type of object --> 
        <assert test='../cda:section'> 
            [HospitalDischargeMedication] Ce composant ne peut être utilisé qu'en tant que section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10183-2"]'> 
            [HospitalDischargeMedication] Le code de la section doit être 10183-2 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [HospitalDischargeMedication] Le code de la section doit être tiré de la terminologie LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7"]'> 
            <!-- Verify that all required data elements are present -->
            [HospitalDischargeMedication] La section doit contenir des entrées 
            du type Medications Entry  (1.3.6.1.4.1.19376.1.5.3.1.4.7).
            
        </assert> 
    </rule> 
</pattern>

