<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_CertificatSanteCS9.sch - ASIP/PRAS
    ......................................................................................................................................................
    Vérification de la conformité sémantique au volet Structuration Commune des Documents Médicaux du CI-SIS.
    ......................................................................................................................................................
    Utilisation des répertoires sous testContenuCDA :
    - testContenuCDA : les documents CDA d'exemples conformes au CI-SIS, ainsi que la feuille de style par défaut cda_asip.xsl pour la visualisation
    - - documentsAnnexes : Des documents annexes liés aux exemples et des documents de référence
    - - infrastructure/cda : Le schéma XML CDA.xsd
    - - jeuxDeValeurs : les jeux de valeurs du CI-SIS dans le format SVS.xsd
    - - processable/coreschemas : Les sous-schémas XML de CDA.xsd (de l'édition normative HL7 v3 de 2005, correspondant à CDAr2)
    - - schematrons : les schématrons des volets du CI-SIS sous la forme source (<CI-SIS_<nom>.sch) et sous la forme compilée en xslt2 (<CI-SIS_<nom>.xsl)
    - - - abstract : les sous-schématrons de patterns abstraits (un fichier par abstract pattern)
    - - - include : les sous-schématrons de patterns concrets (un fichier par pattern)
    - - - - section : les sous-schématrons de patterns concrets vérifiant la conformité du contenu d'une section à un modèle de section
    - - - moteur : le moteur xslt2 de vérification de conformité sémantique d'un document d'exemple, 
                   avec ses différents composants : saxon9he.jar, script verif.bat et feuilles de transformation xslt2 intermédiaires
    - - - rapports : les rapports de vérification de conformité produits, et la feuille de style qui sert à leur visualisation
    ......................................................................................................................................................
    Pour réaliser le schematron d'un volet de contenu du CI-SIS :
        1) Recopier le présent schématron sous le nom CI-SIS_<nom du volet>.sch, dans le répertoire courant (schematrons)
        2) conserver sans changement les include, pattern existants.
        3) Créer dans le répertoire include les patterns concrets supplémentaires requis par le volet (ou réutiliser ceux qui sont réutilisables)
        4) le cas échéant créer dans le répertoire abstract les paterns abstraits supplémentaires requis par le volet
        5) Inclure tous les patterns supplémentaires dans le schématron CI-SIS_<nom du volet>.sch
        6) Activer dans la phase "latotale" les patterns concrets supplémentaires.
        7) Si nécessaire adapter la phase "minimale" au contexte du volet, ou bien la supprimer
        8) La première opération de validation de conformité d'un document au volet compilera le schematron en xslt2 : CI-SIS_<nom du volet>.xsl
    ......................................................................................................................................................    
    Historique :
        27/05/11 : FMY : Création
        31/05/11 : FMY : Externalisation du plus grand nombre de patterns, contôle de authorSpecialty, 2 phases : "latotale" et "minimale"
        15/06/11 : Organisation des sous-répertoires de composants
        24/06/11 : CRI : Adaptation du module initial CI-SIS_StructurationCommuneCDAr2.sch en CI-SIS_CertificatSante.sch pour le volet du CI-SIS de l'ASIP
                        "Certificats de Santé de l'Enfant" (CS8, CS9 et CS24).
        06/03/12 : CRI : Adaptation à l'utilisation de SNOMED 3.5 à la place de SNOMED CT
        08/10/12 : FMY : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                   Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)
        22/05/15 : JDS : Utilisation du schématron CSENeurologicEnt20130326.sch (dernière version)                 
                         Inclusion du schématron CSEteethEnt20120306.sch 
                         Inclusion du schématron teethPhysicalExam20110627.sch
                         Mise à jour du schématron CSEgeneralAppEnt20120306.sch -> CSEgeneralAppEnt20150522.sch
                         Maj des include telecom20110728.sch                        -> telecom20150317.sch
                         
        22/11/17 : NMA : Suppression des JDV typeGardeEnfant et typeGardePleinTemps
                         
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CS9-20121008"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_CertificatSanteCS9.sch">
    <title>Conformité d'un document CDAr2 au volet Certificat de santé de l'enfant (modèle CS9) du CI-SIS</title>
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
    <include href="include/CS9ModeleEnTete20120425.sch"/> 
    
                 <!--=<<o#%@O[ sections communes ]O@%#o>>=-->
    
    <include href="include/sections/abdomenPhysicalExam20110627.sch"/>
    <include href="include/sections/assessmentAndPlan20110627.sch"/>
    <include href="include/sections/carePlan20110627.sch"/>
    <include href="include/sections/childFunctionalStatusAssessment20131025.sch"/>
    <include href="include/sections/childFunctionalStatusEatingSleeping20110627.sch"/>
    <include href="include/sections/childFunctionalStatusPsychomot20110627.sch"/>
    <include href="include/sections/codedPhysicalExam20110627.sch"/>
    <include href="include/sections/codedSocialHistory20110627.sch"/>
    <include href="include/sections/codedVitalSigns20110627.sch"/>
    <include href="include/sections/earsPhysicalExam20110627.sch"/>
    <include href="include/sections/endocrinePhysicalExam20110627.sch"/>
    <include href="include/sections/eyesPhysicalExam20110627.sch"/>
    <include href="include/sections/generalAppearancePhysicalExam20110627.sch"/>
    <include href="include/sections/genitaliaPhysicalExam20110627.sch"/>
    <include href="include/sections/heartPhysicalExam20110627.sch"/>
    <include href="include/sections/historyOfPastIllness20110627.sch"/>
    <include href="include/sections/immunizations20110627.sch"/>
    <include href="include/sections/integumentaryPhysicalExam20110627.sch"/>
    <include href="include/sections/lymphaticPhysicalExam20110627.sch"/>
    <include href="include/sections/musculoPhysicalExam20110627.sch"/>
    <include href="include/sections/neurologicPhysicalExam20110627.sch"/>
    <include href="include/sections/respiratoryPhysicalExam20110627.sch"/>
    <include href="include/sections/teethPhysicalExam20110627.sch"/>
    
            <!--=<<o#%@O[ sections spécifiques au volet ]O@%#o>>=-->
    
    <include href="include/sections/CS9codedPhysicalExam20110725.sch"/>
    <include href="include/sections/CSEcarePlan20110725.sch"/>  
    
                  <!--=<<o#%@O[ entrées communes ]O@%#o>>=-->
    <!-- 
        <include href="include/sections/entries/codedVitalSignsOrg20110627.sch"/>
    -->
     
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

    
            <!--=<<o#%@O[ entrées spécifiques au volet ]O@%#o>>=-->
    
    <!-- 
        <include href="include/sections/entries/CSEabdomenEnt20110725.sch"/>
        <include href="include/sections/entries/CSEcodedSocialHistoryEnt20110725.sch"/>
        <include href="include/sections/entries/CSEearsEnt20110627.sch"/>
        <include href="include/sections/entries/CSEGenitaliaEnt20110627.sch"/>
        <include href="include/sections/entries/CSEHeartEnt20110627.sch"/>
        <include href="include/sections/entries/CSENeurologicEnt20110725.sch"/>
        <include href="include/sections/entries/CSEimmunizationsEnt20110627.sch"/>
        <include href="include/sections/entries/CSEgeneralAppEnt20110627.sch"/>
        <include href="include/sections/entries/CSEeatingSleepingEnt20110725.sch"/>
        <include href="include/sections/entries/CSEendocrineEnt20110627.sch"/>
        <include href="include/sections/entries/CSEeyesEnt20110627.sch"/>
        <include href="include/sections/entries/CSEintegumentaryEnt20110627.sch"/>
        <include href="include/sections/entries/CSElymphaticEnt20110627.sch"/>
        <include href="include/sections/entries/CSErespiratoryEnt20110725.sch"/>
    -->
    
    <!-- Modifiés -->
    <include href="include/sections/entries/CSEabdomenEnt20120306.sch"/>
    <include href="include/sections/entries/CSEcodedSocialHistoryEnt20120306.sch"/>
    <include href="include/sections/entries/CSEearsEnt20120306.sch"/>
    <include href="include/sections/entries/CSEGenitaliaEnt20120306.sch"/>
    <include href="include/sections/entries/CSEHeartEnt20120306.sch"/>
    <include href="include/sections/entries/CSENeurologicEnt20130326.sch"/>
    <include href="include/sections/entries/CSEimmunizationsEnt20120306.sch"/>
    <include href="include/sections/entries/CSEgeneralAppEnt20150522.sch"/>
    <include href="include/sections/entries/CSEeatingSleepingEnt20120306.sch"/>
    <include href="include/sections/entries/CSEendocrineEnt20120306.sch"/>
    <include href="include/sections/entries/CSEeyesEnt20120306.sch"/>
    <include href="include/sections/entries/CSEintegumentaryEnt20120306.sch"/>
    <include href="include/sections/entries/CSElymphaticEnt20120306.sch"/>
    <include href="include/sections/entries/CSErespiratoryEnt20120306.sch"/>
    <include href="include/sections/entries/CSEteethEnt20120306.sch"/>
    
    
    <!-- Inchangés -->
    <include href="include/sections/entries/CSECodedVitalSignsEnt20110725.sch"/>
    
    <include href="include/sections/entries/CSEhistoryOfPastIllnessEnt20110630.sch"/>
    

    <include href="include/sections/entries/CSEmusculoEnt20110725.sch"/>
    <include href="include/sections/entries/CSEPsychoMotEnt20110725.sch"/>
    
    
                       <!--=<<o#%@O[ Value sets ]O@%#o>>=-->

    <include href="include/activProf20110627.sch"/>
    <include href="include/causeAccidentDom20110627.sch"/>
    <include href="include/catProf20110627.sch"/>
    <include href="include/nivEtude20110627.sch"/>
    <include href="include/typeGardeEnfant20110627.sch"/>
    <include href="include/typeGardePleinTemps20110627.sch"/>
    <include href="include/sections/entries/HealthStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ClinicalStatusCodes20110728.sch"/>
    <include href="include/sections/entries/ProblemCodes20110728.sch"/>
    <include href="include/sections/entries/AllergyAndIntoleranceCodes20110728.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <phase id="CS9-20121008">
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
        <active pattern="CS9ModeleEnTete"/> 
        
        <!--=<<o#%@O[ activation sections communes ]O@%#o>>=-->
        
        <active pattern="abdomenPhysicalExam-errors"/>
        <active pattern="assessmentAndPlan-errors"/>
        <active pattern="carePlan-errors"/>
        <active pattern="childFunctionalStatusAssessment-errors"/>
        <active pattern="childFunctionalStatusEatingSleeping-errors"/>
        <active pattern="childFunctionalStatusPsychoMot-errors"/>
        <active pattern="codedPhysicalExam-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        <active pattern="codedVitalSigns-errors"/>
        <active pattern="EarsPhysicalExam-errors"/>
        <active pattern="endocrinePhysicalExam-errors"/>
        <active pattern="eyesPhysicalExam-errors"/>
        <active pattern="generalAppearancePhysicalExam-errors"/>
        <active pattern="genitaliaPhysicalExam-errors"/>
        <active pattern="heartPhysicalExam-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="immunizations-errors"/>
        <active pattern="integumentaryPhysicalExam-errors"/>
        <active pattern="lymphaticPhysicalExam-errors"/>
        <active pattern="musculoPhysicalExam-errors"/>
        <active pattern="neurologicPhysicalExam-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="RespiratoryPhysicalExam-errors"/>
        <active pattern="teethPhysicalExam-errors"/>
        
        <!--=<<o#%@O[ activation sections spécifiques ]O@%#o>>=-->
        
        <active pattern="CS9codedPhysicalExam-errors"/>
        <active pattern="CSEcarePlan-errors"/>
        
        <!--=<<o#%@O[ activation entrées communes ]O@%#o>>=-->
        
        <active pattern="codedVitalSignsOrg-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="encountersEntry-errors"/>
        <active pattern="immunizationsEnt-errors"/>
        <active pattern="observationInterpretation"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="simpleObservation-errors"/>   
        
        <!--=<<o#%@O[ activation entrées spécifiques ]O@%#o>>=-->
        
        <active pattern="CSEabdomenEnt-errors"/>
        <active pattern="CSEcodedSocialHistoryEnt-errors"/>
        <active pattern="CSECodedVitalSignsEnt-errors"/>
        <active pattern="CSEearsEnt-errors"/>
        <active pattern="CSEeatingSleepingEnt-errors"/>
        <active pattern="CSEEndocrineEnt-errors"/>
        <active pattern="CSEeyesEnt-errors"/>
        <active pattern="CSEgeneralAppEnt-errors"/>
        <active pattern="CSEGenitaliaEnt-errors"/>
        <active pattern="CSEHeartEnt-errors"/>
        <active pattern="CSEhistoryOfPastIllnessEnt-errors"/>
        <active pattern="CSEimmunizationsEnt-errors"/>
        <active pattern="CSEintegumentaryEnt-errors"/>
        <active pattern="CSElymphaticEnt-errors"/>
        <active pattern="CSEmusculoEnt-errors"/>
        <active pattern="CSENeurogicEnt-errors"/>
        <active pattern="CSEpsychoMotEnt-errors"/>
        <active pattern="CSErespiratoryEnt-errors"/>     
        <active pattern="CSEteethEnt-errors"/>
        
        <!--=<<o#%@O[ activation value sets ]O@%#o>>=-->
        
        <active pattern="nivEtude"/>
        <active pattern="catProf"/>
        <active pattern="activProf"/>
        <active pattern="causeAccidentDom"/>
        <active pattern="HealthStatusCodes"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
    </phase>

    <!--    Historique des phases des versions antérieures supprimé car alourdit la compilation    -->    
    
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
        <let name="jdv_nivEtude" value="'../jeuxDeValeurs/CI-SIS_jdv_nivEtude.xml'"/> 
        <let name="jdv_catProf" value="'../jeuxDeValeurs/CI-SIS_jdv_catProf.xml'"/> 
        <let name="jdv_activProf" value="'../jeuxDeValeurs/CI-SIS_jdv_activProf.xml'"/>
        <let name="jdv_causeAccidentDom" value="'../jeuxDeValeurs/CI-SIS_jdv_causeAccidentDom.xml'"/>
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/JDV_HealthStatusCodes_CI-SIS.xml'"/>
        <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/JDV_ClinicalStatusCodes_CI-SIS.xml'"/>        
        <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/JDV_ProblemCodes_CI-SIS.xml'"/>
        <let name="jdv_AllergyAndIntoleranceCodes" value="'../jeuxDeValeurs/JDV_HL7_ObservationIntoleranceType_CI-SIS.xml'"/>
    </pattern>
</schema>
