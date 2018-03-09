<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_CRRTN.sch - ASIP/PELIM
    ......................................................................................................................................................
    Vérification de la conformité sémantique au volet Compte-rendu de rétinographie du CI-SIS.
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
    - - - - sections : les sous-schématrons de patterns pour la vérification de conformité des sections du corps CDA
    - - - - - entries : les sous-schématrons de patterns pour la vérification de conformité des entries du corps CDA
    - - - moteur : le moteur xslt2 de vérification de conformité sémantique d'un document d'exemple, 
                   avec ses différents composants : saxon9he.jar, script verif.bat et feuilles de transformation xslt2 intermédiaires
    - - - rapports : les rapports de vérification de conformité produits, et la feuille de style qui sert à leur visualisation
    ......................................................................................................................................................
    Historique :
        19/01/15 : CRI : Création
        23/04/15 : JDS :    Ajout du pattern RTN_ModeleEnTete ( schematron RTN_ModeleEnTete20150403.sch)
                            Maj des include serviceEventLabStatusCode20130408.sch      -> serviceEventLabStatusCode20150317.sch
                            Maj des include telecom20110728.sch                        -> telecom20150317.sch
                            
        
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CRRTN"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2" xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    schemaVersion="CI-SIS_CRRTN.sch">
    <title>Conformité d'un document CDAr2 au volet CRRTN du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    <ns prefix="lab" uri="urn:oid:1.3.6.1.4.1.19376.1.3.2"/>
    
    <!-- Inclusions d'abstract patterns : -->
    <include href="abstract/dansJeuDeValeurs20110729.sch"/>
    <include href="abstract/IVL_TS20110627.sch"/>   
    <include href="abstract/personName20110627.sch"/>
    
    <!-- en-tête et génériques -->
    <include href="include/addr20121008.sch"/>    
    <include href="include/administrativeGenderCode20110627.sch"/>
    <include href="include/assignedEntity20121008.sch"/>
    <include href="include/authenticatorName20110627.sch"/>
    <include href="include/authorPersonName20110627.sch"/>
    <include href="include/authorSpecialty20110627.sch"/>
    <include href="include/authorTime20110627.sch"/>
    <include href="include/documentCode20110627.sch"/>
    <include href="include/documentEffectiveTime20110627.sch"/>
    <include href="include/encompassingEncounterCode20130124.sch"/>
    <include href="include/encounterEffectiveTime20130123.sch"/>
    <include href="include/healthcareFacilityTypeCode20110627.sch"/> 
    <include href="include/informantAssignedPersonName20110627.sch"/>
    <include href="include/informantRelatedEntity20110627.sch"/>
    <include href="include/legalAuthenticator20110627.sch"/>
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
    <include href="include/serviceEventLabStatusCode20150317.sch"/>
    <include href="include/telecom20150317.sch"/>   
    
    <!-- Modele d'entete spécifique au volet RTN -->
    <include href="include/RTN_ModeleEnTete20150423.sch"/>    
    
    <!-- sections -->

    <include href="include/sections/SV_informationAssure20150119.sch"/>
    <include href="include/sections/imageIllustrative20150119.sch"/>
       <include href="include/sections/elemClinRapportes20150119.sch"/>
    
    
    <!-- entries -->
    <include href="include/sections/entries/organizerDocIncl20150119.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>
    <include href="include/sections/entries/simpleObservation200110725.sch"/>
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CRRTN">
        
        <!-- obligatoire dans tout schématron -->
        <active pattern="variables"/>
        
        <!-- en-tête et génériques -->
        <!--  <active pattern="addr"/>  désactivé le 05/12/2013 (FMA) pour livraison au DMP -->
        <active pattern="administrativeGenderCode"/>
        <active pattern="assignedEntity"/>
        <active pattern="authenticatorName"/>
        <active pattern="authorPersonName"/>
        <active pattern="authorSpecialty"/>
        <active pattern="authorTime"/>
        <active pattern="documentCode"/>
        <active pattern="documentEffectiveTime"/>
        <active pattern="encompassingEncounterCode"/>
        <active pattern="encounterEffectiveTime"/>
        <active pattern="healthcareFacilityTypeCode"/>
        <active pattern="informantAssignedPersonName"/>
        <active pattern="informantRelatedEntity"/>
        <active pattern="legalAuthenticatorName"/>
        <active pattern="legalAuthenticatorTime"/>
        <active pattern="legalAuthenticator"/>
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
        <active pattern="serviceEventLabStatusCode"/>
        <active pattern="telecom"/>
        <active pattern="RTN_ModeleEnTete"/>   
        <!-- sections -->

        <active pattern="SV_informationAssure-errors"/>
        <active pattern="imageIllustrative-errors"/>
        <active pattern="elemClinRapportes-errors"/>
        

        <!-- entries -->
        <active pattern="organizerDocIncl-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="simpleObservation-errors"/>

    </phase>

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
        <let name="jdv_authorSpecialty" value="'../jeuxDeValeurs/JDV_J01-XdsAuthorSpecialty-CI-SIS.xml'"/>  
        <let name="jdv_confidentialityCode" value="'../jeuxDeValeurs/CI-SIS_jdv_confidentialityCode.xml'"/>  
        <let name="jdv_encompassingEncounterCode" value="'../jeuxDeValeurs/CI-SIS_jdv_encompassingEncounterCode.xml'"/>
        <let name="jdv_healthcareFacilityTypeCode" value="'../jeuxDeValeurs/JDV_J02-HealthcareFacilityTypeCode_CI-SIS.xml'"/>  
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_typeCode" value="'../jeuxDeValeurs/JDV_J07-XdsTypeCode_CI-SIS.xml'"/>   
        <let name="jdv_practiceSettingCode" value="'../jeuxDeValeurs/JDV_J04-XdsPracticeSettingCode_CI-SIS.xml'"/>  
    </pattern>
 
</schema>
