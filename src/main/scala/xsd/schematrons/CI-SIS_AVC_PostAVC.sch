<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    CI-SIS_POST_AVC.sch - ASIP/PRAS
   
    ......................................................................................................................................................    
    Historique :
        01/08/16 : CRI : Création 
        02/03/17 : NMA : Ajout de l'appel au schématran ProblemEntry
                            
 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="PostAVC-20160802"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_AVC_PostAVC.sch">
    <title>Conformité d'un document CDAr2 au volet Evaluation Pluri Professionnelle Post AVC </title>
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
    <include href="include/participant_PostAVC.sch"/> 
    <include href="include/PostAVC_ModeleEnTete20160425.sch"/> 
   
    <!--Section--> 
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/neurologicPhysicalExam20110627.sch"/>
    <include href="include/sections/CodedCarePlan20160802.sch"/>
    <include href="include/sections/PhysicalFunction20160802.sch"/>
    <include href="include/sections/ProcedureCarePlan20160804.sch"/>
    <include href="include/sections/generalAppearancePhysicalExam20110627.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
    
  
    <!--Entrée-->
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>  
    <include href="include/sections/entries/simpleObservation200110725.sch"/> 
    <include href="include/sections/entries/ObservationRequestEntry20160105.sch"/>
    <include href="include/sections/entries/SurveyObservation20160805.sch"/>
    
   
 
     
    <!--JDV-->  
    <include href="include/sections/entries/AVC_Appareillage20160801.sch"/>
    <include href="include/sections/entries/AVC_Activite20160801.sch"/>
    <include href="include/sections/entries/AVC_GIR20160801.sch"/>
    <include href="include/sections/entries/AVC_Severite20160801.sch"/>
    <include href="include/sections/entries/AVC_TraitementPreventif20160801.sch"/>
    <include href="include/sections/entries/AVC_TraitementSuivi20160801.sch"/>
    <include href="include/sections/entries/AVC_Juridique20160801.sch"/>
    <include href="include/sections/entries/AVC_Avancement20160801.sch"/>
    
    
    
    
    <phase id="PostAVC-20160802">
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
        <active pattern="participant"/>
        <active pattern="PostAVC_ModeleEnTete"/>
        
        <!--activation section-->
        <active pattern="activeProblemSection-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="neurologicPhysicalExam-errors"/>
        <active pattern="CodedCarePlanSection-errors"/>
        <active pattern="PhysicalFunctionSection-errors"/>
        <active pattern="ProcedureCarePlanSection-errors"/>
        <active pattern="generalAppearancePhysicalExam-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        
        <!--Activation entrée-->
        <active pattern="problemEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="ObservationRequestEntry-errors"/>
        <active pattern="SurveyObservation-errors"/> 
        
        <!--Activation JDV-->
        <active pattern="AVC_Appareillage"/>
        <active pattern="AVC_Activite"/>
        <active pattern="AVC_GIR"/>
        <active pattern="AVC_Juridique"/>
        <active pattern="AVC_Severite"/>
        <active pattern="AVC_TraitementSuivi"/>
        <active pattern="AVC_Avancement"/>
        <active pattern="AVC_TraitementPreventif"/> 
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
        
        <let name="jdv_AVC_Activite" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_Activite.xml'"/> 
        <let name="jdv_AVC_Appareillage" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_Appareillage.xml'"/> 
        <let name="jdv_AVC_GIR" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_GIR.xml'"/> 
        <let name="jdv_AVC_Juridique" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_Juridique.xml'"/> 
        <let name="jdv_AVC_Severite" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_Severite.xml'"/> 
        <let name="jdv_AVC_Avancement" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_Avancement.xml'"/> 
        <let name="jdv_AVC_TraitementPreventif" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_TraitementPreventif.xml'"/> 
        <let name="jdv_AVC_TraitementSuivi" value="'../jeuxDeValeurs/CI-SIS_JDV_AVC_TraitementSuivi.xml'"/> 
       
   </pattern>      
     
    
</schema>

