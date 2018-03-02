<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ SNE_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA d'une Synthèse Salle de Naissance Enfant (SNE)
    
    Historique :
    25/07/11 : CRI : Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SNE_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle SNE</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.3']"> 
            [SNE_ModeleEnTete] Le template "Synthèse Salle de Naissance Enfant (SNE)" (1.2.250.1.213.1.1.1.12.2) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='15508-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [SNE_ModeleEnTete] L'élément code doit avoir @code ="15508-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>
