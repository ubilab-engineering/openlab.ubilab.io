<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ AUNV_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA d'une AUNV
    
    Historique :
    29/10/2013 : CRI : Création AUNV_ModeleEnTete20131029.sch
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AUNV_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle AUNV</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.15']"> 
            [AUNV_ModeleEnTete] Le template parent "Admission en UNV (AUNV)" (1.2.250.1.213.1.1.1.15) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [AUNV_ModeleEnTete] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>
