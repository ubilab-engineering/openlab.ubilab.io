<?xml version="1.0" encoding="UTF-8"?><pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEcodedResultsEntries-errors">

    <!--                  -=<<o#%@O[ CSEpregnancyHistoryEntries.sch ]O@%#o>>=-
        
        Teste les entrées de la section PCC Coded Results (1.3.6.1.4.1.19376.1.5.3.1.3.28) utilisée dans le volet du CI-SIS 
        "Certificats de santé de l'enfant du 8ème jour"
        Note: deux types d'entrées (procedures et simple observation) sont prévus pour cette section
        Historique :
        25/07/11 : CRI : Création
        22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
        
    -->
    
    <title>IHE PCC Coded Results Section</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.28']">
        
        <!--  IHE PCC Coded Results Section/procedure entries : 1.3.6.1.4.1.19376.1.5.3.1.4.19 -->
        
        <assert
            test="cda:entry/cda:procedure/cda:code[@code ='ORG-080']">
            Erreur de Conformité volet CS8: L'absence ou la présence d'échographie Morphologique doit être indiquée
        </assert>
        
        <assert
            test="cda:entry/cda:procedure/cda:code[@code ='P5-B005F']">
            Erreur de Conformité volet CS8: L'absence ou la présence de mesure de la clarté nucale doit être indiquée
        </assert>
        
        <!--  IHE PCC Coded Results Section/simple observation entries : 1.3.6.1.4.1.19376.1.5.3.1.4.13 -->
        <assert
            test="cda:entry/cda:observation/cda:code[@code ='ORG-079']">
            Erreur de Conformité volet CS8: Le nombre total d'échographies doit être indiqué
        </assert>
        
        <assert
            test="cda:entry/cda:observation/cda:code[@code ='5196-1']">
            Erreur de Conformité volet CS8: La recherche d'antigène HBs doit être indiquée
        </assert>
        
        <assert
            test="cda:entry/cda:observation[cda:code/@code ='5196-1']/cda:subject/cda:relatedSubject/cda:code/@code='MTH'">
            Erreur de Conformité volet CS8: La recherche d'antigène HBs doit être attribuée à la mère par une entité "subject"
        </assert>       

    </rule>
</pattern>
