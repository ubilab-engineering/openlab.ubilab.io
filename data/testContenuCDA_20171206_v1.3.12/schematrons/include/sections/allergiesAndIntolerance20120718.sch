<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ allergiesAndIntolerance20120718.sch ]O@%#o>>=-
    
    - Teste la conformité de la section "Allergies and Intolerance20120718.sch" (1.3.6.1.4.1.19376.1.5.3.1.3.13)
    aux spécifications d'IHE PCC v3.0
    - Vérifie que les entrées sont de type Procedure
    
    Historique :
    24/06/11 : CRI : Création
    19/03/15 : JDS : Correction d'une erreur sur le message d'erreur 
                    (code de la section Allergies and Intolerance erroné)
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="allergiesAndIntolerance-errors">
    <title>IHE PCC v3.0 Allergy and Intolerance Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.13"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            Erreur [allergiesAndIntolerance (Section)]: Allergies and Intolerance ne peut être utilisé que dans une section. 
        </assert> 
        <!-- Vérifier la présence des templateId parents. -->
        <assert test="cda:templateId[@root=&quot;2.16.840.1.113883.10.20.1.2&quot;]"> 
            Erreur [allergiesAndIntolerance (Section)]: Le templateId parent CCD 3.8 de la section 'Allergies and Intolerance' (2.16.840.1.113883.10.20.1.2) doit être présent</assert>
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "48765-2"]'> 
            Erreur [allergiesAndIntolerance (Section)]: Le code de la section Allergies and Intolerance doit être 48765-2
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [allergiesAndIntolerance (Section)]: L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.3"]'> 
            <!-- Vérifie que les entrées sont de type Problem Concern Entry -->
            Erreur [allergiesAndIntolerance (Section)]: Allergies and Intolerance doit contenir des éléments Allergy Concern Entry.
        </assert> 
    </rule> 
</pattern>

