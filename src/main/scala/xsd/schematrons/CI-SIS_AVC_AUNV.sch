<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_AVC_AUNV.sch - ASIP/PRAS
   
    ......................................................................................................................................................    
    Historique :
        29/10/13 : CRI : Création
        15/04/15 : JDS :    Ajout du schematron AVC_codedPhysicalExam20150415.sch ( vérification de la presence des sous sections obligatoires)
                            Ajout du schematron neurologicPhysicalExam20110627.sch
                            Mise à jour du schematron AVC_CodedReasonForReferralEntries20131030.sch -> AVC_CodedReasonForReferralEntries20150417.sch
                            Ajout du schematron immunoHemato20150506.sch
                            Ajout du schematron RankinScoreSection20150506.sch
                            Ajout du schematron GlasgowScoreSection20150506.sch
                            Ajout du schematron bilanPretherapeutique20150506.sch
                            Ajout du schematron AVC_activeProblemSection20150417.sch
                            Maj des include telecom20110728.sch                         -> telecom20150317.sch
                            Maj des include codedListOfSurgeries20120718.sch            -> codedListOfSurgeries20150319.sch
                            
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="AUNV-20131029"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_AVC_AUNV.sch">
    <title>Conformité d'un document CDAr2 au volet AVC - Admission en UNV (AUNV) du CI-SIS</title>
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
    <include href="include/AUNV_ModeleEnTete20131029.sch"/> 
    
                 <!--=<<o#%@O[ Sections ]O@%#o>>=-->
    
    <include href="include/sections/transportModeSection20131030.sch"/>
    <include href="include/sections/CodedReasonForReferral20131030.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
    <!--NMA:
        <include href="include/sections/activeProblemSection20120827.sch"/>
    -->
    <include href="include/sections/activeProblemSection20110725.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/codedListOfSurgeries20150319.sch"/>
    <include href="include/sections/admissionMedicationHistory20131030.sch"/>
    <include href="include/sections/medicationsAdministered20131018.sch"/>
    <include href="include/sections/codedPhysicalExam20110627.sch"/>
    <include href="include/sections/codedVitalSigns20110627.sch"/>
    <include href="include/sections/heartPhysicalExam20110627.sch"/>
    <include href="include/sections/thoraxAndLungsSection20131030.sch"/>
    <include href="include/sections/laboratorySpecialtySection20131022.sch"/>
    <include href="include/sections/codedResults20110725.sch"/>
    <include href="include/sections/intravenousFluidsAdministered20131030.sch"/>
    <include href="include/sections/NIHSSScoreSection20131030.sch"/>
    <include href="include/sections/statutDocSection20130114.sch"/>
    <include href="include/sections/EDDiagnosisSection20131030.sch"/>
    <include href="include/sections/AVC_CodedReasonForReferralEntries20150417.sch"/>
    
    <include href="include/sections/AVC_codedPhysicalExam20150415.sch"/>
    <include href="include/sections/AVC_activeProblemSection20150417.sch"/>
    <include href="include/sections/neurologicPhysicalExam20110627.sch"/>
    <include href="include/sections/immunoHemato20150506.sch"/>
    <include href="include/sections/RankinScoreSection20150506.sch"/>
    <include href="include/sections/GlasgowScoreSection20150506.sch"/>
    <include href="include/sections/bilanPretherapeutique20150506.sch"/>
    
              <!--=<<o#%@O[ Entrées ]O@%#o>>=-->
    
    <include href="include/sections/entries/problemConcernEntry20110627.sch"/>
    <include href="include/sections/entries/problemEntry20120827.sch"/>
    <include href="include/sections/entries/concernEntry20120827.sch"/>
    <include href="include/sections/entries/procedureEntry20120827.sch"/>
    <include href="include/sections/entries/socialHistoryObservation20130821.sch"/>
    <include href="include/sections/entries/codedVitalSignsOrg20120306.sch"/>
    <include href="include/sections/entries/VitalSignsObservation20131024.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>   
    <include href="include/sections/entries/simpleObservation200110725.sch"/> 
    <include href="include/sections/entries/medications20110804.sch"/>
    
    
    
    <!--=<<o#%@O[  Checkup des entrées obligatoires ]O@%#o>>=-->   
    
               <!--=<<o#%@O[ Value sets ]O@%#o>>=-->

    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/AVC_ModeTransport20131025.sch"/>
    <include href="include/sections/entries/AVC_TopoTrouble20131025.sch"/>
    <include href="include/sections/entries/AVC_lateralite20131025.sch"/>
    <include href="include/sections/entries/AVC_lateraliteManuelle20131025.sch"/>
    <include href="include/sections/entries/AVC_TypeTroubleVisuel20131025.sch"/>
    <include href="include/sections/entries/AVC_lateraliteTroubleVisuel20131025.sch"/>
    <include href="include/sections/entries/AVC_autreSymptomesNeuro20131025.sch"/>
    <include href="include/sections/entries/AVC_typeDiabète20131025.sch"/>
    <include href="include/sections/entries/AVC_typeMigraine20131025.sch"/>
    <include href="include/sections/entries/AVC_CddFA20131025.sch"/>
    <include href="include/sections/entries/AVC_siteIntervention20131025.sch"/>
    <include href="include/sections/entries/AVC_autreSymptomeExNeuro20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSConsInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSLocqInt20131025.sch"/> 
    <include href="include/sections/entries/AVC_NIHSSLoccInt20131025.sch"/> 
    <include href="include/sections/entries/AVC_NIHSSOculInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSCvInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSPfInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSMsInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSMiInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSAtaxInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSSensInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSLangInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSDysInt20131025.sch"/>
    <include href="include/sections/entries/AVC_NIHSSNeglInt20131025.sch"/>
    <include href="include/sections/entries/AVC_interpretationECG20131025.sch"/>
    <include href="include/sections/entries/AVC_typLesionImagerie20131025.sch"/>
    <include href="include/sections/entries/AVC_territoireInfarctus20131025.sch"/>
    <include href="include/sections/entries/AVC_artereAnt20131025.sch"/>
    <include href="include/sections/entries/AVC_arterePost20131025.sch"/>
    <include href="include/sections/entries/AVC_artereTronc20131025.sch"/>
    <include href="include/sections/entries/AVC_artereCervelet20131025.sch"/>
    <include href="include/sections/entries/AVC_hemisphereLobaire20131025.sch"/>
    <include href="include/sections/entries/AVC_hemisphereProfond20131025.sch"/>
    <include href="include/sections/entries/AVC_cerveletLoc20131025.sch"/>
    <include href="include/sections/entries/AVC_artereTroncHemo20131025.sch"/>
    <include href="include/sections/entries/AVC_LateraliteHemo20131025.sch"/>
    <include href="include/sections/entries/AVC_locaThromboseVeineuse20131025.sch"/>
    <include href="include/sections/entries/AVC_typeTraitementRt-PA20131025.sch"/>
    <include href="include/sections/entries/AVC_typeAdminstrationRt20131025.sch"/>
    <include href="include/sections/entries/AVC_statutEvt20131025.sch"/>
    <include href="include/sections/entries/AVC_SuiviDiabete20131025.sch"/>
    <include href="include/sections/entries/AVC_InterpretationScoreFisher20131025.sch"/>
    
    
    <!--=<<o:xoO000X#%@O[Phase en vigueur]O@%#X000Oox:o>>=-->
    
    <phase id="AUNV-20131029">
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
        <active pattern="AUNV_ModeleEnTete"/> 
        
        <!--=<<o#%@O[ activation sections ]O@%#o>>=-->
                
        <active pattern="CodedReasonForReferral-errors"/>
        
        <active pattern="transportModeSection-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        <active pattern="activeProblemSection-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="codedListOfSurgeries-errors"/>
        <active pattern="admissionMedicationHistory-errors"/>
        <active pattern="medicationsAdministered-errors"/>
        <active pattern="heartPhysicalExam-errors"/>
        <active pattern="codedVitalSigns-errors"/>
        <active pattern="thoraxAndLungsSection-errors"/>
        <active pattern="laboratorySpecialtySection-errors"/>
        <active pattern="codedResults-errors"/>
        <active pattern="intravenousFluidsAdministered-errors"/>
        <active pattern="NIHSSScoreSection-errors"/>
        <active pattern="statutDocSection-errors"/>
        <active pattern="AVCcodedPhysicalExam-errors"/>
        <active pattern="neurologicPhysicalExam-errors"/>
        <active pattern="immunoHemato-errors"/>
        <active pattern="RankinScoreSection-errors"/>
        <active pattern="GlasgowScoreSection-errors"/>
        <active pattern="bilanPretherapeutiqueSection-errors"/>
        <active pattern="activeProblemSection-errors"/>
        
        <!--=<<o#%@O[ activation Entrées ]O@%#o>>=-->
        
        <active pattern="problemEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="socialHistoryObservation-errors"/>
        <active pattern="codedVitalSignsOrg-errors"/>
        <active pattern="VitalSignsObservation-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="simpleObservation-errors"/>  
        <active pattern="medications-errors"/>       
        
        <!--=<<o#%@O[ activation Checkup Entrées ]O@%#o>>=-->
        
        <active pattern="AVC_CodedReasonForReferralEntries-errors"/>
        
        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        
        <active pattern="HealthStatusCodes"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AVC_ModeTransport"/>
        <active pattern="AVC_TopoTrouble"/>
        <active pattern="AVC_lateralite"/>
        <active pattern="AVC_lateraliteManuelle"/>
        <active pattern="AVC_TypeTroubleVisuel"/>
        <active pattern="AVC_lateraliteTroubleVisuel"/>
        <active pattern="AVC_autreSymptomesNeuro"/>
        <active pattern="AVC_typeDiabète"/>
        <active pattern="AVC_typeMigraine"/>
        <active pattern="AVC_CddFA"/>
        <active pattern="AVC_siteIntervention"/>
        <active pattern="AVC_autreSymptomeExNeuro"/>
        <active pattern="AVC_NIHSSConsInt"/> 
        <active pattern="AVC_NIHSSLocqInt"/>
        <active pattern="AVC_NIHSSLoccInt"/> 
        <active pattern="AVC_NIHSSOculInt"/>
        <active pattern="AVC_NIHSSCvInt"/>
        <active pattern="AVC_NIHSSPfInt"/>
        <active pattern="AVC_NIHSSMsInt"/>
        <active pattern="AVC_NIHSSMiInt"/>
        <active pattern="AVC_NIHSSSensInt"/>
        <active pattern="AVC_NIHSSLangInt"/>
        <active pattern="AVC_NIHSSDysInt"/>
        <active pattern="AVC_NIHSSNeglInt"/>
        <active pattern="AVC_interpretationECG"/>
        <active pattern="AVC_typLesionImagerie"/>
        <active pattern="AVC_territoireInfarctus"/>
        <active pattern="AVC_artereAnt"/>
        <active pattern="AVC_arterePost"/>
        <active pattern="AVC_artereTronc"/>
        <active pattern="AVC_artereCervelet"/>
        <active pattern="AVC_hemisphereLobaire"/>
        <active pattern="AVC_hemisphereProfond"/>
        <active pattern="AVC_cerveletLoc"/>
        <active pattern="AVC_artereTroncHemo"/>
        <active pattern="AVC_LateraliteHemo"/>
        <active pattern="AVC_typeTraitementRt-PA"/>
        <active pattern="AVC_typeAdminstrationRt"/>
        <active pattern="AVC_statutEvt"/>
        <active pattern="AVC_SuiviDiabete"/>
        <active pattern="AVC_InterpretationScoreFisher"/>
        
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
        <let name="jdv_ASIP_ModeDeTransport" value="'../jeuxDeValeurs/CI-SIS_jdv_ASIP_ModeDeTransport.xml'"/>
        <let name="jdv_AVC_TopoTrouble" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_TopoTrouble.xml'"/>
        <let name="jdv_lateralite" value="'../jeuxDeValeurs/CI-SIS_jdv_lateralite.xml'"/>
        <let name="jdv_lateraliteManuelle" value="'../jeuxDeValeurs/CI-SIS_jdv_lateraliteManuelle.xml'"/>
        <let name="jdv_AVC_TypeTroubleVisuel" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_TypeTroubleVisuel.xml'"/>
        <let name="jdv_AVC_autreSymptomesNeuro" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_autreSymptomesNeuro.xml'"/>
        <let name="jdv_AVC_typeDiabète" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_typeDiabète.xml'"/>
        <let name="jdv_AVC_typeMigraine" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_typeMigraine.xml'"/>
        <let name="jdv_AVC_CddFA" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_CddFA.xml'"/>
        <let name="jdv_AVC_siteIntervention" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_siteIntervention.xml'"/>
        <let name="jdv_AVC_autreSymptomeExNeuro" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_autreSymptomeExNeuro.xml'"/>
        <let name="jdv_AVC_NIHSSConsInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSConsInt.xml'"/>  
        <let name="jdv_AVC_NIHSSLocqInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSLocqInt.xml'"/>  
        <let name="jdv_AVC_NIHSSLoccInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSLoccInt.xml'"/>  
        <let name="jdv_AVC_NIHSSOculInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSOculInt.xml'"/>
        <let name="jdv_AVC_NIHSSCvInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSCvInt.xml'"/>
        <let name="jdv_AVC_NIHSSPfInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSPfInt.xml'"/>
        <let name="jdv_AVC_NIHSSMsInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSMsInt.xml'"/>
        <let name="jdv_AVC_NIHSSMiInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSMiInt.xml'"/>
        <let name="jdv_AVC_NIHSSAtaxInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSAtaxInt.xml'"/>
        <let name="jdv_AVC_NIHSSSensInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSSensInt.xml'"/>
        <let name="jdv_AVC_NIHSSLangInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSLangInt.xml'"/>
        <let name="jdv_AVC_NIHSSDysInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSDysInt.xml'"/>
        <let name="jdv_AVC_NIHSSNeglInt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_NIHSSNeglInt.xml'"/>
        <let name="jdv_AVC_interpretationECG" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_interpretationECG.xml'"/>
        <let name="jdv_AVC_typLesionImagerie" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_typLesionImagerie.xml'"/>
        <let name="jdv_AVC_territoireInfarctus" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_territoireInfarctus.xml'"/>
        <let name="jdv_AVC_artereAnt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_artereAnt.xml'"/>
        <let name="jdv_AVC_arterePost" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_arterePost.xml'"/>
        <let name="jdv_AVC_artereTronc" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_artereTronc.xml'"/>
        <let name="jdv_AVC_artereCervelet" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_artereCervelet.xml'"/>
        <let name="jdv_AVC_hemisphereLobaire" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_hemisphereLobaire.xml'"/>
        <let name="jdv_AVC_hemisphereProfond" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_hemisphereProfond.xml'"/>
        <let name="jdv_AVC_cerveletLoc" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_cerveletLoc.xml'"/>
        <let name="jdv_AVC_locaThromboseVeineuse" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_locaThromboseVeineuse.xml'"/>
        <let name="jdv_AVC_typeTraitementRt-PA" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_typeTraitementRt-PA.xml'"/>
        <let name="jdv_AVC_typeAdminstrationRt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_typeAdminstrationRt.xml'"/>
        <let name="jdv_AVC_statutEvt" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_statutEvt.xml'"/>
        <let name="jdv_AVC_InterpretationScoreFisher" value="'../jeuxDeValeurs/CI-SIS_jdv_AVC_InterpretationScoreFisher.xml'"/>
        
        
    </pattern>
</schema>
