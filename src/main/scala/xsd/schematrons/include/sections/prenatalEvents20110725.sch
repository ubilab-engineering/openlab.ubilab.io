<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ prenatalEvents.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Prenatal Events" (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    14/11/16 : NMA : Enlever le test de présence du Coded Results
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="prenatalEvents-errors">
    <title>IHE PCC v3.0 Prenatal Events Section</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.2"]'> 
        <!-- Verifier que le templateId est utilisé correctement -->        
        <assert test='../cda:section'> 
            Erreur de Conformité au volet CSE: 'Prenatal Events' ne peut être utilisé que comme section.
        </assert> 

        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "57073-9"]'> 
            Erreur de Conformité au volet CSE: Le code de la section 'Prenatal Events' doit être '57073-9'
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur de Conformité au volet CSE: L'élément 'codeSystem' de la section 
            'Prenatal Events' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <!-- Sous section Coded Results -->
       <!-- <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.3.28"]'>
            Erreur de Conformité au volet CSE: La section 'Prenatal Events' ne contient pas de sous-section'Coded Results'.
        </assert> 
        -->
        <!-- 
            <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>
            Erreur de Conformité au volet CSE: La section 'Coded Results' ne contient pas de sous-section'Procedures and Interventions'.
            </assert> 
            <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.9"]'>
            Erreur de Conformité au volet CSE: La section 'Coded Results' ne contient pas de sous-section'Event Outcomes'.
            </assert> 
        -->
    </rule>
</pattern>