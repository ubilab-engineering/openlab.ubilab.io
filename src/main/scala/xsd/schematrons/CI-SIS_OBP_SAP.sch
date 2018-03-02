<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP_SAP.sch - ASIP/PRAS
   
    ......................................................................................................................................................    
    Historique :
        17/10/13 : CRI : Création
        19/06/15 : JDS : Maj des include telecom20110728.sch                        -> telecom20150317.sch
                         Modification du schematron codedListOfSurgeries20120718.sch -> codedListOfSurgeries20150319.sch
        

-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="SAP-20131017"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP_SAP.sch">
    <title>Conformité d'un document CDAr2 au volet OBP - Synthèse Antepartum (SAP) du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
              <!--=<<o#%@O[ Abstract patterns ]O@%#o>>=-->
    
    <include href="abstract/dansJeuDeValeurs20131025.sch"/>
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
    <include href="include/nonXMLBody20110627.sch"/>
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
    <include href="include/SAP_ModeleEnTete20131017.sch"/> 
    
                 <!--=<<o#%@O[ Sections ]O@%#o>>=-->
    
    <include href="include/sections/allergiesAndIntolerance20120718.sch"/>
    <include href="include/sections/allergiesAndIntoleranceConcern20130821.sch"/>
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/codedListOfSurgeries20150319.sch"/>
    <include href="include/sections/pregnancyHistorySection20110725.sch"/>
    <include href="include/sections/transfusionHistory20130821.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
    <include href="include/sections/codedFamilyMedicalHistory20120718.sch"/>
    <include href="include/sections/codedResults20110725.sch"/>
    <include href="include/sections/CodedAntenatalTestingAndSurveillance20110725.sch"/>
    <include href="include/sections/patientEducationAndConsents20110805.sch"/>
    <include href="include/sections/codedVitalSigns20110627.sch"/>
    <include href="include/sections/medicationsAdministered20131018.sch"/>
    <include href="include/sections/statutDocSection20130114.sch"/>
    <include href="include/sections/laboratorySpecialtySection20131022.sch"/>  
    
                  <!--=<<o#%@O[ Entrées ]O@%#o>>=-->
    
    <include href="include/sections/entries/AllergiesAndIntolerances20161116.sch"/>
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/pregnancyObservation20130821.sch"/>
    <include href="include/sections/entries/socialHistoryObservation20130821.sch"/>
    <include href="include/sections/entries/OBP_codedSocialHistoryValues20131021.sch"/>
    <include href="include/sections/entries/FamilyHistoryObservation20120723.sch"/>
    <include href="include/sections/entries/pregnancyObservationValues20131023.sch"/>
    <include href="include/sections/entries/codedVitalSignsOrg20120306.sch"/>
    <include href="include/sections/entries/VitalSignsObservation20131024.sch"/>
    <include href="include/sections/entries/VitalSignsObservationValues20131024.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>
    <include href="include/sections/entries/concernEntry20120827.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/> 
    <include href="include/sections/entries/socialHistoryObservationValues20131023.sch"/>
    <include href="include/sections/entries/codedAntenatalTestingAndSurveillanceOrg20110725.sch"/>
    <include href="include/sections/entries/codedAntenatalTestingAndSurveillanceOrgValues20131023.sch"/>
    <include href="include/sections/entries/OBP_patientEducationAndConsentsValues20131023.sch"/>
    <include href="include/sections/entries/medications20110804.sch"/>
    
    <!--=<<o#%@O[  Checkup des entrées obligatoires ]O@%#o>>=-->
    
    <include href="include/sections/entries/OBP_activeProblemSectionEntries20131028.sch"/>
    <include href="include/sections/entries/OBP_pregnancyHistoryOrganizerEntries20131028.sch"/>
    <include href="include/sections/entries/OBP_BirthOrganizerEntries20131028.sch"/>


                       <!--=<<o#%@O[ Value sets ]O@%#o>>=-->

    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/AllergyAndIntoleranceCodes20110728.sch"/>
    <include href="include/sections/entries/OBP_IssueGrossesse20131025.sch"/>
    <include href="include/sections/entries/OBP_StaticSAPActiveProblem20131025.sch"/>
    <include href="include/sections/entries/OBP_EtatPérinée20131025.sch"/>
    <include href="include/sections/entries/OBP_IssueAccouchement20131025.sch"/>
    <include href="include/sections/entries/OBP_EtatNaissance20131025.sch"/>
    <include href="include/sections/entries/OBP_TranfertMutation20131025.sch"/>
    <include href="include/sections/entries/GroupeRhesus20131025.sch"/>
    <include href="include/sections/entries/OBP_AnomalieCroissance20131025.sch"/>
    <include href="include/sections/entries/OBP_AnomalieConstitutionnelle20131025.sch"/>
    <include href="include/sections/entries/OBP_HTAGravidique20131025.sch"/>
    <include href="include/sections/entries/OBP_DiabeteGrossesse20131025.sch"/>
    <include href="include/sections/entries/OBP_InfectUrinaire20131025.sch"/>
    <include href="include/sections/entries/OBP_InfectCervicoVaginale20131025.sch"/>
    <include href="include/sections/entries/OBP_TrimestreGrossesse20131025.sch"/>
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="SAP-20131017">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
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
        <active pattern="nonXMLBody"/>
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
        <active pattern="SAP_ModeleEnTete"/> 
        
        <!--=<<o#%@O[ activation sections ]O@%#o>>=-->
        
        <active pattern="allergiesAndIntolerance-errors"/>
        <active pattern="allergiesAndIntoleranceConcern-errors"/>
        <active pattern="activeProblemSection-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="codedListOfSurgeries-errors"/>
        <active pattern="pregnancyHistorySection-errors"/>
        <active pattern="transfusionHistory-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        <active pattern="codedFamilyMedicalHistory-errors"/>
        <active pattern="codedResults-errors"/>
        <active pattern="CodedAntenatalTestingAndSurveillance-errors"/>
        <active pattern="patientEducationAndConsents-errors"/>
        <active pattern="codedVitalSigns-errors"/>
        <active pattern="medicationsAdministered-errors"/>
        <active pattern="statutDocSection-errors"/>
        
        <!--=<<o#%@O[ activation Entrées ]O@%#o>>=-->
        
        <active pattern="AllergiesAndIntolerances-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="pregnancyObservation-errors"/>
        <active pattern="socialHistoryObservation-errors"/>
        <active pattern="OBP_codedSocialHistoryValues-errors"/>
        <active pattern="familyHistoryObservation-errors"/>
        <active pattern="laboratorySpecialtySection-errors"/>
        <active pattern="pregnancyObservationValues-errors"/>
        <active pattern="socialHistoryObservationValues-errors"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrg-errors"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrgValues-errors"/>
        <active pattern="OBP_patientEducationAndConsentsValues-errors"/>
        <active pattern="codedVitalSignsOrg-errors"/>
        <active pattern="VitalSignsObservation-errors"/>
        <active pattern="VitalSignsObservationValues-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="simpleObservation-errors"/>  
        <active pattern="medications-errors"/>       
        
        <!--=<<o#%@O[ activation Checkup Entrées ]O@%#o>>=-->
        
        <active pattern="OBP_activeProblemSectionEntries-errors"/>
        <active pattern="OBP_pregnancyHistoryOrganizerEntries-errors"/>
        <active pattern="OBP_BirthOrganizerEntries-errors"/>
        
        
        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        
        <active pattern="HealthStatusCodes"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
        <active pattern="OBP_IssueGrossesse"/>
        <active pattern="OBP_StaticSAPActiveProblem"/>
        <active pattern="OBP_EtatPérinée"/>
        <active pattern="OBP_IssueAccouchement"/>
        <active pattern="OBP_EtatNaissance"/>
        <active pattern="OBP_TranfertMutation"/>
        <active pattern="GroupeRhesus"/>
        <active pattern="OBP_AnomalieCroissance"/>
        <active pattern="OBP_AnomalieConstitutionnelle"/>
        <active pattern="OBP_HTAGravidique"/>
        <active pattern="OBP_DiabeteGrossesse"/>
        <active pattern="OBP_InfectUrinaire"/>
        <active pattern="OBP_InfectCervicoVaginale"/>
        <active pattern="OBP_TrimestreGrossesse"/>
        
        
    </phase>

    
       <!--=<<o#%@O[ Variables globales ]O@%#o>>=-->


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
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/JDV_HealthStatusCodes_CI-SIS.xml'"/>
        <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/JDV_ClinicalStatusCodes_CI-SIS.xml'"/>        
        <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/JDV_ProblemCodes_CI-SIS.xml'"/>
        <let name="jdv_AllergyAndIntoleranceCodes" value="'../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType_CI-SIS.xml'"/>
        <let name="jdv_OBP_IssueGrossesse" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_IssueGrossesse.xml'"/>
        <let name="jdv_OBP_StaticSAPActiveProblem" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_StaticSAPActiveProblem.xml'"/>
        <let name="jdv_OBP_EtatPérinée" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_EtatPérinée.xml'"/>
        <let name="jdv_OBP_IssueAccouchement" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_IssueAccouchement.xml'"/>
        <let name="jdv_OBP_EtatNaissance" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_EtatNaissance.xml'"/>
        <let name="jdv_OBP_TranfertMutation" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TranfertMutation.xml'"/>
        <let name="jdv_GroupeRhesus" value="'../jeuxDeValeurs/CI-SIS_jdv_GroupeRhesus.xml'"/>
        <let name="jdv_OBP_AnomalieCroissance" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_AnomalieCroissance.xml'"/>
        <let name="jdv_OBP_AnomalieConstitutionnelle" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_AnomalieConstitutionnelle.xml'"/>
        <let name="jdv_OBP_HTAGravidique" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_HTAGravidique.xml'"/>
        <let name="jdv_OBP_DiabeteGrossesse" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_DiabeteGrossesse.xml'"/>
        <let name="jdv_OBP_InfectUrinaire" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_InfectUrinaire.xml'"/>
        <let name="jdv_OBP_InfectCervicoVaginale" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_InfectCervicoVaginale.xml'"/>
        <let name="jdv_OBP_TrimestreGrossesse" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TrimestreGrossesse.xml'"/>

    </pattern>
</schema>