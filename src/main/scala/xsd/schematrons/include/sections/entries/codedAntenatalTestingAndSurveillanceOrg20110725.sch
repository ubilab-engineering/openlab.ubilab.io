<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedAntenatalTestingAndSurveillanceOrg.sch ]O@%#o>>=-
    
    Teste la conformité de l'organizer "Coded Antenatal Testing and Surveillance Organizer" (1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedAntenatalTestingAndSurveillanceOrg-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing and Surveillance Organizer</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10"]'>
        <assert test='../cda:organizer'> 
            Erreur de Conformité PCC: 'Conformité PCC v3.0 (Erreur):' ne peut être utilisé que comme organizer.
        </assert> 
        <!-- vérifier le codage correct de l'organizer -->
        <assert test='cda:code[@code="XX-ANTENATALTESTINGBATTERY" and 
            @displayName="ANTENATAL TESTING AND SURVEILLANCE BATTERY" and
            @codeSystem="2.16.840.1.113883.6.1" and
            @codeSystemName="LOINC"]'>
            [codedAntenatalTestingAndSurveillanceOrg] L'élément &lt;code&gt; de l'organizer "Antenatal Testing and Surveillance"est requis, et 
            identifie celui-ci comme un organizer contenant des données de test et de surveillance: &lt;code code='XX-ANTENATALTESTINGBATTERY'
            displayName='ANTENATAL TESTING AND SURVEILLANCE BATTERY' codeSystem='2.16.840.1.113883.6.1' codeSystemName="LOINC"</assert>
        <!-- Verifier que la batterie comporte au moins un élément. --> 
        
        <assert test='cda:component/cda:observation/cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]'> 
            [codedAntenatalTestingAndSurveillanceOrg] L'élément 'Coded Antenatal Testing and Surveillance Organizer' doit 
            au moins contenir une entrée 'Simple Observation' (1.3.6.1.4.1.19376.1.5.3.1.4.13)
        </assert> 
        

        <assert test='cda:id'>
            [codedAntenatalTestingAndSurveillanceOrg] "Coded Antenatal Testing and Surveillance Organizer" aura nécessairement un identifiant &lt;id&gt;.
        </assert>

        <assert test='cda:statusCode[@code="completed"]'>
            [codedAntenatalTestingAndSurveillanceOrg] La valeur de l'élément "statusCode" de "Coded Antenatal Testing and Surveillance Organizer" est fixée à "completed".
        </assert>
        <assert test='cda:effectiveTime'>
            [codedAntenatalTestingAndSurveillanceOrg] l'élément effectiveTime est requis. Il indique quand l'observation a été faite.
        </assert>

    </rule>
</pattern>

