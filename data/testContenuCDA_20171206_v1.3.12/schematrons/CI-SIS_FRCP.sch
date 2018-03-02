<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_FRCP.sch - ASIP/PTS
    ......................................................................................................................................................
    Vérification de la conformité sémantique au volet Structuration Commune des Documents Médicaux du CI-SIS.
    ......................................................................................................................................................
    Utilisation des répertoires sous testContenuCDA :
    - testContenuCDA : les documents CDA d'exemples conformes au CI-SIS, ainsi que la feuille de style par défaut cda_asip.xsl pour la visualisation
    - - documentsAnnexes : Des documents annexes liés aux exemples et des documents de référence
    - - infrastructure/cda : Le schéma XML CDA.xsd
    - - jeuxDeValeurs : les jeux de valeurs du CI-SIS dans le format SVS.xsd
    - - processable/coreschemas : Les sous-schémas XML de CDA.xsd (de l'édition normative HL7 v3 de 2005, correspondant à CDAr2)
    - - schematrons : les schématrons des volets du CI-SIS sous la forme source (<CI-SIS_<nom>.sch) et sous la forme compilée en xslt2 (<CI-SIS_<nom>.xsl)
    - - - abstract : les sous-schématrons de patterns abstraits (un fichier par abstract pattern)
    - - - include : les sous-schématrons de patterns concrets (un fichier par pattern)
    - - - - sections : les sous-schématrons de patterns pour la vérification de conformité des sections du corps CDA
    - - - - - entries : les sous-schématrons de patterns pour la vérification de conformité des entries du corps CDA
    - - - moteur : le moteur xslt2 de vérification de conformité sémantique d'un document d'exemple, 
                   avec ses différents composants : saxon9he.jar, script verif.bat et feuilles de transformation xslt2 intermédiaires
    - - - rapports : les rapports de vérification de conformité produits, et la feuille de style qui sert à leur visualisation
    ......................................................................................................................................................
    Pour réaliser le schematron d'un volet de contenu du CI-SIS :
        1) Recopier le présent schématron sous le nom CI-SIS_<nom du volet>.sch, dans le répertoire courant (schematrons)
        2) conserver les include, pattern existants, à l'exception du pattern et de l'include nonXMLBody inutiles pour un volet structuré.
        3) Créer dans le répertoire include les patterns concrets supplémentaires requis par le volet (ou réutiliser ceux qui sont réutilisables)
        4) le cas échéant créer dans le répertoire abstract les paterns abstraits supplémentaires requis par le volet
        5) Inclure tous les patterns supplémentaires dans le schématron CI-SIS_<nom du volet>.sch
        6) Activer dans la phase "latotale<aaaammjj>" les patterns concrets supplémentaires.
        7) La première opération de validation de conformité d'un document au volet compilera le schematron en xslt2 : CI-SIS_<nom du volet>.xsl
    ......................................................................................................................................................    

                         
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="FRCP-20140109"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_FRCP.sch">
    <title>Conformité d'un document CDAr2 au volet Fiche RCP du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!-- Inclusions d'abstract patterns : -->
    <include href="abstract/dansJeuDeValeurs20110729.sch"/>
    <include href="abstract/IVL_TS20110627.sch"/>   
    <include href="abstract/personName20110627.sch"/>
    
    <!-- en-tête et génériques -->
    <include href="include/addr20121008.sch"/>    
    <include href="include/administrativeGenderCode20110627.sch"/>
    <include href="include/assignedEntity20121008.sch"/>
    <include href="include/authenticatorName20110627.sch"/>
    <include href="include/authorPersonName20110627.sch"/>
    <include href="include/authorSpecialty20110627.sch"/>
    <include href="include/authorTime20110627.sch"/>
    <include href="include/documentCode20110627.sch"/>
    <include href="include/documentEffectiveTime20110627.sch"/>
    <include href="include/healthcareFacilityTypeCode20110627.sch"/> 
    <include href="include/informantAssignedPersonName20110627.sch"/>
    <include href="include/informantRelatedEntity20110627.sch"/>
    <include href="include/legalAuthenticatorName20110627.sch"/>
    <include href="include/legalAuthenticatorTime20110627.sch"/>
    <include href="include/modeleCommunEnTete20110728.sch"/>
    <include href="include/patient20110728.sch"/>
    <include href="include/patientBirthTime20110627.sch"/>
    <include href="include/patientId20110627.sch"/>
    <include href="include/patientName20110627.sch"/>
    <include href="include/practiceSettingCode20110627.sch"/>
    <include href="include/relatedDocument20110627.sch"/>
    <include href="include/relatedPersonName20110627.sch"/>
    <include href="include/serviceEventEffectiveTime20110627.sch"/>
    <include href="include/serviceEventPerformer20110708.sch"/>
    <include href="include/telecom20150317.sch"/>   
    
    <!-- sections -->

    <!-- Nouvelles sections -->
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/cancerDiagnosisSection20120827.sch"/>
    <include href="include/sections/progressNoteSection20120827.sch"/>
    <include href="include/sections/codedFunctionalStatusSection20120827.sch"/>
    <include href="include/sections/minimumDataSetSection20120827.sch"/>
    <include href="include/sections/importationConclusionCRSection20120827.sch"/>
    <include href="include/sections/importationConclusionCROSection20120827.sch"/>
    <include href="include/sections/proceduresInterventionSection20120827.sch"/>
    <include href="include/sections/historyOfPresentIllnessSection20120827.sch"/>             
    <include href="include/sections/FRCP_cancerDiagnosisSection20120827.sch"/>
    <include href="include/sections/FRCP_minimumDataSetSection20120827.sch"/>
    <include href="include/sections/FRCP_progressNoteSection20120827.sch"/>
    <include href="include/sections/FRCP_proceduresInterventionSection20120827.sch"/>
    <include href="include/sections/FRCP_carePlan20120827.sch"/>
    <include href="include/sections/FRCP20130114.sch"/>  
    <include href="include/sections/FRCP_codedReasonForReferral20140109.sch"/>
    <include href="include/sections/statutDocSection20130114.sch"/>
    <include href="include/sections/statutFRCPSection20130114.sch"/> 
    <!-- sections communes -->
    <include href="include/sections/carePlan20110627.sch"/>
    <!-- NMA: Ces sections ne sont pas utilisées -->
