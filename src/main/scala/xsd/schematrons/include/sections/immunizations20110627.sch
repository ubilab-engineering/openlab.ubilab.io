<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ immunizations.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Immunizations Section" (1.3.6.1.4.1.19376.1.5.3.1.3.23)
    aux spécifications d'IHE PCC v3.0
    - Verifie que les entrées sont de type Immunization
    Historique :
    24/06/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="immunizations-errors">
    <title>IHE PCC v3.0 Immunizations Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.23"]'> 
        <!-- Verifier que le templateId n'est utilisé que pour une section --> 
        <assert test='../cda:section'> 
            Erreur de Conformité PCC: Immunizations ne peut être utilisé que comme section.
        </assert> 
        <!-- Vérifier que l'OID parent est présent --> 
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.6"]'> 
            Erreur de Conformité PCC: L'OID de l'élément parent n'est pas présent.
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "11369-6"]'> 
            Erreur de Conformité PCC: Le code de la section doit être 11369-6 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur de Conformité PCC: L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <!-- Verifier que les entrées sont de type Immunization -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.12"]'> 
            Erreur de Conformité PCC: Une section Immunizations doit contenir au moins une entrée Immunization.           
        </assert> 
    </rule>         
</pattern>

