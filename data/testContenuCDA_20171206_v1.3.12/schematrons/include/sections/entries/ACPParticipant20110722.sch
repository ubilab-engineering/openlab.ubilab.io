<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    ACPParticipant.sch :
    Contenu :
        Contrôle d'un élément participant d'une entry d'un CR d'examens biologiques  ou d'un CR-ACP
    Paramètres d'appel :
        Néant
    Historique :
        22/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="ACPParticipant">
    <p>Contrôle d'un participant dans une entry d'un CR biologique ou d'un CR-ACP</p>
    <rule context="cda:participant[./cda:templateId/@root = $templatePartACP]">
        <assert test="@typeCode = 'RESP' or @typeCode = 'DEV' or @typeCode = 'AUTHEN' or @typeCode = 'ENT'"> 
            Erreur de conformité CR-ACP :
            Un participant dans une entry (avec templateId <value-of select="$templatePartACP"/>)
            est soit un valideur (AUTHEN), soit le responsable (RESP), 
            soit un dispositif automatique (DEV), soit un transcripteur (ENT).
            L'attribut participant@typeCode doit avoir l'une de ces 4 valeurs. </assert>
        <assert test="./cda:time"> 
            Erreur de conformité CR-ACP :
            Un participant dans une entry (avec templateId <value-of select="$templatePartACP"/>)
            doit dater l'intervalle de sa participation, à l'aide d'un élément time. </assert>
    </rule>
</pattern>
