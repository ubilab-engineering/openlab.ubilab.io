<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ SDMMR_ModeleEntete20160809.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA du SDMMR
    
    Historique :
    09/08/2016 : NMA : Création SDMMR_ModeleEntete20160809.sch
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SDMMR_ModeleEntete">
    <p>Conformité de l'en-tête CDA au modèle SDMMR</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.13']"> 
            [SDMMR_ModeleEntete] Le template "Conformité à la SDMMR (Set de Données Minimum Maladies Rares)" (1.2.250.1.213.1.1.1.13) doit être présent.
        </assert>
        <assert test="./cda:code[@code='SYNTH' and @codeSystem='1.2.250.1.213.1.1.4.12']"> 
            [SDMMR_ModeleEntete] L'élément code doit avoir @code ="SYNTH" et @codeSystem = "1.2.250.1.213.1.1.4.12"/>. 
        </assert>
    </rule>
</pattern>