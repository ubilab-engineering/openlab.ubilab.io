<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ FRCP_codedReasonForReferral.sch ]O@%#o>>=-
    
    Teste la conformité du contenu de la section "Raison de la recommandation" (1.3.6.1.4.1.19376.1.5.3.1.3.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    14/01/13 : CRI : Modification pour intégrer les catégories et classes de la raison
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_codedReasonForReferral-errors">
    <title>IHE PCC v3.0 Procedures Section</title>

    <title>IHE PCC v3.0 FRCP_codedReasonForReferral Section</title>
        
        
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.2"]'> 
            
                            <!-- -=<<o#%@O[ Type de la RCP ]O@%#o>>=-  -->
        
        <!-- Teste la présence 
        <assert test="./cda:entry/cda:observation/cda:code[@code='RCP_106']">
            Erreur [FRCP_codedReasonfForReferral]:  Le type de la RCP (RCP_106) doit être figuré.
        </assert>-->
        <!-- Teste les valeurs 
        <assert test="not(./cda:entry/cda:observation/cda:code[@code='RCP_106']) or ./cda:entry/cda:observation/cda:value[@code='RCP_026' or @code='RCP_027'] ">
            Erreur [FRCP_codedReasonfForReferral]:  La valeur donnée pour coder le type la RCP ne fait pas partie des valeurs permises.
        </assert>-->
        
        <!-- Cas 1: type RCP = Appareil-Organe -->
        
                            <!-- -=<<o#%@O[ Appareil concerné ]O@%#o>>=-  -->
        
        <!-- Teste la cohérence RCP-Organe avec l'appareil concerné -->
        <assert test="not(./cda:entry/cda:observation/cda:value[@code='RCP_026']) or (./cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='RCP_099'])">
            Erreur [FRCP_codedReasonfForReferral]:  L'appareil concerné (RCP_099)doit être présent. 
        </assert>
        
        <!-- Teste le type d'entryRelationship de type 'SUBJ'-->       
        <assert test="not(./cda:entry/cda:observation[cda:value/@code='RCP_026']/cda:entryRelationship/cda:observation/cda:code[@code='RCP_099']) or 
            ./cda:entry/cda:observation[cda:value/@code='RCP_026']/cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:code[@code='RCP_099']">
            Erreur [FRCP_codedReasonfForReferral]:  La valeur de @typeCode est @typeCode='SUBJ'. 
        </assert>
        
                             <!-- -=<<o#%@O[ Organe concerné ]O@%#o>>=-  -->        
        
        <!-- Teste la présence -->
        <assert test="not(./cda:entry/cda:observation/cda:value[@code='RCP_026']) 
            or (./cda:entry/cda:observation[cda:value/@code='RCP_026']/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='RCP_093'])">
            Erreur [FRCP_codedReasonfForReferral]: Le type de d'organe concerné (RCP_093) doit être figuré. 
        </assert>
        <!-- Teste le type d'entryRelationship de type 'REFR'-->    
        <assert test="not(./cda:entry/cda:observation/cda:value[@code='RCP_026']) or 
            ./cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship[@typeCode='REFR']/cda:observation/cda:code[@code='RCP_093']">
            Erreur [FRCP_codedReasonfForReferral]: La valeur de @typeCode est 'REFR'. 
        </assert>
        
        <!-- Cas 2: type RCP = RCP Transversale et de soins de support -->
        
        <!-- Teste la cohérence RCP Transversale et de soins de support avec les soins -->
        <assert test="not(./cda:entry/cda:observation/cda:value[@code='RCP_027']) or (./cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='RCP_110'])">
            Erreur [FRCP_codedReasonfForReferral]:  Les soins et traitements (RCP_110) doivent être présents. 
        </assert>
        

        
    </rule>
</pattern>