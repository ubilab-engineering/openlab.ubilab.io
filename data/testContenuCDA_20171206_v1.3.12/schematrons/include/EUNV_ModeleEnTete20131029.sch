<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ EUNV_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA d'une EUNV
    
    Historique :
    29/10/2013 : CRI : Création EUNV_ModeleEnTete20131029.sch
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="EUNV_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle EUNV</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.16']"> 
            [EUNV_ModeleEnTete] Le template parent "Suivi en UNV UNV (EUNV)" (1.2.250.1.213.1.1.1.16) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [EUNV_ModeleEnTete] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>
