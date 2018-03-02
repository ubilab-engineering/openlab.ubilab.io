<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOsectionN2Struct.sch :
    Contenu :
        Conformité structurelle d'une section de 1er niveau d'un CR d'examens biologiques  
    Paramètres d'appel :
        Néant
    Historique :
    21/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOsectionN2Struct">
    <p>Conformité structurelle d'une section de 2e niveau d'un CR d'examens biologiques</p>
    <rule context="cda:structuredBody/cda:component/cda:section/cda:component/cda:section">
        <assert test="./cda:templateId[@root=$templateSectN2]"> 
            Erreur de conformité CR-BIO :
            une section de 2e niveau d'un CR de biologie doit se conformer au template 
            avec @root = "<value-of select="$templateSectN2"/>". </assert>
        <assert test="./cda:code[@codeSystem = $OIDLOINC] or not(./cda:code/@code)"> Erreur de conformité CR-BIO :
            Le code d'une section de  niveau 2, s'il existe, doit appartenir à la terminologie LOINC. </assert>
        <assert test="./cda:text and count(./cda:entry) = 1">
            Erreur de conformité CR-BIO : 
            Une section de niveau 2 doit comporter exactement 1 élément text et 1 élément entry. </assert>
        <assert test="not(@nullFlavor)">
            Erreur de conformité CR-BIO : 
            Une section de niveau 2 ne doit pas avoir d'attribut nullFlavor. </assert>
    </rule>
</pattern>
