<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ OBP_activeProblemSectionEntries.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Active Problems Section" (1.3.6.1.4.1.19376.1.5.3.1.3.6)
    aux spécifications d'IHE PCC v3.0 dans le cadre de OBP
    
    
    Historique :
    28/10/13 : CRI : Création - OBP_activeProblemSectionEntries20131028.sch
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="OBP_activeProblemSectionEntries-errors">


    <title>IHE PCC v3.0 Active Problems Section Entries</title>

    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.3.6&quot;]">

        <!--  Vérification de la présence des entrées obligatoires        -->

        <assert test=".//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='OBS_016'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée"Metrorragies du 2ème- 3ème trimestre"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='D8-12000'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "MAP"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='OBS_017'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Rupture prématurée des membranes"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='D8-11000'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Hypertension artérielle"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='E14'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Diabète"
        </assert>
        <assert test="//cda:act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='D7-10030'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Infection urinaire"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='OBS_132'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Infection cervico-vaginale"
        </assert>
    </rule>
</pattern>


 <!-- 
     
 
 -->