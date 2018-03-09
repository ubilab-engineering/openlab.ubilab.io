<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ SAP_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA d'une Synthèse antepartum
    
    Historique :
    25/07/11 : CRI : Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SAP_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle SAP</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.1']"> 
            SAP_ModeleEnTete: Le template parent "Volet Synthèse antepartum" (1.2.250.1.213.1.1.1.12.1) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            SAP_ModeleEnTete : 
            L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>
