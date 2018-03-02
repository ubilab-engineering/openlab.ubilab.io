<?xml version="1.0" encoding="UTF-8"?>


<!--                  -=<<o#%@O[ CSEabdomenEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs à l'abdomen selon
    les spécifications cliniques du volet Certificats de santé de l'enfant CS9, et CS24 
    pour la section "Coded Physical Exam Section/Abdomen" 
    Note: Ce schematron est commun aux trois volets CS8, CS9, CS24
    
    Historique :
    27/06/11 : CRI : Création
    25/07/11 : CRI: ajout des éléments cliniques des volets CS8, CS9 et CS24
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEabdomenEnt-errors">
    <title>IHE PCC v3.0 Abdomen</title>
    
    <!-- ****** Contexte = section Gastro entérologie ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.31"]'>
        
                                        <!---=<<oO[ CS8 seulement ]Oo>>=-->
        
        <!-- Atrésie de l'oesophage -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.1"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D4-55002"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'atrésie de l'oesophage doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- Omphalocèle, Gastroschisis -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.1"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="MED-177"'>
            Erreur de Conformité volet CSE: L'absence ou la présence d'omphalocèle doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>

        
                                    <!---=<<oO[ CS9 et CS24 seulement ]Oo>>=-->
               
        <!-- Reflux Gastro-oesophagien  -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="D5-30140"'>
            Erreur de Conformité volet CSE: L'absence ou la présence de reflux gastro-oesophagien doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        <!-- Autre pathologie digestive -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation[@negationInd]/cda:value/@code="R-21072"'>
            Erreur: L'absence ou la présence d'une autre affection du système digestif
            doit obligatoirement être mentionnée à partir du booléen observation/@negationInd
        </assert>
        
                                             <!---=<<oO[ Commun ]Oo>>=-->
        
        <!-- Autre pathologie -->
        <report test='(.//cda:entry/cda:observation[@negationInd="false"]/cda:value/@code="R-21072") and 
            (.//cda:entry/cda:observation[cda:value/@code="R-21072"]/cda:entryRelationship/cda:act/cda:text="")'>
            Erreur de Conformité volet CSE: Dans le cas d'une autre pathologie du système digestif, préciser laquelle 
        </report>
        
        <report test='(.//cda:entry/cda:observation[@negationInd="true"]/cda:value/@code="R-21072") and 
            (.//cda:entry/cda:observation[cda:value/@code="R-21072"]/cda:entryRelationship/cda:act/cda:text!="")'> 
            Erreur de Conformité volet CSE: Dans le cas d'une autre affection du système signalée, 
            le booléen cda:observation/@negationInd doit être fixé à la valeur "false" 
            sinon l'élément cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:text doit être vide
        </report>
    </rule>
</pattern>

