<?xml version="1.0" encoding="UTF-8"?>
<!-- 
                 -=-=-=-=-=-=<<ox#%@O[ CI-SIS_VSM_CDAnv2.sch - ASIP/PRAS ]O@%#xo>>=-=-=-=-=-=-
   
    Vérification de la conformité sémantique au volet Synthèse Médicale du CI-SIS.
   
    Historique :
    
    30/05/12 : CRI - Adaptation du module initial CI-SIS_VSM_CDAnv2.sch pour le volet 
    "Synthèse Médicale"de l'ASIP
    19/03/15 : JDS - Modification du schematron codedListOfSurgeries20120718.sch -> codedListOfSurgeries20150319.sch
                   - Inclusion du schematron traitementLC20150319.sch + activation du pattern traitementLC-errors"/>
                   - Maj des include telecom20110728.sch                        -> telecom20150317.sch
    
         
                                             
                       .
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="VSM_COMPLET"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_VSM_CDA_n3.sch">
    <title>Conformité d'un document CDAr2 au Volet de Synthèse Médicale du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

                                    <!--=<<o#%@O[ Abstract patterns ]O@%#o>>=-->
    
    <include href="abstract/dansJeuDeValeurs20110729.sch"/>
    <include href="abstract/IVL_TS20110627.sch"/>   
    <include href="abstract/personName20110627.sch"/>

                                          <!--=<<o#%@O[ en-tête ]O@%#o>>=-->

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
    
                     <!--=<<o#%@O[ sections ]O@%#o>>=-->
    
             <!-- Nouvelles sections ou sections modifiées -->   
    <include href="include/sections/VSM20120720.sch"/>
    <include href="include/sections/pathAntAllFdR20130312.sch"/>               
    <include href="include/sections/pathAntAll20130312.sch"/>                 
    <include href="include/sections/FdR20130312.sch"/>
    <include href="include/sections/traitementLC20150319.sch"/>
    <!-- 
    <include href="include/sections/FdRStruct20120530.sch"/> -->
    <include href="include/sections/results20120530.sch"/>
    <include href="include/sections/medications20120718.sch"/>
    <include href="include/sections/codedListOfSurgeries20150319.sch"/>         
    <include href="include/sections/allergiesAndIntolerance20120718.sch"/>
           <!-- Uniquement pour la version "tout-structuré" du VSM -->
    <include href="include/sections/codedFamilyMedicalHistory20120718.sch"/>
    <include href="include/sections/hazardousWorkingConditions20120720.sch"/>
                          <!-- Anciennes sections -->
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
<!--   NMA: Cette section n'est pas utilisée
        <include href="include/sections/proceduresSection20110725.sch"/>       
-->
                     <!--=<<o#%@O[ entrées ]O@%#o>>=-->
    
         <!-- Nouvelles entrées ou entrées modifiées (uniquement pour le tout-structuré) -->
    <include href="include/sections/entries/FamilyHistoryOrganizer20120723.sch"/>
    <include href="include/sections/entries/familyHistoryObservation20120723.sch"/>
    <include href="include/sections/entries/VSM_problemEntry20120827.sch"/>
    
                         <!-- Anciennes entrées -->    
    <!-- <include href="include/sections/entries/concernEntry20110725.sch"/>  -->
    
    
    <include href="include/sections/entries/concernEntry20120827.sch"/>
    
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
   
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/> 
    <include href="include/sections/entries/medications20110804.sch"/>
    <include href="include/sections/entries/product20110802.sch"/>
    <include href="include/sections/entries/AllergiesAndIntoleranceConcern20110803.sch"/>
    <include href="include/sections/entries/AllergiesAndIntolerances20161116.sch"/>
    <include href="include/sections/entries/problemStatusObservation20110803.sch"/>
    <include href="include/sections/entries/CI-SIS_medications20120830.sch"/>
        
                    <!--=<<o#%@O[ value sets ]O@%#o>>=-->   
    
    <!-- Nouvelles value sets (uniquement pour le tout-structuré) -->
    <include href="include/sections/entries/FamilyHistoryCodes20120723.sch"/>
    <include href="include/VSM_routeOfAdministration20120830.sch"/>
    <include href="include/humanSubstanceAdministrationSite20120830.sch"/>
    
    
    <!-- Anciennes value sets -->
    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/AllergyAndIntoleranceCodes20110728.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <!-- Version VSM "tout-structuré" -->
    
    <phase id="VSM_COMPLET">
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
        
        
        <!--=<<o#%@O[ activation sections ]O@%#o>>=-->  
        <!-- Sections communes aux deux phases -->
        <active pattern="VSM-errors"/>
        <active pattern="pathAntAllFdR-errors"/>
        <active pattern="pathAntAll-errors"/>
        <active pattern="FdR-errors"/>
        <active pattern="results-errors"/>
        <active pattern="activeProblemSection-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="codedListOfSurgeries-errors"/>
        <active pattern="AllergiesAndIntolerances-errors"/>
        <active pattern="AllergiesAndIntoleranceConcern-errors"/>
        <active pattern="problemStatusObservation-errors"/>
        <active pattern="medications_Section-errors"/>
        <active pattern="product-errors"/>
