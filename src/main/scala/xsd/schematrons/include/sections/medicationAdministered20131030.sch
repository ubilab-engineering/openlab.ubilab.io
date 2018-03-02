<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ medicationAdministered20131030.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Medications Administered Section" (1.3.6.1.4.1.19376.1.5.3.1.3.21)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    30/10/2013 : CRI : Création  medicationAdministered20131030.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="admissionMedicationHistory-errors">
    <rule context='*[cda:templateId/@root = "1.3.6.1.4.1.19376.1.5.3.1.3.21"]'>
        <!-- Verify that the template id is used on the appropriate type of object -->
        <assert test="../cda:section"> [medicationAdministered] Ce composant ne peut être utilisé
            qu'en tant que section. </assert>
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code = "18610-6"]'> [medicationAdministered] Le code de la section
            doit être 18610-6 </assert>
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> [medicationAdministered] Le
            code de la section doit être tiré de la terminologie LOINC (2.16.840.1.113883.6.1). </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7"]'>
            <!-- Verify that all required data elements are present --> [medicationAdministered] La
            section doit contenir des entrées du type Medications Entry
            (1.3.6.1.4.1.19376.1.5.3.1.4.7). </assert>
    </rule>
</pattern>
