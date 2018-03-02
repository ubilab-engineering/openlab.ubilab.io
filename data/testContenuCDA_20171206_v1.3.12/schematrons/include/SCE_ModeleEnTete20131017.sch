<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ SCE_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA d'une Synthèse Suites de Couches Enfant (SCE)
    
    Historique :
    25/07/11 : CRI : Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SCE_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle SCE</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.5']"> 
            [SCE_ModeleEnTete] Le template "Synthèse Suites de Couches Enfant (SNE)" (1.2.250.1.213.1.1.1.12.5) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='15508-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [SCE_ModeleEnTete] L'élément code doit avoir @code ="15508-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>
