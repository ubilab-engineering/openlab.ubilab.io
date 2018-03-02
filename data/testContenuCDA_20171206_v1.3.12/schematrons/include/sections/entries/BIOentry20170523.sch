<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOentry.sch :
    Contenu :
        Conformité structurelle d'une entrée résultats d'examens biologiques  
    Paramètres d'appel :
        Néant
    Historique :
    22/07/11 : FMY ASIP/PRAS : Création
    23/05/17 : NMA : Suppression du premier assert
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOentry">
    <p>Conformité structurelle d'une entry d'un CR d'examens biologiques</p>
    <rule context="cda:entry/cda:templateId[@root=$templateEntry]">
       <!-- <assert test="./cda:templateId[@root=$templateEntry]"> 
            Erreur de conformité CR-BIO :
            une entry d'un CR de biologie doit se conformer au template 
            avec @root = "<value-of select="$templateEntry"/>". </assert>-->
        <assert test="../@typeCode"> 
            Erreur de conformité CR-BIO :
            un élément entry d'un CR de biologie doit comporter l'attribut typeCode. </assert>
        <assert test="../cda:act and 
                (../cda:act/cda:code[@codeSystem = $OIDLOINC] or not(../cda:act/cda:code/@code))"> 
            Erreur de conformité CR-BIO :
            Un élément entry doit avoir un élément fils act et le code de cet act s'il existe,
            doit appartenir à la terminologie LOINC. </assert>
        <assert test="../cda:act/cda:statusCode[@code = 'completed'] or
                ../cda:act/cda:statusCode[@code = 'active'] or
                ../cda:act/cda:statusCode[@code = 'aborted']"> 
            Erreur de conformité CR-BIO :
            Un élément entry doit avoir un élément fils act avec un statusCode@code valant 
            'completed', 'active' ou 'aborted'. </assert>
        <assert test="../cda:act/cda:entryRelationship[@typeCode = 'COMP']">
            Erreur de conformité CR-BIO : 
            Un élément entry doit avoir au moins un petit fils act/entryRelationship
            avec un attribut typeCode valant 'COMP'. </assert>
    </rule>
</pattern>
