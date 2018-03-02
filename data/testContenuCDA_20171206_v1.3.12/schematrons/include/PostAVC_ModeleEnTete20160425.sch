<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ PostAVC_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA d'une PostAVC
    
    Historique :
    25/04/2016 : HGH : Création PostAVC_ModeleEnTete20160425.sch
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="PostAVC_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle PostAVC</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.25']"> 
            [PostAVC_ModeleEnTete] Le template parent "Evaluation Pluri Professionnelle Post AVC (PostAVC)" (1.2.250.1.213.1.1.1.25) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [PostAVC_ModeleEnTete] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>
