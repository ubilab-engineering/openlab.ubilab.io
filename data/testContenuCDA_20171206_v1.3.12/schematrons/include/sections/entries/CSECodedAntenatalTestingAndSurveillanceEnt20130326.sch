<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSECodedAntenatalTestingAndSurveillanceEnt.sch ]O@%#o>>=-
    
    Teste les entrées de la section PCC Coded Antenatal Testing And Surveillance Section (1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10) utilisée dans le volet du CI-SIS 
    "Certificats de santé de l'enfant du 8ème jour"
    
    Historique :
    25/07/11 : CRI : Création
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSECodedAntenatalTestingAndSurveillanceEnt-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing And Surveillance</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10']">
        <!-- S'assurer que l'entrée est présente -->
        <assert test='cda:component/cda:observation/cda:code[@code = "ORG-080"]'>
            Erreur de Conformité volet CSE: La présence ou l'absence d'échographie morphologique doit être signalée. 
        </assert>
        <!-- S'assurer que l'entrée est présente -->
        <assert test='cda:component/cda:observation/cda:code[@code = "MED-167"]'>
            Erreur de Conformité volet CSE: La présence ou l'absence de mesure de la clarté nucale  doit être signalée. 
        </assert>
        <!-- S'assurer que l'entrée est présente -->
        <assert test='cda:component/cda:observation/cda:code[@code = "ORG-079"]'>
            Erreur de Conformité volet CSE: Le Nombre total d'échographies réalisé doit être signalé. 
        </assert>
        <!-- S'assurer que la valeur de l'entrée est exprimée en INT -->
        <assert test='cda:component/cda:observation[cda:code/@code = "ORG-079"]/cda:value[@xsi:type="INT"] '>
            Erreur de Conformité volet CSE: L'attribut 'value' sera présent et s'exprimera dans le type de donnée spécifiée par le volet.
        </assert>
        <!-- S'assurer que l'attribut negationInd est présent -->
        <assert test='cda:component/cda:observation[cda:code/@code = "5196-1"]/@negationInd '>
            Erreur de Conformité volet CSE: L'attribut 'negationInd' de l'observation sera présent et exprimera que l'examen aura été pratiqué.
        </assert>
        <!-- S'assurer que l'entrée est présente -->
        <assert test='cda:component/cda:observation/cda:code[@code = "5196-1"]'>
            Erreur de Conformité volet CSE: La présence ou l'absence de recherche d'Ag HBs et son résultat doivent être signalés
        </assert>
    </rule>
</pattern>