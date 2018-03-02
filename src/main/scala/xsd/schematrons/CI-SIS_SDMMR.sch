<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="SDMMR20160809"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_SDMMR.sch">
    
    <title>Conformité d'un document CDAr2 au volet SDMMR</title>
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
    <include href="include/SDMMR_ModeleEntete20160809.sch"/>
    
            <!--=<<o#%@O[ Sections ]O@%#o>>=-->
    
    <include href="include/sections/codedAdvanceDirectives20150701.sch"/>
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/codedResults20110725.sch"/>
    <include href="include/sections/medications_ASIP20170130.sch"/>
    <include href="include/sections/CodedCarePlan20160802.sch"/>
    <include href="include/sections/HospitalAdmissionDiagnosisSection20160809.sch"/>
    <include href="include/sections/newbornDeliverySection20131025.sch"/>
    <include href="include/sections/proceduresInterventionSection20120827.sch"/>
    <include href="include/sections/codedVitalSigns20110627.sch"/>
    <include href="include/sections/prenatalEvents20110725.sch"/>
    <include href="include/sections/codedEventOutcomeSection20131024.sch"/>
    <include href="include/sections/pregnancyHistorySection20110725.sch"/>
    <include href="include/sections/codedFamilyMedicalHistory20120718.sch"/>
    
            <!--=<<o#%@O[ Entrées ]O@%#o>>=-->
    
    <include href="include/sections/entries/advanceDirectiveObservation20150701.sch"/>
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/>
    <include href="include/sections/entries/MedicationEntry_ASIP20170130.sch"/>
    <include href="include/sections/entries/ObservationRequestEntry20160105.sch"/>
    <include href="include/sections/entries/encountersEntry20110725.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/VitalSignsObservation20131024.sch"/>
    <include href="include/sections/entries/codedVitalSignsOrg20120306.sch"/>
    <include href="include/sections/entries/problemStatusObservation20110803.sch"/>
    <include href="include/sections/entries/pregnancyObservation20130821.sch"/>
    <include href="include/sections/entries/FamilyHistoryOrganizer20120723.sch"/>
    <include href="include/sections/entries/healthStatusObservation20160809.sch"/>
    <include href="include/sections/entries/DateTimeOfDeath20160809.sch"/>
    
        <!--=<<o#%@O[ JDV ]O@%#o>>=-->
        
    <include href="include/sections/entries/SDMMR_Age20160811.sch"/>
    <include href="include/sections/entries/SDMMR_AppreciationDiagnosticCentre20160811.sch"/>
    <include href="include/sections/entries/SDMMR_CasSporadiqueFamilial20160811.sch"/>
    <include href="include/sections/entries/SDMMR_MalformationAntenatale20160811.sch"/>
    <include href="include/sections/entries/SDMMR_ModeConfirmationDiagnostic20160811.sch"/>
    <include href="include/sections/entries/SDMMR_ObjectifActivite20160811.sch"/>
    <include href="include/sections/entries/SDMMR_PatientAdressePar20160811.sch"/>
    <include href="include/sections/entries/SDMMR_StatutActuelDiagnostic20160811.sch"/>
    <include href="include/sections/entries/SDMMR_ContexteActivite20170307.sch"/>
    <include href="include/sections/entries/SDMMR_TechniquesDiagnostic20170517.sch"/>
    <include href="include/sections/entries/SDMMR_InvestigationsRealisees20170517.sch"/>
        
        <phase id="SDMMR20160809">
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

                
                <!--activation section-->
                
                <active pattern="codedAdvanceDirectives-errors"/>
                <active pattern="activeProblemSection-errors"/>
                <active pattern="codedResults-errors"/>
                <active pattern="Medications_ASIP-errors"/>
                <active pattern="CodedCarePlanSection-errors"/>
                <active pattern="newbornDeliverySection-errors"/>
                <active pattern="proceduresInterventionSection-errors"/>
                <active pattern="codedVitalSigns-errors"/>
                <active pattern="prenatalEvents-errors"/>
                <active pattern="codedEventOutcomeSection-errors"/>
                <active pattern="pregnancyHistorySection-errors"/>
                <active pattern="codedFamilyMedicalHistory-errors"/>
                <active pattern="HospitalAdmissionDiagnosisSection-errors"/>
                
                <!-- Activation Entrées --> 
        
                <active pattern="advanceDirectiveObservation-errors"/>
                <active pattern="problemConcernEntry-errors"/>
                <active pattern="problemEntry-errors"/>
                <active pattern="simpleObservation-errors"/>
                <active pattern="MedicationEntry_ASIP-errors"/>
                <active pattern="ObservationRequestEntry-errors"/>
                <active pattern="encountersEntry-errors"/>
                <active pattern="procedureEntry-errors"/>
                <active pattern="VitalSignsObservation-errors"/>
                <active pattern="codedVitalSignsOrg-errors"/>
                <active pattern="problemStatusObservation-errors"/>
                <active pattern="pregnancyObservation-errors"/>
                <active pattern="familyHistoryOrganizer-errors"/>
                <active pattern="healthStatusObservation-errors"/>
                <active pattern="dateTimeOfDeath-errors"/>
        
        
                <!-- Activation JDV --> 
                
        
                <active pattern="SDMMR_Age"/>
                <active pattern="SDMMR_AppreciationDiagnosticCentre"/>
                <active pattern="SDMMR_CasSporadiqueFamilial"/>
                <active pattern="SDMMR_MalformationAntenatale"/>
                <active pattern="SDMMR_ModeConfirmationDiagnostic"/>
                <active pattern="SDMMR_ObjectifActivite"/>
                <active pattern="SDMMR_StatutActuelDiagnostic"/>
                <active pattern="SDMMR_PatientAdressePar"/>
                <active pattern="SDMMR_ContexteActivite"/>
                <active pattern="SDMMR_TechniquesDiagnostic"/>
                <active pattern="SDMMR_InvestigationsRealisees"/>
                
        </phase>
        
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
                
                <let name="jdv_typeCode" value="'../jeuxDeValeurs/JDV_J07-XdsTypeCode_CI-SIS.xml'"/>
                <let name="jdv_practiceSettingCode" value="'../jeuxDeValeurs/JDV_J04-XdsPracticeSettingCode_CI-SIS.xml'"/>
                <let name="jdv_healthcareFacilityTypeCode" value="'../jeuxDeValeurs/JDV_J02-HealthcareFacilityTypeCode_CI-SIS.xml'"/>
                <let name="jdv_authorSpecialty" value="'../jeuxDeValeurs/JDV_J01-XdsAuthorSpecialty-CI-SIS.xml'"/>
                <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
                <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/JDV_HealthStatusCodes_CI-SIS.xml'"/>
                <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/JDV_ClinicalStatusCodes_CI-SIS.xml'"/>
                
                <let name="jdv_Age" value="'../jeuxDeValeurs/JDV_Age_CI-SIS.xml'"/>
                <let name="jdv_AppreciationDiagnosticCentre" value="'../jeuxDeValeurs/JDV_AppreciationDiagnosticCentre_CI-SIS.xml'"/>
                <let name="jdv_CasSporadiqueFamilial" value="'../jeuxDeValeurs/JDV_CasSporadiqueFamilial_CI-SIS.xml'"/>
                <let name="jdv_MalformationAntenatale" value="'../jeuxDeValeurs/JDV_MalformationAntenatale_CI-SIS.xml'"/>
                <let name="jdv_ModeConfirmationDiagnostic" value="'../jeuxDeValeurs/JDV_ModeConfirmationDiagnostic_CI-SIS.xml'"/>
                <let name="jdv_ObjectifActivite" value="'../jeuxDeValeurs/JDV_ObjectifActivite_CI-SIS.xml'"/>
                <let name="jdv_StatutActuelDiagnostic" value="'../jeuxDeValeurs/JDV_StatutActuelDiagnostic_CI-SIS.xml'"/>
                <let name="jdv_PatientAdressePar" value="'../jeuxDeValeurs/JDV_PatientAdressePar_CI-SIS.xml'"/>
                <let name="jdv_ContexteActivite" value="'../jeuxDeValeurs/JDV_ContexteActivite_CI-SIS.xml'"/>
                <let name="jdv_TechniquesDiagnostic" value="'../jeuxDeValeurs/JDV_TechniquesDiagnostic_CI-SIS.xml'"/>
                <let name="jdv_InvestigationsRealisees" value="'../jeuxDeValeurs/JDV_InvestigationsRealisees_CI-SIS.xml'"/>
                
                
         </pattern>
</schema>