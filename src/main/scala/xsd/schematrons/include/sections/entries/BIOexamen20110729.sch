<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOexamen.sch :
    Contenu :
        Contrôle d'un examen biologique d'une entry d'un CR d'examens biologiques
    Paramètres d'appel :
        Néant
    Historique :
        25/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOexamen">
    <p>Contrôle d'un examen biologique dans une entry d'un CR d'examens biologiques</p>
    <rule context="*[cda:templateId/@root = $templateExamen]">
        <assert test="self::cda:organizer and @classCode = 'BATTERY' and @moodCode = 'EVN'"> 
            Erreur de conformité CR-BIO :
            Un examen biologique dans une entry (avec templateId <value-of select="$templateExamen"/>)
            doit être un organizer de classCode BATTERY et de moodCode EVN. </assert>
        <assert test="./cda:statusCode[@code = 'completed'] or
            ./cda:statusCode[@code = 'active'] or
            ./cda:statusCode[@code = 'aborted']"> 
            Erreur de conformité CR-BIO :
            Un examen biologique doit avoir un statusCode@code valant 'completed', 'active' ou 'aborted'. </assert>
    </rule>
</pattern>
