<?xml version="1.0" encoding="UTF-8"?>

<!-- CI-SIS, Volet Plan Personnalisé de Soins pour le Cancer
        Ce volet décrit les données prévu dans un plan de soins dans le cadre d'un traitement du cancer
        Certaines des données de ce volet sont issues de la Ficher Réunion Concertation Pluridisciplinaire
        Il est obligatoire que cette dernière est lieue avant d'établir un PPS
        
        Auteur : LBE 
        Version : 0.1
        Historque :
        22/01/2017 LBE : Création 
        31/01/2017 LBE : Ajout de la section Citation de documents et de l'entrée external reference
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="PPS_cancer"
        xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="PPS_Cancer.sch">

        <title>Conformité d'un document CDAr2 au volet </title>
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
        <include href="include/PPS-Cancer_ModeleEntete20170209.sch"/>

        <!--Sections-->

        <include href="include/sections/cancerDiagnosisSection20120827.sch"/>
        <include href="include/sections/progressNoteSection20120827.sch"/>
        <include href="include/sections/proceduresInterventionSection20120827.sch"/>
        <include href="include/sections/encounterHistoriesSection20110725.sch"/>
        <include href="include/sections/carePlan20110627.sch"/>
        <include href="include/sections/codedEventOutcomeSection20131024.sch"/>
        <include href="include/sections/CommentSection20161011.sch"/>
        <include href="include/sections/statutDocSection20130114.sch"/>
        <include href="include/sections/elemClinRapportes20150119.sch"/>
        <include href="include/sections/citationDocuments20170131.sch"/>
        
        <!--Entrees-->
        <include href="include/sections/entries/problemEntry20120827.sch"/>
        <include href="include/sections/entries/ObservationRequestEntry20160105.sch"/>
        <include href="include/sections/entries/medications20110804.sch"/>
        <include href="include/sections/entries/encountersEntry20110725.sch"/>
        <include href="include/sections/entries/procedureEntry20120827.sch"/>
        <include href="include/sections/entries/simpleObservation200110725.sch"/>
        <include href="include/sections/entries/organizerDocIncl20150119.sch"/>
        <include href="include/sections/entries/comments20110725.sch"/>
        <include href="include/sections/entries/externalReference20170131.sch"/>
        
        <!--JDV-->
        <include href="include/sections/entries/JDV_ModeAdministration.sch"/>
        <include href="include/sections/entries/JDV_JoursSemaine.sch"/>
        <include href="include/sections/entries/JDV_PriseEnCharge.sch"/>
        <include href="include/sections/entries/JDV_Demarche.sch"/>
        <include href="include/sections/entries/JDV_Addictions.sch"/>
        <include href="include/sections/entries/JDV_Examens.sch"/>
        <include href="include/sections/entries/JDV_StructuresDeSoins.sch"/>
        <include href="include/FRCP_StatutDoc20140109.sch"/>
        <include href="include/sections/entries/JDV_MotifMiseAJour.sch"/>


        <phase id="PPS_cancer">
                <active pattern="variables"/>
                <p>Vérification complète de la conformité au CI-SIS</p>


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
                <active pattern="PPS-Cancer_ModeleEntete"/>

                <!-- Sections -->
                <active pattern="cancerDiagnosis-errors"/>
                <active pattern="progressNote-errors"/>
                <active pattern="proceduresInterventionSection-errors"/>
                

                <active pattern="encounterHistoriesSection-errors"/>

                <active pattern="carePlan-errors"/>
                <active pattern="codedEventOutcomeSection-errors"/>
                <active pattern="Comment-errors"/>
                <active pattern="statutDocSection-errors"/>
              <!--  <active pattern="elemClinRapportes-errors"/>-->
                <active pattern="citationDocuments-errors"/>
              
                <!-- Entrees -->
                <active pattern="problemEntry-errors"/>
                <active pattern="medications-errors"/>
                <active pattern="encountersEntry-errors"/>
                <active pattern="procedureEntry-errors"/>
                <active pattern="simpleObservation-errors"/>
                <active pattern="comments-errors"/>
                <active pattern="ObservationRequestEntry-errors"/>
                <!--<active pattern="organizerDocIncl-errors"/>-->
                <active pattern="externalReference-errors"/>
                

                <!-- JDV -->
                <active pattern="JDV_ModeAdministration"/>
                <active pattern="JDV_JourSemaine"/>
                <active pattern="JDV_PriseEnCharge"/>
                <active pattern="JDV_Demarche"/>
                <active pattern="JDV_Addictions"/>
                <active pattern="JDV_Examens"/>
                <active pattern="JDV_StructuresDeSoins"/>
                <active pattern="FRCP_StatutDoc"/>
                <active pattern="JDV_MotifMiseAJour"></active>

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
                <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/JDV_ProblemCodes_CI-SIS.xml'"/>
                <let name="jdv_modeAdministration"
                        value="'../jeuxDeValeurs/JDV_ModeAdministration_CI-SIS.xml'"/>
                <let name="jdv_joursSemaine" value="'../jeuxDeValeurs/JDV_JoursSemaine_CI-SIS.xml'"/>
                <let name="jdv_priseEnCharge"
                        value="'../jeuxDeValeurs/JDV_PriseEnCharge_CI-SIS.xml'"/>
                <let name="jdv_demarche" value="'../jeuxDeValeurs/JDV_Demarche_CI-SIS.xml'"/>
                <let name="jdv_addictions" value="'../jeuxDeValeurs/JDV_Addictions_CI-SIS.xml'"/>
                <let name="jdv_examens" value="'../jeuxDeValeurs/JDV_Examens_CI-SIS.xml'"/>
                <let name="jdv_structuresDeSoins"
                        value="'../jeuxDeValeurs/JDV_StructuresDeSoins_CI-SIS.xml'"/>
                <let name="jdv_FRCP_StatutDoc" value="'../jeuxDeValeurs/JDV_StatutDoc_CI-SIS.xml'"/>
                <let name="jdv_miseAJour" value="'../jeuxDeValeurs/JDV_MotifMiseAJour_CI-SIS.xml'"/>

        </pattern>
</schema>
