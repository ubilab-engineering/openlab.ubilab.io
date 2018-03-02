<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ cancerDiagnosis.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Cancer Diagnosis Section" (1.3.6.1.4.1.19376.1.7.3.1.3.14.1)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/08/121 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="cancerDiagnosis-errors">


    <title>IHE PCC v3.0 Cancer Diagnosis Section</title>

    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.3.14.1']">
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            Erreur [cancerDiagnosisSection] : 'Cancer Diagnosis' ne peut être utilisé que comme section.</assert>
        
        <!-- Vérifier la présence des templateId parents. -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.11']"> 
            Erreur [cancerDiagnosisSection] : Le templateId parent de la section 'Active Problems' (2.16.840.1.113883.10.20.1.11) doit être présent</assert>
        
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code ='C-DIAG']"> 
            Erreur [cancerDiagnosisSection] : Le code de la section 'Active Problems' doit être 'C-DIAG'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> 
            Erreur [cancerDiagnosisSection] : L'élément 'codeSystem' de la section 
            'Cancer Diagnosis' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
        <assert test=".//cda:text">
            Erreur [cancerDiagnosisSection] : Une section "Cancer Diagnosis" doit contenir un élément text"</assert>
    </rule>
</pattern>
