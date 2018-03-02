<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedVitalSignsOrg.sch ]O@%#o>>=-
    
    Teste la conformité de l'élément "Vital Signs Organizer" (1.3.6.1.4.1.19376.1.5.3.1.4.13.1)
    aux spécifications d'IHE PCC v3.0
    Teste la présence d'un élément Vital Sign Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13.2) comme 
    unique type d'entrée de l'organizer
    
    Historique :
    27/06/11 : CRI : Création
    06/03/12 : CRI : Supression des références à SNOMED CT
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedVitalSignsOrg-errors">
    <title>IHE PCC v3.0 Vital Signs Organizer</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.1"]'>
        <assert test='../cda:organizer'> 
            Erreur de Conformité PCC: 'Coded physical Exam' ne peut être utilisé que comme section.
        </assert> 
        <!-- vérifier le codage correct de l'organizer -->
        <assert test='cda:code[@code ="F-03400"]'>
            Erreur de Conformité PCC: Le codage de l'élément 'Vital Signs Organizer' doit être 'F-03400'.           
        </assert>
        <!-- vérifier le codage correct de l'organizer (SNOMED 3.5) -->
        <assert test='cda:code[@codeSystem ="1.2.250.1.213.2.12"]'> 
            Erreur de Conformité PCC: L'attribut 'codeSystem' de l'élément 'Vital Signs Organizer' a pour valeur '1.2.250.1.213.2.12' (SNOMED 3.5)           
        </assert>
        <!-- Verifier que le templateId parent de l'organizer est présent. --> 
        <assert test='cda:templateId[@root = "2.16.840.1.113883.10.20.1.32"]'> 
            Erreur de Conformité PCC: L'identifiant du template parent (2.16.840.1.113883.10.20.1.32) doit être présent. 
        </assert>
        <!-- Verifier que le templateId parent de l'organizer est présent. --> 
        <assert test='cda:templateId[@root = "2.16.840.1.113883.10.20.1.35"]'> 
            Erreur de Conformité PCC: L'identifiant du template parent (2.16.840.1.113883.10.20.1.35) doit être présent. 
        </assert>        
        <!-- Verifier que l'organizer contient un élément de type Vital Sign Observation -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13.2"]'> 
            Erreur de Conformité PCC: L'élément 'Vital Sign Organizer' doit au moins contenir une entrée 'Vital Sign Observation'
        </assert> 

    </rule>
    

</pattern>