<!--        <active pattern="proceduresSection-errors"/>-->
        <active pattern="traitementLC-errors"/>
        
        
        
        <!-- Sections spécifiques de la phase -->
       <!-- <active pattern="FdRStruct-errors"/> --> 
        <active pattern="codedSocialHistory-errors"/>
        <active pattern="hazardousWorkingConditions-errors"/>
        <active pattern="codedFamilyMedicalHistory-errors"/>
        
        <!--=<<o#%@O[ activation entrées ]O@%#o>>=-->
        
        <active pattern="concernEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="CI-SIS_medications-errors"/>
        <active pattern="simpleObservation-errors"/>
        <active pattern="familyHistoryOrganizer-errors"/>
        <active pattern="familyHistoryObservation-errors"/>
        
        
        
        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
        <active pattern="FamilyHistoryCodes"/>
        <active pattern="RouteOfAdministration"/>
        <active pattern="humanSubstanceAdministrationSite"/>
        
        
    </phase>
                                        <!--=<<o#%@O[ variables globales ]O@%#o>>=-->
    
    <pattern id="variables">
        <let name="enteteHL7France" value="'2.16.840.1.113883.2.8.2.1'"/>
        <!-- conformité guide en-tête CDA de HL7 France -->
        <let name="commonTemplate" value="'1.2.250.1.213.1.1.1.1'"/>
        <!-- conformité volet structuration commune -->
        <let name="XDS-SD" value="'1.3.6.1.4.1.19376.1.2.20'"/>
        <!-- conformité profil XDS-SD -->
        <let name="OIDphysique" value="'1.2.250.1.71.4.2.1'"/>
        <!-- OID PS personnes physiques -->
        <let name="OIDmorale" value="'1.2.250.1.71.4.2.2'"/>
        <!-- OID PS personnes morales -->
        <let name="OIDINS-c" value="'1.2.250.1.213.1.4.2'"/>
        <!-- OID de l'INS-c -->
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_typeCode" value="'../jeuxDeValeurs/JDV_J07-XdsTypeCode_CI-SIS.xml'"/>   
        <let name="jdv_practiceSettingCode" value="'../jeuxDeValeurs/JDV_J04-XdsPracticeSettingCode_CI-SIS.xml'"/>  
        <let name="jdv_healthcareFacilityTypeCode" value="'../jeuxDeValeurs/JDV_J02-HealthcareFacilityTypeCode_CI-SIS.xml'"/>  
        <let name="jdv_authorSpecialty" value="'../jeuxDeValeurs/JDV_J01-XdsAuthorSpecialty-CI-SIS.xml'"/>  
        <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/JDV_HealthStatusCodes_CI-SIS.xml'"/>
        <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/JDV_ClinicalStatusCodes_CI-SIS.xml'"/>        
        <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/JDV_ProblemCodes_CI-SIS.xml'"/>
        <let name="jdv_AllergyAndIntoleranceCodes" value="'../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType_CI-SIS.xml'"/>
        <let name="jdv_RouteOfAdministration" value="'../jeuxDeValeurs/JDV_HL7_routeOfAdministration_CI-SIS.xml'"/>
        <let name="jdv_humanSubstanceAdministrationSite" value="'../jeuxDeValeurs/JDV_HL7_HumanSubstanceAdministrationSite _CI-SIS.xml'"/>
    </pattern>
</schema>
