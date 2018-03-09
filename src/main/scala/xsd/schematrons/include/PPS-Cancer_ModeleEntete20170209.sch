<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[PPS Cancer Modele Entete]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA du PPS-Cancer
    
    Historique :
    09/02/2017 : LBE : Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="PPS-Cancer_ModeleEntete">
    <p>Conformité de l'en-tête CDA au modèle PPS Cancer</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.20']"> 
            [PPS-Cancer_ModeleEntete] Le template "Conformité au PPS-Cancer" (1.2.250.1.213.1.1.1.20) doit être présent.
        </assert>
        <assert test="./cda:code[@code='18776-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [PPS-Cancer_ModeleEntete] L'élément code doit avoir @code ="18776-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
       
    </rule>
</pattern>