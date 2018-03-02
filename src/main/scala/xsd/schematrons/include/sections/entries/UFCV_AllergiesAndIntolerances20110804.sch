<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ UFCV_AllergiesAndIntolerances.sch ]O@%#o>>=-
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    PCC allergies and Intolerances (1.3.6.1.4.1.19376.1.5.3.1.4.6)  
    Les contraintes présentes sont spécifiques du volet "Patients à Risques de Cardiologie".
    
    Historique :
    04/08/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="UFCV_AllergiesAndIntolerances-errors">

    <title>ASIP CI-SIS Allergies and Intolerances (UFCV)</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.6"]'>
        
        <assert test='cda:participant/@typeCode="CSM"'>
            Erreur de Conformité CI-SIS: L'allergène responsable de la réaction observée doit être présent.
            Un élément participant d'attribut typeCode='CSM' sera utilisé pour le décrire</assert>
        
        <assert test='(cda:participant[@typeCode="CSM"]/cda:participantRole/cda:playingEntity/cda:code[@codeSystem="1.2.250.1.213.2.3"]) or
            (cda:participant[@typeCode="CSM"]/cda:participantRole/cda:playingEntity/cda:code[@codeSystem="1.2.250.1.213.2.3.2"])'>
            Erreur de Conformité CI-SIS: Le médicament responsable de la réaction observée doit être codé à partir:
            soit de la nomenclature CIS (1.2.250.1.213.2.3) si l'on code son nom de fantaisie, 
            soit de la nomenclature CIS_Composition (1.2.250.1.213.2.3.2) si l'on code un composant d'un médicament</assert>        
 
        <!-- Si le type de réaction est DNAINT et pas de codes pour l'augmentation ou la diminution de l'INR -->
        <assert test='not(cda:code[@code="DNAINT"]) or ((cda:value/@code="D0070-1") or (cda:value/@code="D0070-2"))'>
            Erreur de Conformité CI-SIS: Les effets d'augmentation ou de diminution de l'INR doivent être notés 
            dans ce contexte non-allergique d'intolérance médicamenteuse</assert> 


    </rule>
</pattern>
