<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEneurologic.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs au système neurologique du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Neurologic System" 
    
    Historique :
    24/06/11 : CRI : Création
    30/06/11 : CRI : Extension aux volets CS8, CS9, CS24
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSENeurogicEnt-errors">
    <title>IHE PCC v3.0 Neurologic System</title>
    
    <!-- ****** Contexte = section Système Neurologique ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.35"]'>

        <!-- Observation: Spina Bifida CS9 et CS24 seulement -->        
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-95100"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de Spina Bifida doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert> 
        
        <!-- Observation: Infirmité motrice cérébrale CS9 et CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="DA-26510"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'Infirmité motrice cérébrale doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <!-- Observation: Anomalie du tube neural CS8 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.1"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="MED-176"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'anomalie du tube neural doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <!-- Observation: Hydrocéphalie CS8 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.1"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-91300"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'hydrocéphalie doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>

        <!-- Observation: Fente labio-palatine -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-51450"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de Fente labio-palatine doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>       
 
        <!-- Observation: Syndrome polymalformatif -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-0100"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de Syndrome polymalformatif doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <!-- Observation: autre pathologie CS9 et CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-90000"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'une autre affection du système nerveux
            doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D4-90000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D4-90000"]/cda:entryRelationship/cda:act/cda:text="")'>
            Erreur de Conformité volet CSE: Dans le cas d'une autre pathologie, préciser laquelle 
        </report>
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="D4-90000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D4-90000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Alerte: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
    </rule>
    
</pattern>