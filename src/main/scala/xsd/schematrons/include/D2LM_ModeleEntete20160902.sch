<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ D2LM_ModeleEntete20160902.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA de la D2LM
    
    Historique :
    09/08/2016 : NMA : Création D2LM_ModeleEntete20160902.sch
    03/11/17 : NMA : Mise à jour du code
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="D2LM_ModeleEntete">
    <p>Conformité de l'en-tête CDA au modèle D2LM</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.13']"> 
            [D2LM_ModeleEntete] Le template "Conformité à la D2LM (Dématérialisation de la seconde Lecture de Mammographie)" (1.2.250.1.213.1.1.1.13) doit être présent.
        </assert>
        <assert test="./cda:code[@code='18748-4' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [D2LM_ModeleEntete] L'élément code doit avoir @code ="18748-4" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
       
    </rule>
</pattern>