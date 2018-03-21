<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP_SNM.sch - ASIP/PRAS
   
    ......................................................................................................................................................    
    Historique :
        17/10/13 : CRI : Création
        19/06/15 : JDS : Maj des include telecom20110728.sch                        -> telecom20150317.sch
        

-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="SNM-20131017"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP_SAP.sch">
    <title>Conformité d'un document CDAr2 au volet OBP - Salle de Naissance Mère (SNM) du CI-SIS</title>
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
    <include href="include/SNM_ModeleEnTete20131017.sch"/> 
    
                 <!--=<<o#%@O[ Sections ]O@%#o>>=-->
    
     <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/medicationsAdministered20131018.sch"/>
    <include href="include/sections/statutDocSection20130114.sch"/>
    <include href="include/sections/laboratorySpecialtySection20131022.sch"/>  
    <include href="include/sections/laborAndDeliverySection20130326.sch"/>
    <include href="include/sections/proceduresInterventionSection20120827.sch"/>
    <include href="include/sections/codedEventOutcomeSection20131024.sch"/>
    <include href="include/sections/codedResults20110725.sch"/>
    <include href="include/sections/importationConclusionCRSection20120827.sch"/>
    

                  <!--=<<o#%@O[ Entrées ]O@%#o>>=-->
    
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>
    <include href="include/sections/entries/concernEntry20120827.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/> 
    <include href="include/sections/entries/medications20110804.sch"/>
    <include href="include/sections/entries/patientTransfer20131024.sch"/>
    <include href="include/sections/entries/SNM_problemEntryValue20131024.sch"/>
    <include href="include/sections/entries/SNM_procedureInterventionValues20131024.sch"/>
    
    
    
    
    
                       <!--=<<o#%@O[ Value sets ]O@%#o>>=-->

    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/AllergyAndIntoleranceCodes20110728.sch"/>
    <include href="include/sections/entries/OBP_MotifDeclenchementTravail20131025.sch"/>
    <include href="include/sections/entries/OBP_TypeAnesthesieAvantNaissance20131025.sch"/>
    <include href="include/sections/entries/OBP_TypeAnesthesieApresNaissance20131025.sch"/>
    <include href="include/sections/entries/OBP_TypeActePostPartum20131025.sch"/>
    <include href="include/sections/entries/OBP_ModeDebutTravail20131025.sch"/>
    <include href="include/sections/entries/OBP_ComplicationsAnesthesie20131025.sch"/>
    

    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="SNM-20131017">
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
        <active pattern="SNM_ModeleEnTete"/> 
        
        <!--=<<o#%@O[ activation sections ]O@%#o>>=-->
        
        <active pattern="activeProblemSection-errors"/>
        <active pattern="medicationsAdministered-errors"/>
        <active pattern="statutDocSection-errors"/>
        <active pattern="laborAndDeliverySection-errors"/>
        <active pattern="proceduresInterventionSection-errors"/>
        <active pattern="codedEventOutcomeSection-errors"/>
        <active pattern="codedResults-errors"/>
        <active pattern="importationConclusionCR-errors"/>
        
        
        <!--=<<o#%@O[ activation Entrées ]O@%#o>>=-->
        
        <active pattern="problemEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="laboratorySpecialtySection-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="simpleObservation-errors"/>  
        <active pattern="medications-errors"/>
        <active pattern="patientTransfer-errors"/>
        <active pattern="SNM_problemEntryValue-errors"/>

        
     
        
        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        
        <active pattern="HealthStatusCodes"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="OBP_MotifDeclenchementTravail"/>
        <active pattern="OBP_TypeAnesthesieAvantNaissance"/>
        <active pattern="OBP_TypeAnesthesieApresNaissance"/>
        <active pattern="OBP_TypeActePostPartum"/>
        <active pattern="OBP_ModeDebutTravail"/>
        <active pattern="OBP_ComplicationsAnesthesie"/>
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
        <let name="jdv_OBP_MotifDeclenchementTravail" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_MotifDeclenchementTravail.xml'"/>
        <let name="jdv_OBP_TypeAnesthesieAvantNaissance" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TypeAnesthesieAvantNaissance.xml'"/>
        <let name="jdv_OBP_TypeAnesthesieApresNaissance" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TypeAnesthesieApresNaissance.xml'"/>
        <let name="jdv_OBP_TypeActePostPartum" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TypeActePostPartum.xml'"/>
        <let name="jdv_OBP_ModeDebutTravail" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_ModeDebutTravail.xml'"/>
        <let name="jdv_OBP_ComplicationsAnesthesie" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_ComplicationsAnesthesie.xml'"/>
        
        
    </pattern>
</schema>