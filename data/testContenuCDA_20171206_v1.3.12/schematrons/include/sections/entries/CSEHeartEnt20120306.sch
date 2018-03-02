<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEheartEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs aux fonctions cardiaques du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Heart"
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEHeartEnt-errors">
    <title>IHE PCC v3.0 Heart</title>
    
    <!-- ****** Contexte = sous-section Système Cardiaque ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.29"]'>

        <!-- Malformation cardiaque -->
        <assert test='.//cda:observation[@negationInd]/cda:value/@code="D4-31000"'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: L'absence ou la présence de Malformation cardiaque doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- Observation: autre pathologie CS9 et CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D3-00000"'> 
            Erreur de Conformité volet CSE: L'absence ou la présence d'une autre affection du système cardiovasculaire
            doit obligatoirement être mentionnée à partir du booléen "observation/@negationInd"
        </assert>
        <report test='(.//cda:observation[@negationInd="false"]/cda:value/@code="D3-00000") and 
            (.//cda:observation[cda:value/@code="D3-00000"]/cda:entryRelationship/cda:act/cda:text="")'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: Dans le cas de la présence d'autres affections du système, préciser lesquelles 
        </report>        
        <report test='(.//cda:observation[@negationInd="true"]/cda:value/@code="D3-00000") and 
            (.//cda:observation[cda:value/@code="D3-00000"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
    </rule>
</pattern>
