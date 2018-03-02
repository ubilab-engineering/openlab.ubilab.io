<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEgenitaliaEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs aux fonctions urinaires et génitales  du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Genitalia"
    
    Historique :
    24/06/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEGenitaliaEnt-errors">
    <title>IHE PCC v3.0 Genitalia</title>
    
    <!-- ****** Contexte = Sous-section Système urinaire ****** -->

        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.36"]'>
            
            <!-- Observation: malformation génitale CS9 - CS24 seulement -->
            <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
                .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-80000"'>
                Erreur de Conformité volet CSE: L'absence ou la présence malformation génitale doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
            </assert>
            <!-- Observation: malformation urinaire CS9 - CS24 seulement -->
            <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
                .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-70000"'>
                Erreur de Conformité volet CSE: L'absence ou la présence de malformation urinaire doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
            </assert>
            <!-- Observation: malformation rénale CS8 seulement -->
            <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.1"]) or
                .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-71020"'>
                Erreur de Conformité volet CSE: L'absence ou la présence de malformation rénale doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
            </assert>
            <!-- Observation: autre pathologie CS9 - CS24 seulement -->
            <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
                .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D7-00000"'>
                Erreur de Conformité volet CSE: L'absence ou la présence d'une autre affection du système urogénital
                doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
            </assert>
            
            <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D7-00000") and 
                (.//cda:entry/cda:observation[cda:value/@code="D7-00000"]/cda:entryRelationship/cda:act/cda:text="")'>
                Erreur: Dans le cas d'une autre pathologie, préciser laquelle 
            </report>
            <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="D7-00000") and 
                (.//cda:entry/cda:observation[cda:value/@code="D7-00000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
                Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
                le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
                sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
            </report>
        </rule>

</pattern>


