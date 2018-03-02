<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEmusculo.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs au système musculo-squelettique du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Musculoskeletal System" 
    
    Historique :
    24/06/11 : CRI : Création
    25/07/11: CRI : Extension aux volets CS8, CS9 et CS24
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEmusculoEnt-errors">
    <title>IHE PCC v3.0 Musculoskeletal System</title>
    
    <!-- ****** Contexte = section Musculo-squelettique ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.34"]'>
        
        <!-- Observation: Réduction d'un membre ou absence d'éléments osseux CS8 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.1"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-12102"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de Réduction d'un membre ou absence d'éléments osseux doit obligatoirement 
            être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <!-- Observation: Luxation de la hanche CS9 et CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-14700"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de luxation de la hanche doit obligatoirement 
            être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <!-- Observation: autre pathologieCS9 et CS24 seulement  -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D1-00000"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'une autre affection du système
            doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D1-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D1-00000"]/cda:entryRelationship/cda:act/cda:text="")'>
            Erreur de Conformité volet CSE: Dans le cas d'une autre pathologie, préciser laquelle 
        </report>
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="D1-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D1-00000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>

    </rule>
</pattern>