<!--<include href="include/sections/encounterHistoriesSection20110725.sch"/>
    <include href="include/sections/proceduresSection20110725.sch"/>-->
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    
    <include href="include/sections/results20120530.sch"/>
    
    <!-- entries -->
    
    <!-- Nouvelles entrées ou entrées modifiées -->

    
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    
    <!-- Entrées communes -->
    <include href="include/sections/entries/comments20110725.sch"/>

    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/encountersEntry20110725.sch"/>
    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>

    <include href="include/sections/entries/simpleObservation200110725.sch"/>
    
    <!-- NMA: Ces sections ne sont pas utilisées -->
    <!--<include href="include/sections/entries/concernEntry20120827.sch"/>
        <include href="include/sections/entries/ACPimageIllustrative20110727.sch"/>
    -->
    
    <!-- Value sets -->
    <include href="include/FRCP_TypeExamenComp20120827.sch"/>
    <include href="include/FRCP_TypeTraitement20140109.sch"/>
    <include href="include/FRCP_Tumeur20140109.sch"/>
    <include href="include/FRCP_Organe20140109.sch"/>
    <include href="include/FRCP_Appareil20140109.sch"/>
    <include href="include/FRCP_TraitementSoins20140109.sch"/>
    <include href="include/FRCP_TypeRCP20140109.sch"/>
    <include href="include/FRCP_PrimSecTumeur20140109.sch"/>
    <include href="include/FRCP_OMSInterpret20140109.sch"/> 
    <include href="include/FRCP_OMSEchPerf20140109.sch"/>
    <include href="include/FRCP_PhaseCancer20140109.sch"/>
    <include href="include/FRCP_StatutQuorum20140109.sch"/>
    <include href="include/FRCP_StatutCasPresente20140109.sch"/>
    <include href="include/FRCP_StatutDoc20140109.sch"/>
    <include href="include/FRCP_PropositionTherapeutique20140109.sch"/>
    <include href="include/FRCP_Diagnostic20150831.sch"/>
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="FRCP-20140109">
                
        <!-- obligatoire dans tout schématron -->
        <active pattern="variables"/>
        
        <!-- en-tête et génériques -->
        <active pattern="addr"/>
        <active pattern="administrativeGenderCode"/>
        <active pattern="assignedEntity"/>
        <active pattern="authenticatorName"/>
        <active pattern="authorPersonName"/>
        <active pattern="authorSpecialty"/>
        <active pattern="authorTime"/>
        <active pattern="documentCode"/>
        <active pattern="documentEffectiveTime"/>
        <active pattern="healthcareFacilityTypeCode"/>
        <active pattern="informantAssignedPersonName"/>
        <active pattern="informantRelatedEntity"/>
        <active pattern="legalAuthenticatorName"/>
        <active pattern="legalAuthenticatorTime"/>
        <active pattern="modeleCommunEnTete"/>
        <active pattern="patient"/>
        <active pattern="patientBirthTime"/>
        <active pattern="patientId"/>
        <active pattern="patientName"/>
        <active pattern="practiceSettingCode"/>
        <active pattern="relatedDocument"/>
        <active pattern="relatedPersonName"/>
        <active pattern="serviceEventEffectiveTime"/>
        <active pattern="serviceEventPerformer"/>
        <active pattern="telecom"/>
         
        <!-- sections -->
        <active pattern="activeProblemSection-errors"/>
        <active pattern="carePlan-errors"/>
        <active pattern="results-errors"/>
        <active pattern="cancerDiagnosis-errors"/>
        <active pattern="progressNote-errors"/>
        <active pattern="codedFunctionalStatus-errors"/>
        <active pattern="minimumDataSet-errors"/>
        <active pattern="importationConclusionCR-errors"/>
        <active pattern="importationConclusionCRO-errors"/>
        <active pattern="proceduresInterventionSection-errors"/>
        <active pattern="historyOfPresentIllnessSection-errors"/>
        <active pattern="statutFRCPSection-errors"/>
        <active pattern="statutDocSection-errors"/>
        <active pattern="FRCP_codedReasonForReferral-errors"/>
        <active pattern="FRCP_cancerDiagnosis-errors"/>
        <active pattern="FRCP_minimumDataSet-errors"/>
        <active pattern="FRCP_progressNote-errors"/>
        <active pattern="FRCP_carePlan-errors"/>
        <active pattern="FRCP-errors"/>
       
        
        <!-- <active pattern="codedVitalSigns-errors"/> -->
          

        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
       <!--
         NMA: Ces patterns ne sont pas utilisés
        <active pattern="proceduresSection-errors"/>
        <active pattern="encounterHistoriesSection-errors"/>-->
        
        <!-- entries -->
        
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="comments-errors"/>
        
        <active pattern="encountersEntry-errors"/>
        <active pattern="HealthStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="simpleObservation-errors"/>
        
        <!--
         NMA: Ces patterns ne sont pas utilisés
        <active pattern="ACPimageIllustrative"/>
        <active pattern="concernEntry-errors"/>-->

        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        
        <active pattern="FRCP_TypeExamenComp"/>
        <active pattern="FRCP_TypeTraitement"/>
        <active pattern="FRCP_Appareil"/>
        <active pattern="FRCP_Organe"/>
        <active pattern="FRCP_Tumeur"/>
        <active pattern="FRCP_TraitementSoins"/>
        <active pattern="FRCP_TypeRCP"/>
        <active pattern="FRCP_PrimSecTumeur"/>
        <active pattern="FRCP_OMSInterpret"/>
        <active pattern="FRCP_OMSEchPerf"/>
        <active pattern="FRCP_PhaseCancer"/>
        <active pattern="FRCP_StatutQuorum"/>
        <active pattern="FRCP_StatutCasPresente"/>
        <active pattern="FRCP_StatutDoc"/>
        <active pattern="FRCP_PropositionTherapeutique"/>
        <active pattern="FRCP_Diagnostic"/>
        
        


    </phase>


    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Variables globales          -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <pattern id="variables">
        <let name="enteteHL7France" value="'2.16.840.1.113883.2.8.2.1'"/>               <!-- conformité guide en-tête CDA de HL7 France -->
        <let name="commonTemplate" value="'1.2.250.1.213.1.1.1.1'"/>                    <!-- conformité volet structuration commune -->
        <let name="XDS-SD" value="'1.3.6.1.4.1.19376.1.2.20'"/>                         <!-- conformité profil XDS-SD -->
        <let name="OIDphysique" value="'1.2.250.1.71.4.2.1'"/>                          <!-- OID PS personnes physiques -->
        <let name="OIDmorale" value="'1.2.250.1.71.4.2.2'"/>                            <!-- OID PS personnes morales -->
        <let name="OIDINS-c" value="'1.2.250.1.213.1.4.2'"/>                            <!-- OID de l'INS-c -->
        <let name="OIDLOINC" value="'2.16.840.1.113883.6.1'"/>                          <!-- OID de LOINC -->
        <let name="templateObservationMedia" value="'1.3.6.1.4.1.19376.1.8.1.4.10'"/>   <!-- conformité image illustrative dans observationMedia -->
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_typeCode" value="'../jeuxDeValeurs/JDV_J07-XdsTypeCode_CI-SIS.xml'"/>   
        <let name="jdv_practiceSettingCode" value="'../jeuxDeValeurs/JDV_J04-XdsPracticeSettingCode_CI-SIS.xml'"/>  
        <let name="jdv_healthcareFacilityTypeCode" value="'../jeuxDeValeurs/JDV_J02-HealthcareFacilityTypeCode_CI-SIS.xml'"/>  
        <let name="jdv_authorSpecialty" value="'../jeuxDeValeurs/JDV_J01-XdsAuthorSpecialty-CI-SIS.xml'"/>  
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/JDV_HealthStatusCodes_CI-SIS.xml'"/>
        <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/JDV_ClinicalStatusCodes_CI-SIS.xml'"/>        
        <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/JDV_ProblemCodes_CI-SIS.xml'"/>
        <!-- Nouveau jeu de valeurs -->
        <let name="jdv_FRCP_TypeExamenComp" value="'../jeuxDeValeurs/JDV_TypeExamenComp_CI-SIS.xml'"/> 
        <let name="jdv_FRCP_TypeTraitement" value="'../jeuxDeValeurs/RNR_JDV_CDA_TypeTraitement_FRCP_SVS.xml'"/>
        <let name="jdv_FRCP_Organe" value="'../jeuxDeValeurs/JDV_ANRCPOrgane_CI-SIS.xml'"/>
        <let name="jdv_FRCP_Tumeur" value="'../jeuxDeValeurs/JDV_Tumeur_CI-SIS.xml'"/>
        <let name="jdv_FRCP_ANRCP_Tumeur" value="'../jeuxDeValeurs/RNR_JDV_CDA_Tumeur_FRCP_ANRCP_SVS.xml'"/>
        <let name="jdv_FRCP_Appareil" value="'../jeuxDeValeurs/JDV_ANRCPAppareil_CI-SIS.xml'"/>
        <let name="jdv_FRCP_TraitementSoins" value="'../jeuxDeValeurs/JDV_TraitementSoinsRCP_CI-SIS.xml'"/>        
        <let name="jdv_FRCP_TypeRCP" value="'../jeuxDeValeurs/JDV_NatureDiscussion_CI-SIS.xml'"/>
        <let name="jdv_FRCP_PrimSecTumeur" value="'../jeuxDeValeurs/JDV_PrimSecTumeur_CI-SIS.xml'"/>
        <let name="jdv_FRCP_OMSInterpret" value="'../jeuxDeValeurs/JDV_OMSInterpret_CI-SIS.xml'"/>
        <let name="jdv_FRCP_OMSEchPerf" value="'../jeuxDeValeurs/JDV_OMSEchPerf_CI-SIS.xml'"/>                       
        <let name="jdv_FRCP_PhaseCancer" value="'../jeuxDeValeurs/JDV_PhaseCancer_CI-SIS.xml'"/>                       
        <let name="jdv_FRCP_StatutQuorum" value="'../jeuxDeValeurs/JDV_StatutQuorum_CI-SIS.xml'"/>                       
        <let name="jdv_FRCP_StatutCasPresente" value="'../jeuxDeValeurs/JDV_StatutCasPrésenté_CI-SIS.xml'"/>  
        <let name="jdv_FRCP_StatutDoc" value="'../jeuxDeValeurs/JDV_StatutDoc_CI-SIS.xml'"/>
        
        
    </pattern>
 
</schema>
