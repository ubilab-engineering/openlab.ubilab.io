<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedFamilyMedicalHistory.sch ]O@%#o>>=-

Teste la conformité de la section "Coded Family Medical History" (1.3.6.1.4.1.19376.1.5.3.1.3.15)
aux spécifications d'IHE PCC v3.0

Historique :
24/06/11 : CRI : Création

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedFamilyMedicalHistory-errors">
   
    <title>IHE PCC v3.0 Coded Social History Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.15"]'> 
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            [codedFamilyMedicalHistory]: le templateId de 'Coded Family Medical History' 
            ne peut être utilisé que pour une section.
        </assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10157-6"]'> 
            [codedFamilyMedicalHistory] : Le code de la section 'Coded Family Medical History' doit être 10157-6
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
           [codedFamilyMedicalHistory] : L'attribut 'codeSystem' de la section 'Coded Family Medical History' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>  
        <!-- Vérifier que le templateId parent est présent. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.3.14"]'> 
            [codedFamilyMedicalHistory] : Le template parent de Coded Family Medical History n'est pas présent. 
        </assert> 
        <!-- Vérifier que l'entrée organizer est présente -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.15"]'>
            [codedFamilyMedicalHistory] : La section Coded Family Medical History 
            doit contenir au moins une entrée Family History Organizer.
        </assert>
        <!-- Vérifier que le template parent de l'entrée organizer est présent -->
        <assert test='not(.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.15"]) or 
            (.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.15"] and .//cda:templateId[@root = "2.16.840.1.113883.10.20.1.23"])'>
            [codedFamilyMedicalHistory] : Le template parent de l'entrée Family History Organizer doit être présent.
        </assert>
    </rule>
</pattern>
