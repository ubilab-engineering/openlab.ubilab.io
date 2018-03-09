<?xml version="1.0" encoding="UTF-8"?>
<!-- 

-=-=-=-=-=-=<<ox#%@OOX//[ CI-SIS_PatientsARisquesCardio.sch - ASIP/PRAS ]\\XO@%#xo>>=-=-=-=-=-=-
    
    Vérification de la conformité sémantique au volet Patients à Risques de Cardiologie du CI-SIS.
    
    Historique :
    
    24/06/11 : CRI : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch pour le volet 
    "Certificats de Santé de l'Enfant" (composant CS8) du CI-SIS de l'ASIP.
    01/08/11 : CRI : Ajout des spécificités et contraintes du volet du CI-SIS 
    "Patients à Risques de Cardiologie"
    08/10/12 : FMY : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                     Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)       
                     Prise en compte de la bonne version de l'include codedVitalSigns
                     Suppression des accents du nom du fichier UFCV_DispositifMedicalImplanteOrg20110826.sch
                     Actualisation nom de fichiers include problemEntry, concernentry, procedureentry 
    19/06/15 : JDS : Maj des include telecom20110728.sch                        -> telecom20150317.sch
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="latotale20121008"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_PatientsARisquesCardio.sch">
    <title>Conformité d'un document CDAr2 au volet Patients à Risques de Cardiologie du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>

    <!--=<<o#%@OX//[ Abstract patterns ]\\XO@%#o>>=-->
    
    
    <include href="abstract/dansJeuDeValeurs20110729.sch"/>
    <include href="abstract/IVL_TS20110627.sch"/>   
    <include href="abstract/personName20110627.sch"/>
    
    <!--=<<o#%@OX//[ en-tête ]\\XO@%#o>>=-->
    
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
    
    <!--=<<o#%@OX//[ sections communes ]\\XO@%#o>>=-->
    
    <include href="include/sections/abdomenPhysicalExam20110627.sch"/>
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/assessmentAndPlan20110627.sch"/>
    <include href="include/sections/carePlan20110627.sch"/>
    <include href="include/sections/childFunctionalStatusAssessment20131025.sch"/>
    <include href="include/sections/childFunctionalStatusEatingSleeping20110627.sch"/>
    <include href="include/sections/childFunctionalStatusPsychomot20110627.sch"/>
    <include href="include/sections/CodedAntenatalTestingAndSurveillance20110725.sch"/>
    <include href="include/sections/codedPhysicalExam20110627.sch"/>
    <include href="include/sections/codedResults20110725.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
    <include href="include/sections/codedVitalSigns20110627.sch"/>
    <include href="include/sections/earsPhysicalExam20110627.sch"/>
    <include href="include/sections/encounterHistoriesSection20110725.sch"/>
    <include href="include/sections/endocrinePhysicalExam20110627.sch"/>
    <include href="include/sections/eyesPhysicalExam20110627.sch"/>
    <include href="include/sections/generalAppearancePhysicalExam20110627.sch"/>
    <include href="include/sections/genitaliaPhysicalExam20110627.sch"/>
    <include href="include/sections/heartPhysicalExam20110627.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/immunizations20110627.sch"/>
    <include href="include/sections/integumentaryPhysicalExam20110627.sch"/>
    <include href="include/sections/laborAndDeliverySection20130326.sch"/>
    <include href="include/sections/lymphaticPhysicalExam20110627.sch"/>
    <include href="include/sections/musculoPhysicalExam20110627.sch"/>
    <include href="include/sections/neurologicPhysicalExam20110627.sch"/>
    <include href="include/sections/pregnancyHistorySection20110725.sch"/>
    <include href="include/sections/prenatalEvents20110725.sch"/> 
    <include href="include/sections/proceduresInterventionSection20120827.sch"/>
    <include href="include/sections/respiratoryPhysicalExam20110627.sch"/> 
    <include href="include/sections/teethPhysicalExam20110627.sch"/>
    
    <!-- Nouvelles sections -->
    
    <include href="include/sections/patientEducationAndConsents20110805.sch"/>
    
    <!--=<<o#%@OX//[ sections spécifiques au volet ]\\XO@%#o>>=-->
    
    
    <!--=<<o#%@O[ entrées communes ]O@%#o>>=-->
    
    <include href="include/sections/entries/ACPimageIllustrative20110727.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/codedAntenatalTestingAndSurveillanceOrg20110725.sch"/>
    <include href="include/sections/entries/codedVitalSignsOrg20120306.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>
    <include href="include/sections/entries/concernEntry20120827.sch"/>
    <include href="include/sections/entries/encountersEntry20110725.sch"/>
    <include href="include/sections/entries/immunizationsEnt20110627.sch"/>
    <include href="include/sections/entries/observationInterpretation20110722.sch"/>
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/>
    
    <!-- Nouvelles entrées communes -->
    
    <include href="include/sections/entries/medications20110804.sch"/>
    <include href="include/sections/entries/product20110802.sch"/>
    <include href="include/sections/entries/AllergiesAndIntoleranceConcern20110803.sch"/>
    <include href="include/sections/entries/AllergiesAndIntolerances20161116.sch"/>
    <include href="include/sections/entries/problemStatusObservation20110803.sch"/>
    <include href="include/sections/entries/CI-SIS_medications20120830.sch"/>
      
    <!--=<<o#%@O[ entrées spécifiques au volet ]@%#o>>=-->
    
    <include href="include/sections/entries/UFCV_AllergiesAndIntolerances20110804.sch"/>
    <include href="include/sections/entries/UFCV_DispositifMedicalImplanteOrg20110826.sch"/>
    <include href="include/sections/entries/UFCV_StimulateurOrg20110824.sch"/>
    <include href="include/sections/entries/UFCV_DefibrillateurOrg20110824.sch"/>
    <include href="include/sections/entries/UFCV_SondeDefOrg20110831.sch"/>
    <include href="include/sections/entries/UFCV_SondeStimOrg20110831.sch"/>
    <include href="include/sections/entries/UFCV_ProtheseValvulaireOrg20110831.sch"/>
    <include href="include/sections/entries/UFCV_EndoprotheseOrg20110831.sch"/>
    
    <!--=<<o#%@OX//[ value sets ]\\XO@%#o>>=-->
    
    <include href="include/sections/entries/AllergyAndIntoleranceCodes20110728.sch"/>
    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="latotale20121008">
        
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
        
        <!--=<<o#%@O[ activation sections communes ]O@%#o>>=-->
        
        <active pattern="abdomenPhysicalExam-errors"/>
        <active pattern="activeProblemSection-errors"/>
        <active pattern="assessmentAndPlan-errors"/>
        <active pattern="carePlan-errors"/>
        <active pattern="childFunctionalStatusAssessment-errors"/>
        <active pattern="childFunctionalStatusEatingSleeping-errors"/>
        <active pattern="childFunctionalStatusPsychoMot-errors"/>
        <active pattern="CodedAntenatalTestingAndSurveillance-errors"/>  
        <active pattern="codedPhysicalExam-errors"/>
        <active pattern="codedResults-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        <active pattern="codedVitalSigns-errors"/>
        <active pattern="EarsPhysicalExam-errors"/>
        <active pattern="encounterHistoriesSection-errors"/>
        <active pattern="endocrinePhysicalExam-errors"/> 
        <active pattern="eyesPhysicalExam-errors"/>
        <active pattern="generalAppearancePhysicalExam-errors"/>
        <active pattern="genitaliaPhysicalExam-errors"/>
        <active pattern="heartPhysicalExam-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="immunizations-errors"/>
        <active pattern="integumentaryPhysicalExam-errors"/>
        <active pattern="laborAndDeliverySection-errors"/>
        <active pattern="lymphaticPhysicalExam-errors"/>
        <active pattern="musculoPhysicalExam-errors"/>
        <active pattern="neurologicPhysicalExam-errors"/>
        <active pattern="pregnancyHistorySection-errors"/>
        <active pattern="prenatalEvents-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="proceduresInterventionSection-errors"/>   
        <active pattern="RespiratoryPhysicalExam-errors"/>
        <active pattern="teethPhysicalExam-errors"/>
        
        <!-- Nouvelles activations -->

        <active pattern="patientEducationAndConsents-errors"/>
        
        <!--=<<o#%@O[ activation sections spécifiques ]O@%#o>>=-->
        
        <!--=<<o#%@O[ activation entrées communes ]O@%#o>>=-->
        
        <active pattern="ACPimageIllustrative"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrg-errors"/> 
        <active pattern="codedVitalSignsOrg-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="encountersEntry-errors"/>
        <active pattern="immunizationsEnt-errors"/>
        <active pattern="observationInterpretation"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="simpleObservation-errors"/>
        
        <!-- Nouvelles activations -->
        <active pattern="medications-errors"/>
        <active pattern="product-errors"/>
        <active pattern="AllergiesAndIntolerances-errors"/>
        <active pattern="AllergiesAndIntoleranceConcern-errors"/>
        <active pattern="problemStatusObservation-errors"/>
        <active pattern="UFCV_AllergiesAndIntolerances-errors"/>
        <active pattern="CI-SIS_medications-errors"/>
        <active pattern="UFCV_DispositifMédicalImplantéOrg-errors"/>


        <active pattern="UFCV_StimulateurOrg-errors"/>  
        <active pattern="UFCV_DefribrillateurOrg-errors"/>
        <active pattern="UFCV_SondeDefOrg-errors"/>
        <active pattern="UFCV_SondeStimOrg-errors"/>
        <active pattern="UFCV_ProtheseValvulaireOrg-errors"/>
        <active pattern="UFCV_StimulateurOrg-errors"/>
        <active pattern="UFCV_EndoprotheseOrg-errors"/>
        

        <!--=<<o#%@O[ activation entrées spécifiques ]O@%#o>>=-->
        
        
        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
        <active pattern="HealthStatusCodes"/>

    </phase>
    
    <!--    Historique des phases des versions antérieures supprimé car alourdit la compilation    -->  

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
        <let name="jdv_AllergyAndIntoleranceCodes" value="'../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType_CI-SIS.xml'"/>
    </pattern>
 
</schema>
