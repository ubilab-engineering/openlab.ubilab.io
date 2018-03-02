<?xml version="1.0" encoding="UTF-8"?>
<!-- 
                 -=-=-=-=-=-=<<ox#%@O[ CI-SIS_CertificatSanteCS8.sch - ASIP/PRAS ]O@%#xo>>=-=-=-=-=-=-
   
    Vérification de la conformité sémantique au volet Certificats de Santé de l'Enfant du CI-SIS.
   
    Historique :
    
        24/06/11 : CRI : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch pour le volet "Certificats de Santé de l'Enfant" (composant CS8) du CI-SIS de l'ASIP
        06/03/12 : CRI : Supression des références à SNOMED CT
        19/04/2013 : CRI : Adaptation modifications vocabulaires et intégration des fichiers inclus
        27/05/2015 : JDS : Ajout du schématron sections/abdomenPhysicalExam20110627.sch
                           Mise à jour du schématron CSEgeneralAppEnt20120306.sch -> CSEgeneralAppEnt20150522.sch
                           Maj des include telecom20110728.sch                        -> telecom20150317.sch
                           
                                             
                       .
-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CS8-20130326"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CertificatSanteCS8.sch">
    <title>Conformité d'un document CDAr2 au volet Certificat de santé de l'enfant (modèle CS8) du CI-SIS</title>
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
    <include href="include/assignedAuthor20110728.sch"/>
    <include href="include/assignedEntity20121008.sch"/>
    <include href="include/authenticatorName20110627.sch"/>
    <include href="include/authorPersonName20110627.sch"/>
    <include href="include/authorSpecialty20110627.sch"/>
    <include href="include/authorTime20110627.sch"/>
    <include href="include/custodianOrganization20110728.sch"/>
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
    <include href="include/CS8ModeleEnTete20110727.sch"/> 
    
    
                                    <!--=<<o#%@O[ sections communes ]O@%#o>>=-->
    
    
    <include href="include/sections/CodedAntenatalTestingAndSurveillance20110725.sch"/>
    <include href="include/sections/codedPhysicalExam20110627.sch"/>
    <include href="include/sections/codedResults20110725.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
    <include href="include/sections/earsPhysicalExam20110627.sch"/>
    <include href="include/sections/carePlan20110627.sch"/>
    <include href="include/sections/codedVitalSigns20110627.sch"/>
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/assessmentAndPlan20110627.sch"/>
    <include href="include/sections/encounterHistoriesSection20110725.sch"/>
    <include href="include/sections/generalAppearancePhysicalExam20110627.sch"/>
    <include href="include/sections/genitaliaPhysicalExam20110627.sch"/>
    <include href="include/sections/heartPhysicalExam20110627.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/immunizations20110627.sch"/>
    <include href="include/sections/laborAndDeliverySection20130326.sch"/>
    <include href="include/sections/musculoPhysicalExam20110627.sch"/>
    <include href="include/sections/neurologicPhysicalExam20110627.sch"/>
    <include href="include/sections/pregnancyHistorySection20110725.sch"/>
    <include href="include/sections/prenatalEvents20110725.sch"/>
    <include href="include/sections/proceduresInterventionSection20120827.sch"/>
    <include href="include/sections/abdomenPhysicalExam20110627.sch"/>
    
                                <!--=<<o#%@O[ sections spécifiques au volet ]O@%#o>>=-->
    
    <include href="include/sections/CS8codedPhysicalExam20110725.sch"/>
    <!--  
    <include href="include/sections/CSEcarePlan20110725.sch"/>-->
    <!-- NMA: Cette section n'est pas utilisée
        <include href="include/sections/CSEcodedResultsSubsections20110725.sch"/>-->
    
                                    <!--=<<o#%@O[ entrées communes ]O@%#o>>=-->
    
    <include href="include/sections/entries/codedVitalSignsOrg20120306.sch"/>
    <include href="include/sections/entries/codedAntenatalTestingAndSurveillanceOrg20110725.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>
    <include href="include/sections/entries/concernEntry20120827.sch"/>
    <include href="include/sections/entries/encountersEntry20110725.sch"/>
    <include href="include/sections/entries/immunizationsEnt20110627.sch"/>
    <include href="include/sections/entries/observationInterpretation20110722.sch"/>
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/>  

    
                                 <!--=<<o#%@O[ entrées spécifiques au volet ]O@%#o>>=-->
    

    <include href="include/sections/entries/CSECodedVitalSignsEnt20110725.sch"/>
    <include href="include/sections/entries/CSECodedAntenatalTestingAndSurveillanceEnt20130326.sch"/>
    <include href="include/sections/entries/CSEcodedResultsEntries20110725.sch"/>
    <include href="include/sections/entries/CSEcodedSocialHistoryEnt20120306.sch"/>
    <include href="include/sections/entries/CSEearsEnt20120306.sch"/>
    <include href="include/sections/entries/CSEgeneralAppEnt20150522.sch"/>
    <include href="include/sections/entries/CSEGenitaliaEnt20120306.sch"/>
    <include href="include/sections/entries/CSEHeartEnt20120306.sch"/>
    <include href="include/sections/entries/CSENeurologicEnt20130326.sch"/>
    <include href="include/sections/entries/CSEabdomenEnt20120306.sch"/>
    <include href="include/sections/entries/CSEimmunizationsEnt20120306.sch"/>
    <include href="include/sections/entries/CSElaborAndDeliveryEnt20130326.sch"/>
    <include href="include/sections/entries/CSERechHbs20130821.sch"/>
    <include href="include/sections/entries/CSECatProf20130821.sch"/>
    <include href="include/sections/entries/CSEpregnancyHistoryEntries20130326.sch"/>
    <include href="include/sections/entries/CSEhistoryOfPastIllnessEnt20110630.sch"/>
    <include href="include/sections/entries/CSEmusculoEnt20110725.sch"/>
    

    
                                     <!--=<<o#%@O[ value sets ]O@%#o>>=-->   
  
    <include href="include/activProf20110627.sch"/>
    <include href="include/typeTrans20171123.sch"/>
    <include href="include/sections/entries/dateCons20110727.sch"/>
    <include href="include/sections/entries/demConsult20110727.sch"/>
    <include href="include/nivEtude20110627.sch"/>
    <include href="include/sections/entries/rechAgHbS20110727.sch"/>
    <include href="include/sections/entries/typPres20110727.sch"/>
    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/AllergyAndIntoleranceCodes20110728.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CS8-20130326">
        <active pattern="variables"/>
        <!-- en-tête et génériques -->
        

        <active pattern="CS8ModeleEnTete"/>
        <active pattern="addr"/>
        <active pattern="administrativeGenderCode"/>
        <active pattern="assignedAuthor"/>       
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
        <active pattern="representedCustodianOrganization"/>
        <active pattern="serviceEventEffectiveTime"/>
        <active pattern="serviceEventPerformer"/>
        <active pattern="telecom"/>   
        
        <!-- 
 
        -->
        
                                   <!--=<<o#%@O[ activation sections communes ]O@%#o>>=-->  
         <active pattern="abdomenPhysicalExam-errors"/>
        <active pattern="codedVitalSigns-errors"/>
        
        <active pattern="activeProblemSection-errors"/>
        <active pattern="assessmentAndPlan-errors"/>
        <active pattern="carePlan-errors"/>
        <active pattern="CodedAntenatalTestingAndSurveillance-errors"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrg-errors"/>
        <active pattern="codedPhysicalExam-errors"/>
        <active pattern="codedResults-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        
        <active pattern="EarsPhysicalExam-errors"/>
        <active pattern="encounterHistoriesSection-errors"/>
        <active pattern="generalAppearancePhysicalExam-errors"/>
        <active pattern="genitaliaPhysicalExam-errors"/>
        <active pattern="heartPhysicalExam-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="immunizations-errors"/>
        <active pattern="laborAndDeliverySection-errors"/>
        <active pattern="musculoPhysicalExam-errors"/>
        <active pattern="neurologicPhysicalExam-errors"/>
        <active pattern="pregnancyHistorySection-errors"/>
        <active pattern="prenatalEvents-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="proceduresInterventionSection-errors"/>      
            
                                 <!--=<<o#%@O[ activation sections spécifiques ]O@%#o>>=-->

        <active pattern="CS8codedPhysicalExam-errors"/>  
        
                                 <!--=<<o#%@O[ activation entrées communes ]O@%#o>>=-->
        
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrg-errors"/> 
        <active pattern="codedVitalSignsOrg-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="encountersEntry-errors"/>
        <active pattern="HealthStatusCodes"/>
        <active pattern="immunizationsEnt-errors"/>
        <active pattern="observationInterpretation"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="simpleObservation-errors"/>       
        
                                 <!--=<<o#%@O[ activation entrées spécifiques ]O@%#o>>=-->


        <active pattern="CSECodedVitalSignsEnt-errors"/>
        <active pattern="CSEabdomenEnt-errors"/>
        <active pattern="CSECodedAntenatalTestingAndSurveillanceEnt-errors"/>
        <active pattern="CSEcodedResultsEntries-errors"/>
        <active pattern="CSEcodedSocialHistoryEnt-errors"/>
        <active pattern="CSERechHbs-errors"/>
        <active pattern="CSECatProf-errors"/>
        <active pattern="CSEearsEnt-errors"/>
        <active pattern="CSEgeneralAppEnt-errors"/>
        <active pattern="CSEGenitaliaEnt-errors"/>
        <active pattern="CSEHeartEnt-errors"/>
        <active pattern="CSEhistoryOfPastIllnessEnt-errors"/>
        <active pattern="CSEimmunizationsEnt-errors"/>
        <active pattern="CSElaborAndDeliveryEnt-errors"/>
        <active pattern="CSEmusculoEnt-errors"/>
        <active pattern="CSENeurogicEnt-errors"/>
        <active pattern="CSEpregnancyHistoryEntries-errors"/>

                                        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        <active pattern="nivEtude"/>
        <active pattern="activProf"/>
        <active pattern="typeTrans"/>
        <active pattern="demConsult"/>
        <active pattern="dateCons"/>
        <active pattern="typPres"/>
        <active pattern="typPres"/>
        <active pattern="HealthStatusCodes"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
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
        <let name="jdv_activProf" value="'../jeuxDeValeurs/CI-SIS_jdv_activProf.xml'"/>
        <let name="jdv_typeTrans" value="'../jeuxDeValeurs/JDV_TypeTrans_CI-SIS.xml'"/>
        <let name="jdv_nivEtude" value="'../jeuxDeValeurs/CI-SIS_jdv_nivEtude.xml'"/>
        <let name="jdv_demConsult" value="'../jeuxDeValeurs/CI-SIS_jdv_demConsult.xml'"/>
        <let name="jdv_dateCons" value="'../jeuxDeValeurs/CI-SIS_jdv_dateCons.xml'"/>
        <let name="jdv_typPres" value="'../jeuxDeValeurs/CI-SIS_jdv_typPres.xml'"/>
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/JDV_HealthStatusCodes_CI-SIS.xml'"/>
        <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/CI-SIS_jdv_ClinicalStatusCodes.xml'"/>
        <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/JDV_ProblemCodes_CI-SIS.xml'"/>
        <let name="jdv_AllergyAndIntoleranceCodes" value="'../jeuxDeValeurs/CI-SIS_jdv_AllergyAndIntoleranceCodes.xml'"/>
    </pattern>
</schema>
