<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_CRBiologie.sch - ASIP/PRAS
    ......................................................................................................................................................
    Vérification de la conformité sémantique au volet Compte Rendu d’Examens Biologiques du CI-SIS.
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
        21/07/11 : FMY : Création
        29/07/11 : FMY : Report dernières évolutions de CI-SIS_StructurationCommune.sch
        08/10/12 : FMY : CI-SIS 1.3 => retrait des include assignedAuthor, confidentialityCode et custodianOrganization. 
                         Maj des include assignedEntity (addr & telecom optionnels) et addr (contrôle structure des adresses)
        08/04/13 : FMA : Ajout du préfixe lab et du pattern serviceEventLabStatusCode 
        10/03/15 : JDS : Maj des include laborAndDeliverySection20110725.sch        -> laborAndDeliverySection20130326.sch
                         Maj des include BIOmodeleEnTete20110721.sch                -> BIOmodeleEnTete20150310.sch
                         Maj des include serviceEventLabStatusCode20130408.sch      -> serviceEventLabStatusCode20150317.sch
                         Maj des include telecom20110728.sch                        -> telecom20150317.sch
        03/03/17 : NMA : suppression des sections et entrées non utilisées
        21/05/17 : NMA : Mise à jour des schématron de section BIOsectionN1Struct20110721.sch et BIOsectionN1Code20110721.sch et du schématron d'entrée BIOentry20110722.sch
                         Ajout du templateId du CR non structuré
        03/10/17 : NMA : Mises à jours relatives à l'interpretationObservation
        
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="latotale20130408"
    xmlns:cda="urn:hl7-org:v3" xmlns:lab="urn:oid:1.3.6.1.4.1.19376.1.3.2" 
    queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    schemaVersion="CI-SIS_CRBiologie.sch">
    <title>Conformité d'un document CDAr2 au volet Compte Rendu d’Examens Biologiques du CI-SIS</title>
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
    <include href="include/BIOmodeleEnTete20150310.sch"/>  
    <include href="include/BIOserviceCode20110721.sch"/>
    <include href="include/documentCode20110627.sch"/>
    <include href="include/documentEffectiveTime20110627.sch"/>
    <include href="include/healthcareFacilityTypeCode20110627.sch"/> 
    <include href="include/informantAssignedPersonName20110627.sch"/>
    <include href="include/informantRelatedEntity20110627.sch"/>
    <include href="include/legalAuthenticatorName20110627.sch"/>
    <include href="include/legalAuthenticatorTime20110627.sch"/>
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
    
    <!-- sections -->

    <include href="include/sections/BIOsectionN1Code20170523.sch"/>
    <include href="include/sections/BIOsectionN1Struct20170523.sch"/>
    <include href="include/sections/BIOsectionN2Struct20110721.sch"/>
    
    
    <!-- entries -->

    <include href="include/sections/entries/ACPimageIllustrative20110727.sch"/>
    <include href="include/sections/entries/ACPParticipant20110722.sch"/>
    <include href="include/sections/entries/BIOentry20170523.sch"/>
    <include href="include/sections/entries/BIOexamen20110729.sch"/>
    <include href="include/sections/entries/BIOisolat20110729.sch"/>
    <include href="include/sections/entries/BIOlaboExecutant20110729.sch"/>
    <include href="include/sections/entries/BIOprelevement20110722.sch"/>
    <include href="include/sections/entries/BIOresultat20110725.sch"/>
    <include href="include/sections/entries/comments20110725.sch"/>
    <include href="include/sections/entries/observationInterpretation20110722.sch"/>
    <include href="include/sections/entries/interpretation20171003.sch"/>
    
    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="latotale20130408">
        
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
        <active pattern="BIOmodeleEnTete"/>
        <active pattern="BIOserviceCode"/>
        <active pattern="documentCode"/>
        <active pattern="documentEffectiveTime"/>
        <active pattern="healthcareFacilityTypeCode"/>
        <active pattern="informantAssignedPersonName"/>
        <active pattern="informantRelatedEntity"/>
        <active pattern="legalAuthenticatorName"/>
        <active pattern="legalAuthenticatorTime"/>
