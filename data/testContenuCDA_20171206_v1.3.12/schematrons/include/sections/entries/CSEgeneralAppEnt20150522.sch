<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEabdomenEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs l'apparence générale  selon
    les spécifications cliniques du volet Certificats de santé de l'enfant CS9, et CS24 
    pour la section "Coded Physical Exam Section/Abdomen" 
    Note: Ce schematron est commun aux volets CS9, CS24
    
    Historique :
    24/06/11 : CRI : Création
    22/05/15 : JDS : Mise à jour du code pour l'élément Autre pathologie (CSE-070 à la place de XX-MCH207)
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
       
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEgeneralAppEnt-errors">
    <title>IHE PCC v3.0 General appearance</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.16"]'>       
        
        <!-- Trisomie 21 -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-02214"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de trisomie 21 doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <!-- Autre anomalie Congénitale CS9, CS24 seulement -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-00000"'>
        Erreur de Conformité volet CSE: L'absence ou la présence d'une autre anomalie congénitale 
        doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
    <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D4-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D4-00000"]/cda:entryRelationship/cda:act/cda:text="")'>
        Erreur de Conformité volet CSE: Dans le cas d'une autre anomalie congénitale, préciser laquelle 
    </report>
        
    <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="D4-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D4-00000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
        
        <!-- Autre pathologie CS9, CS24 seulement-->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="MED-212"'>
        Erreur de Conformité volet CSE: L'absence ou la présence d'une autre pathologie doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="MED-212") and 
            (.//cda:entry/cda:observation[cda:value/@code="MED-212"]/cda:entryRelationship/cda:act/cda:text="")'>
        Erreur: Dans le cas d'une autre pathologie, préciser laquelle 
        </report>
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="MED-212") and 
            (.//cda:entry/cda:observation[cda:value/@code="MED-212"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
    </rule>
</pattern>