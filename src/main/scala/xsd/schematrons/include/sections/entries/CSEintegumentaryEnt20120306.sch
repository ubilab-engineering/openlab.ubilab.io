<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEintegumentaryEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs à l'appareil cutané du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Heart" 
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEintegumentaryEnt-errors">
    <title>IHE PCC v3.0 Integumentary System</title>
    
    <!-- ****** Contexte = section Cutané ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.17"]'>

        
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D0-1014C"'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: L'absence ou la présence d'eczéma doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- autre -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="D0-00000"'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: L'absence ou la présence d'une autre affection du système doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="D0-00000") and 
            (.//cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système, préciser laquelle
        </report>
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="D0-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="D0-00000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
    </rule>
</pattern>



