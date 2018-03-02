<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSElymphaticEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs aux fonctions hématopoïetiques et lymphatiques du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Coded Physical Exam Section/Lymphatic System" 
    
    Historique :
    24/06/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSElymphaticEnt-errors">
    <title>IHE PCC v3.0 Lymphatic System</title>
    
    <!-- ****** Contexte = section Hématopoïèse ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.32"]'>
        
        <!-- Observation: Maladie de l'hémoglobine -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="DC-20000"'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: L'absence ou la présence de maladie de l'hémoglobine doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- Observation: autre pathologie -->
        <assert test='.//cda:entry/cda:observation[@negationInd]/cda:value/@code="DC-00000"'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: L'absence ou la présence d'une autre affection de l'hématopoièse doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="DC-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="DC-00000"]/cda:entryRelationship/cda:act/cda:text="")'> 
            <!-- Note any missing optional elements -->
            Erreur de Conformité volet CSE: Dans le cas d'une autre pathologie, préciser laquelle 
        </report>
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="DC-00000") and 
            (.//cda:entry/cda:observation[cda:value/@code="DF-00754"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
    </rule>
</pattern>
