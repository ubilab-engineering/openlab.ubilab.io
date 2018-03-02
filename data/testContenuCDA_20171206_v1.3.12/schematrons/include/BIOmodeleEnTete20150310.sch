<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOmodeleEnTete.sch :
    Contenu :
        Règles de contrôle de l'en-tête CDA  d'un compte rendu d'examens biologiques
    Paramètres d'appel :
        Néant
    Historique :
    21/07/11 : FMY ASIP/PRAS : Création
    10/03/15 : JDS Ajout de la vérification de la présence de l'attribut nullFlavor pour l'élément versionNumber
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOmodeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle de CR d'examens biologiques</p>
    <rule context="cda:ClinicalDocument">
        <assert test="./cda:templateId[@root=$templateCRBiologie]"> 
            Erreur de conformité CR-BIO :
            L'élément ClinicalDocument/templateId doit être présent 
            avec @root = "<value-of select="$templateCRBiologie"/>".</assert>
        <assert test="./cda:code[@code=$typeCodeCRBio and @codeSystem=$OIDLOINC]"> 
            Erreur de conformité CR-BIO : 
            L'élément code doit avoir @code = <value-of select="$typeCodeCRBio"/> et @codeSystem = <value-of select="$OIDLOINC"/>. </assert>
        <assert
            test="./cda:versionNumber[@value] and number(./cda:versionNumber/@value) &gt; 0">
            Erreur de conformité CR-BIO : 
            L'élément "versionNumber" doit être présent dans l'en-tête, avec un attribut @value contenant un entier positif. </assert>
        <assert
            test="not(./cda:versionNumber[@nullFlavor])">
            Erreur de conformité CR-BIO : 
            L'attribut nullFlavor est interdit pour l'élément "versionNumber". </assert>
    </rule>
</pattern>
