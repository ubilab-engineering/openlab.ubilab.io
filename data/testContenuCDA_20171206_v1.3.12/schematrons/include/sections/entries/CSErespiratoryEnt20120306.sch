<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSErespiratory.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs au système respiratoire du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/respiratory System" 
    
    Historique :
    24/06/11 : CRI : Création
    25/07/11 : CRI : Extension aux volets CS9 et CS24
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSErespiratoryEnt-errors">
    <title>IHE PCC v3.0 Respiratory System</title>
    
    <!-- ****** Contexte = section Système Respiratoire ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.30"]'>
        
        <!-- Observation: Mucoviscidose -->
        <assert test='(.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D6-94800")'>
            Erreur: L'absence ou la présence de Mucoviscidose doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- Observation: Asthme CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"]) or
            (.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D2-51000")'>
            Erreur: L'absence ou la présence d'asthme doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- Observation: autre pathologie -->
        <assert test='(.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D2-00000")'>
            Erreur: L'absence ou la présence d'une autre affection du système
            doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D2-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D2-00000"]/cda:entryRelationship/cda:act/cda:text="")'>
            Erreur: Dans le cas d'une autre pathologie, préciser laquelle 
        </report>
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="D2-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D2-00000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Alerte: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>

    </rule>
</pattern>