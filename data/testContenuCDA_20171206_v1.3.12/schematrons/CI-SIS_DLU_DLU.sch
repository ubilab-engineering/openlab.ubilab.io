<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    DLU_FLUDT 
   auteur : Louis Beucherie
   version : 0.0.6 
   Ce volet décrit les données contenues dans un document de liaison d'urgence
   ......................................................................................................................................................    
    Historique :
       12/12/2016 : LBE : Création
       -->


<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="DLU12122016"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="DLU.sch">
    
        <title>Conformité d'un document CDAr2 au volet DLU</title>
        <ns prefix="cda" uri="urn:hl7-org:v3"/>
        <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
        <ns prefix="jdv" uri="http://esante.gouv.fr"/>
        <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
	<!--  Abstract patterns  -->
	<include href="abstract/dansJeuDeValeurs20131025.sch"/>
	<include href="abstract/IVL_TS20110627.sch"/>   
	<include href="abstract/personName20110627.sch"/>

	<!--  en-tête  -->
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

	<!--Sections-->
	<include href="include/sections/allergiesAndIntolerance20120718.sch"/>
	<include href="include/sections/codedAdvanceDirectives20150701.sch"/>
	<include href="include/sections/codedEventOutcomeSection20131024.sch"/>
	<include href="include/sections/activeProblemSection20110725.sch"/>
	<include href="include/sections/codedResults20110725.sch"/>
	<include href="include/sections/immunizations20110627.sch"/>
	<include href="include/sections/historyOfPastIllness20110627.sch"/>
	<include href="include/sections/CommentSection20161011.sch"/>
	<include href="include/sections/traitementLC20150319.sch"/>
	<include href="include/sections/EDDiagnosisSection20131030.sch"/>
	<include href="include/sections/elemClinRapportes20150119.sch"/>
	
	
	<!--Entrees-->
	<include href="include/sections/entries/AllergiesAndIntoleranceConcern20110803.sch"/>
	<include href="include/sections/entries/advanceDirectiveObservation20150701.sch"/>
	<include href="include/sections/entries/simpleObservation200110725.sch"/>
	<include href="include/sections/entries/problemConcernEntry20110627.sch"/>
	<include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/immunizationsEnt20110627.sch"/>
	<include href="include/sections/entries/encountersEntry20110725.sch"/>
	
	<!--JDV-->
	<include href="include/sections/entries/JDV_CheckListDLU_DLU.sch"/>
	
	
	<phase id="DLU12122016">
		<active pattern="variables"/>
		<p>Vérification complète de la conformité au CI-SIS</p>

		<!-- TO DO -->
		<!--<active pattern="Entete"/>-->
		<!-- Entete d'bord -->
		
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
		
		<!-- Pattern de section -->
		<active pattern="allergiesAndIntolerance-errors"/>
		<active pattern="codedAdvanceDirectives-errors"/>
		<active pattern="codedEventOutcomeSection-errors"/>
		<active pattern="codedResults-errors"/>
		<active pattern="immunizations-errors"/>
		<active pattern="AllergiesAndIntoleranceConcern-errors"/>
		<active pattern = "Comment-errors"/>
		<active pattern = "traitementLC-errors"/>
		<active pattern="EDDiagnosisSection-errors"></active>
		<active pattern="elemClinRapportes-errors"></active>
		
		
		<!-- Pattern des entrees -->
		<active pattern="advanceDirectiveObservation-errors"/>
		<active pattern="advanceDirectiveObservation-errors"/>
		<active pattern="simpleObservation-errors"/>
		<active pattern="simpleObservation-errors"/>
		<active pattern="problemConcernEntry-errors"/>
		<active pattern="procedureEntry-errors"/>
		<active pattern="simpleObservation-errors"/>
		<active pattern="immunizationsEnt-errors"/>
		<active pattern="encountersEntry-errors"></active>
		
		<!-- Pattern des jeux de valeurs -->
		<active pattern="JDV_CheckListDLU_DLU"></active>
		
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
		
		<!--variable des jeux de valeurs -->
		
		<let name="JDV_CheckListDLU_DLU" value = "'../jeuxDeValeurs/CI-SIS_JDV_DLU_ChecklistDLU.xml'"/>


	</pattern>
</schema>
