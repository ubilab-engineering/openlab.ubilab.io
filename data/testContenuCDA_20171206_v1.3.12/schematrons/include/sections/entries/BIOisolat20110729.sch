<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOisolat.sch :
    Contenu :
        Contrôle d'un isolat microbiologique d'une entry d'un CR d'examens biologiques
    Paramètres d'appel :
        Néant
    Historique :
        29/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOisolat">
    <p>Contrôle d'un isolat biologique dans une entry d'un CR d'examens biologiques</p>
    <rule context="*[cda:templateId/@root=$templateIsolat]">
        
        <assert test="self::cda:organizer and @classCode = 'CLUSTER' and @moodCode = 'EVN'">
            Erreur de conformité CR-BIO :
            Un isolat biologique dans une entry (avec templateId <value-of select="$templateIsolat"/>)
            doit être un organizer de classCode CLUSTER et de moodCode EVN. </assert>      
        
        <assert test="cda:statusCode[@code = 'completed'] or
                    cda:statusCode[@code = 'active'] or
                    cda:statusCode[@code = 'aborted']"> 
            Erreur de conformité CR-BIO :
            Un isolat biologique doit avoir un statusCode@code valant 'completed', 'active' ou 'aborted'. </assert>
     
        <assert test="cda:specimen[@typeCode='SPC']">
            Erreur de conformité CR-BIO : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un élément fils 'specimen', de typeCode 'SPC'. </assert>
            
        <assert test="cda:specimen/cda:specimenRole[@classCode='SPEC']">
            Erreur de conformité CR-BIO : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un specimen/specimenRole, de typeCode 'SPEC'. </assert>
        
        <assert test="cda:specimen/cda:specimenRole/cda:specimenPlayingEntity[@classCode='MIC']">
            Erreur de conformité CR-BIO : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un specimen/specimenRole/playingEntity de classCode 'MIC'. </assert>
        
        <assert test='cda:specimen/cda:specimenRole/cda:specimenPlayingEntity/cda:code'>
            Erreur de conformité CR-BIO : 
            Un isolat d'une entry d'un CR d'examens biologiques doit comporter un specimen/specimenRole/playingEntity/code. </assert>
        
        <assert test="not(cda:performer) or cda:performer[@typeCode='PRF']">
            Erreur de conformité CR-BIO : 
            Si un isolat d'une entry d'un CR d'examens biologiques spécifie un exécutant, ce doit être un élément fils performer de type 'PRF'. </assert> 
        
    </rule>
 
</pattern>
