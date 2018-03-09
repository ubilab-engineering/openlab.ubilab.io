<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOprelevement.sch :
    Contenu :
        Conformité d'une procédure de prélèvement en vue d'examens biologiques  
    Paramètres d'appel :
        Néant
    Historique :
    22/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOprelevement">
    <p>Conformité d'une procédure de prélèvement dans un CR d'examens biologiques</p>
    <rule context="cda:procedure[./cda:templateId/@root='1.3.6.1.4.1.19376.1.3.1.2']">
        <assert test="./cda:code/@codeSystem=$OIDNABM or not(./cda:code) or ./cda:code/cda:originalText"> 
            Erreur de conformité CR-BIO :
            une procédure de prélèvement d'un CR de biologie, si elle est codée, 
            doit utiliser un code prélèvement de la NABM, 
            avec @codeSystem = "<value-of select="$OIDNABM"/>". </assert>
        <assert test="./cda:participant[@typeCode = 'PRD' and ./cda:participantRole/@classCode = 'SPEC']"> 
            Erreur de conformité CR-BIO :
            une procédure de prélèvement d'un CR de biologie doit comporter un participant de typeCode 'PRD'
            avec un fils participantRole de classCode 'SPEC'. </assert>
        <assert test="
            (count(./cda:entryRelationship/cda:act/cda:code[@code = 'SPRECEIVE' and @codeSystem = '1.3.5.1.4.1.19376.1.5.3.2']) = 1 and
            ./cda:entryRelationship/cda:act/cda:effectiveTime/@value) or
            not(./cda:entryRelationship/cda:act/cda:code[@code = 'SPRECEIVE'])">
            Erreur de conformité CR-BIO :
            une procédure de prélèvement d'un CR de biologie, si elle comporte l'acte "Réception de l'échantillon au laboratoire"
            doit alors préciser la date et heure de réception de l'échantillon à l'aide d'un effectiveTime@value. </assert>
        <assert test="
            ./cda:entryRelationship/cda:act[./cda:code/@code = 'SPRECEIVE' and 
                                            ./cda:code/@codeSystem = '1.3.5.1.4.1.19376.1.5.3.2' and
                                            ./cda:effectiveTime/@value] or
            not(./cda:entryRelationship/cda:act/cda:code[@code = 'SPRECEIVE'])">
            Erreur de conformité CR-BIO :
            la procédure de prélèvement d'un CR de biologie, si elle comporte l'acte "Réception de l'échantillon au laboratoire"
            doit alors préciser la date et heure de réception de l'échantillon à l'aide d'un effectiveTime@value. </assert>
    </rule>
</pattern>
