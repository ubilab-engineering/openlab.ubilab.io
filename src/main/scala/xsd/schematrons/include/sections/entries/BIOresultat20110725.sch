<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOresultat.sch :
    Contenu :
        Contrôle d'un résultat dans une entry d'un CR d'examens biologiques
    Paramètres d'appel :
        Néant
    Historique :
        25/07/11 : FMY ASIP/PRAS : Création
        07/11/17 : NMA : Suppression du test qui rendait obligatoire le codege en terminologie LOINC
        
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOresultat">
    <p>Contrôle d'un résultat biologique dans une entry d'un CR d'examens biologiques</p>
    <rule context="cda:observation[./cda:templateId/@root = $templateResultat]">
        <assert test="@moodCode = 'EVN'"> 
            Erreur de conformité CR-BIO :
            Un résultat dans une entry (avec templateId <value-of select="$templateResultat"/>)
            doit avoir un @moodCode 'EVN'. </assert>
       <!-- <assert test="./cda:code[@codeSystem = $OIDLOINC and @code and @displayName]"> 
            Erreur de conformité CR-BIO :
            Un résultat doit avoir un code d'observation issue de la nomenclature LOINC. </assert>-->
        <assert test="./cda:statusCode[@code = 'completed'] or ./cda:statusCode[@code = 'aborted']"> 
            Erreur de conformité CR-BIO :
            Un résultat doit avoir un statusCode@code valant 'completed' ou 'aborted'. </assert>
        <assert test="./cda:entryRelationship[@typeCode = 'REFR']/cda:observation/cda:effectiveTime or
                      not(./cda:entryRelationship[@typeCode = 'REFR'])"> 
            Erreur de conformité CR-BIO :
            L'antériorité d'un résultat doit obligatoirement être horodatée avec un élément effectiveTime. </assert>
        <assert test="./cda:entryRelationship[@typeCode = 'REFR']/cda:observation/cda:statusCode[@code = 'completed'] or
            not(./cda:entryRelationship[@typeCode = 'REFR'])"> 
            Erreur de conformité CR-BIO :
            L'antériorité d'un résultat est obligatoirement au statusCode 'completed'. </assert>
        <assert test="./cda:referenceRange/cda:observationRange/cda:value or not(./cda:referenceRange)"> 
            Erreur de conformité CR-BIO :
            L'intervalle de référence d'un résultat doit comporter un élément 'value' précisant la ou les bornes de l'intervalle. </assert>
    </rule>
</pattern>