<!--        <active pattern="modeleCommunEnTete"/>-->
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
        
        <!-- sections -->

        <active pattern="BIOsectionN1Code"/>
        <active pattern="BIOsectionN1Struct"/>
        <active pattern="BIOsectionN2Struct"/>
        
        <!-- entries -->
        <active pattern="ACPimageIllustrative"/>
        <active pattern="ACPParticipant"/>
        <active pattern="BIOentry"/>
        <active pattern="BIOexamen"/>
        <active pattern="BIOisolat"/>
        <active pattern="BIOlaboExecutant"/>
        <active pattern="BIOprelevement"/>
        <active pattern="BIOresultat"/>
        <active pattern="comments-errors"/>
        <active pattern="observationInterpretation"/>
        <active pattern="interpretation"/>
       
        
    </phase>

    <!--    Historique des phases des versions antérieures supprimé car alourdit la compilation    -->    

    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Variables globales          -->
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <pattern id="variables">
        <let name="enteteHL7France" value="'2.16.840.1.113883.2.8.2.1'"/>               <!-- conformité guide en-tête CDA de HL7 France -->
        <let name="templateCRBiologie" value="'1.3.6.1.4.1.19376.1.3.3'"/>              <!-- conformité volet CR d'examens biologiques -->
        <let name="templateSectN1" value="'1.3.6.1.4.1.19376.1.3.3.2.1'"/>              <!-- conformité section N1 de CR de biologie -->
        <let name="templateSectN2" value="'1.3.6.1.4.1.19376.1.3.3.2.2'"/>              <!-- conformité section N2 de CR de biologie -->
        <let name="templateEntry" value="'1.3.6.1.4.1.19376.1.3.1'"/>                   <!-- conformité entry de CR de biologie -->
        <let name="templatePerformer" value="'1.3.6.1.4.1.19376.1.3.3.1.7'"/>           <!-- conformité exécutant examen ou analyse de biologie -->
        <let name="templatePartACP" value="'1.3.6.1.4.1.19376.1.8.1.4.7'"/>             <!-- conformité participant entry de CR-ACP ou biologie -->
        <let name="templateExamen" value="'1.3.6.1.4.1.19376.1.3.1.4'"/>                <!-- conformité examen biologique dans entry de CR-BIO -->
        <let name="templateIsolat" value="'1.3.6.1.4.1.19376.1.3.1.5'"/>                <!-- conformité isolat biologique dans entry de CR-BIO -->
        <let name="templateResultat" value="'1.3.6.1.4.1.19376.1.3.1.6'"/>              <!-- conformité résultat biologique dans entry de CR-BIO -->
        <let name="templateObservationMedia" value="'1.3.6.1.4.1.19376.1.8.1.4.10'"/>   <!-- conformité image illustrative dans observationMedia -->
        <let name="typeCodeCRBio" value="'11502-2'"/>                                   <!-- typeCode de CR d'examens biologiques -->
        <let name="OIDphysique" value="'1.2.250.1.71.4.2.1'"/>                          <!-- OID PS personnes physiques -->
        <let name="OIDmorale" value="'1.2.250.1.71.4.2.2'"/>                            <!-- OID PS personnes morales -->
        <let name="OIDINS-c" value="'1.2.250.1.213.1.4.2'"/>                            <!-- OID de l'INS-c -->
        <let name="OIDLOINC" value="'2.16.840.1.113883.6.1'"/>                          <!-- OID de LOINC -->
        <let name="OIDNABM" value="'1.2.250.1.213.2.7'"/>                               <!-- OID de NABM -->
        <!-- NMA ajout du templateId du CR non structuré -->
        <let name="templateCRNonStructure" value="'1.2.250.1.213.1.1.2.60'"/>             <!-- conformité volet CR non structuré -->
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_chapitresBiologie" value="'../jeuxDeValeurs/JDV_BIO_Chapitres_CI-SIS.xml'"/>
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_interpretation" value="'../jeuxDeValeurs/JDV_BIO_Interpretation_CI-SIS.xml'"/>
        <let name="jdv_typeCode" value="'../jeuxDeValeurs/JDV_J07-XdsTypeCode_CI-SIS.xml'"/>   
        <let name="jdv_practiceSettingCode" value="'../jeuxDeValeurs/JDV_J04-XdsPracticeSettingCode_CI-SIS.xml'"/>  
        <let name="jdv_healthcareFacilityTypeCode" value="'../jeuxDeValeurs/JDV_J02-HealthcareFacilityTypeCode_CI-SIS.xml'"/>  
        <let name="jdv_authorSpecialty" value="'../jeuxDeValeurs/JDV_J01-XdsAuthorSpecialty-CI-SIS.xml'"/>  
    </pattern>
 
</schema>
