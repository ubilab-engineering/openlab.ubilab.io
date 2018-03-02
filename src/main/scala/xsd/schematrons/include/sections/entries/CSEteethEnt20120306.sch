<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEteeth.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs au système dentaire du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/teeth" 
    
    Historique :
    24/06/11 : CRI : Création
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEteethEnt-errors">
    <title>IHE PCC v3.0 Teeth</title>
    
    <!-- ****** Contexte = sous-section Dents ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.23"]'>
        <!-- Nombre total de dents -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="MED-188"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'un comptage des dents doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="MED-188") and 
            (.//cda:entry/cda:observation[cda:value/@code="MED-188"]/cda:entryRelationship/cda:act/cda:text="")'>
            Erreur de Conformité volet CSE: Donner le nombre total de dents 
        </report>
        <!-- Nombre total de caries -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D5-10110"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'un comptage de dents cariées doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D5-10110") and 
            (.//cda:entry/cda:observation[cda:value/@code="D5-10110"]/cda:entryRelationship/cda:act/cda:text="")'>
            Erreur de Conformité volet CSE: Donner le nombre total de dents cariées.
        </report>

    </rule>
</pattern>



