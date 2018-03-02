<?xml version="1.0" encoding="UTF-8"?>

<!--  IHE PCC v3.0  Section: 1.3.6.1.4.1.19376.1.5.3.1.3.31 -->

<!--                  -=<<o#%@O[ carePlan.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Care Plan" (1.3.6.1.4.1.19376.1.5.3.1.3.31)
    aux spécifications d'IHE PCC v3.0
    Aucune des entrées codées ne sont obligatoires pour cette section qui peut n'être
    que narrative.

    La présence obligatoire d'un type d'entrée doit être exprimée au niveau d'un schematron
    dédié à un volet spécifique (par exemple CSEcarePlan.sch) qui sera appelé et activé
    dans le schematron du projet.
    Les tests pouvant être réalisés sont indiqués ici sous formes de commentaires
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="carePlan-errors">
    <title>IHE PCC v3.0 Care Plan Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.31"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [carePlan] 'Care Plan' ne peut être utilisé que comme section. 
        </assert> 
        <!-- Vérifier que le templateId parent est bien présent. --> 
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.10"]'> 
            [carePlan] L'OID du template parent de la section 'Care Plan' (2.16.840.1.113883.10.20.1.10) est absent. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "18776-5"]'> 
            [carePlan] Le code de la section 'Care Plan' doit être '18776-5' 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [carePlan] L'attribut 'codeSystem' de la section a pour valeur '2.16.840.1.113883.6.1' (LOINC)  
            system (). 
        </assert> 
        <!--
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1"]'>
        Note: Cette section 'Care Plan' ne contient pas d'élément 'Observation Requests Entry'. 
            </assert> 
        -->
        <!--
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7"]'>
        Note: Cette section 'Care Plan' ne contient pas d'élément 'Medication Entry'.
            </assert> 
        -->
        <!--
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.12"]'>
        Note: Cette section 'Care Plan' ne contient pas d'élément 'Immunization Entry'.
            </assert> 
        -->
        <!-- 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.19"]'>
            Erreur de Conformité volet CSE: Cette section 'Care Plan' ne contient pas d'élément 'Procedure Entry'.
        </assert> 
        -->
        <!--  
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.14"]'>
            Erreur de Conformité volet CSE: Cette section 'Care Plan' ne contient pas d'élément 'Encounter Entry'.
        </assert> 
        -->
    </rule>
    
</pattern>