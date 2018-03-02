<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ FRCP_cancerDiagnosis.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Cancer Diagnosis Section" (1.3.6.1.4.1.19376.1.7.3.1.3.14.1)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/08/121 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_cancerDiagnosis-errors">


    <title>IHE PCC v3.0 Cancer Diagnosis Section</title>

    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.3.14.1']">
        
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:code[@code='G-1009']">
            Erreur [FRCP_cancerDiagnosisSection]: La présence du diagnostic (G-1009) de la tumeur est obligatoire.
        </assert>
    <!-- 
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:code[@code='G-1009'] and 
            cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:value[@code = 'RCP_075' or
            @code = 'RCP_008' or
            @code = 'M-80006' or
            @code = 'RCP_011']">
            Erreur [FRCP_cancerDiagnosisSection]: L'élément value prend ses valeurs dans le jeu de valeurs 'RCP_PrimSecTumeur'.
        </assert>
     -->
        
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21908-9'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'TNM' de la tumeur est obligatoire.
        </assert>
        
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21905-5'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'T' de la tumeur est obligatoire.
        </assert>
        
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21906-3'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'N' de la tumeur est obligatoire.
        </assert>
        
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21907-1'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'M' de la tumeur est obligatoire.
        </assert>
        <!--       
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21905-5']
            and cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:value[@code='RCP_020' or
            @code='RCP_022' or
            @code='RCP_023' or
            @code='RCP_024' or
            @code='RCP_025'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'T' prend l'une des valeurs du jeu de valeurs RCP_MeataT.
        </assert>
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21906-3']
            and cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:value[@code='RCP_014' or
            @code='RCP_015' or
            @code='RCP_016'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'N' prend l'une des valeurs du jeu de valeurs RCP_MeataN.
        </assert>
        <assert test="cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='21907-1']
            and cda:entry/cda:act/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:value[@code='RCP_017' or
            @code='RCP_018' or
            @code='RCP_019'] ">
            Erreur [FRCP_cancerDiagnosisSection]: La classification 'M' prend l'une des valeurs du jeu de valeurs RCP_MeataM.
        </assert>
        -->
    </rule>
</pattern>
