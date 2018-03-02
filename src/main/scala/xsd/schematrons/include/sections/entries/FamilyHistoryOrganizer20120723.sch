<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ familyHistoryOrganizer.sch ]O@%#o>>=-
    
    Teste la conformité de l'élément "PCC Family History Organizer" (1.3.6.1.4.1.19376.1.5.3.1.4.15)
    aux spécifications d'IHE PCC v5.0
    
    Historique :
    23/07/12 : CRI : Création
    16/02/17 : NMA : le test sur l'élément cda:administrativeGenderCode est supprimé
    07/11/17 : NMA : Autorisation du nullFlavor sur le lien de parenté
    
-->

<!--  IHE PCC Family History Organizer: 1.3.6.1.4.1.19376.1.5.3.1.4.15 -->

<!-- errors -->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="familyHistoryOrganizer-errors">
    
    <title>IHE PCC Family History Organizer - errors validation phase</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.15"]'>
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.23"]'>
            Erreur [familyHistoryOrganizer] : l'élément template du parent CCD 
            doit être présent (2.16.840.1.113883.10.20.1.23).
        </assert>
        <assert test='cda:subject/cda:relatedSubject[@classCode="PRS"]'>
            Erreur [PCC Family History Organizer] : L'élément "subject" élément doit être présent 
            et rapporte au patient les observations faites. Il contiendra un élément "relatedSubject"
            qui identifie les relations personnelles du patient (classCXode='PRS').
        </assert>   
        <assert test='cda:subject/cda:relatedSubject[@classCode="PRS"]/cda:code[@code and @codeSystem="2.16.840.1.113883.5.111"] or cda:subject/cda:relatedSubject[@classCode="PRS"]/cda:code[@nullFlavor]'>
            Erreur [PCC Family History Organizer] : L'élément "code" de relatedSubject sera présent et donne 
            le lien entre l'élément "subject" au  patient. L'attribut @code sera présent et contiendra une valeur du vocabulaire HL7 FamilyMember.
            L'attribut "codeSystem" prendra la valeur 2.16.840.1.113883.5.111.
            Le nullFlavor est autorisé
        </assert>
        <assert test='not(cda:participant) or cda:participant/cda:participantRole[@classCode="PRS"]'>
            Erreur [PCC Family History Organizer] : Un élément participant doit contenir un élément participantRole identifiant
            la relation de l'élément "subject" aux autres membres de la famille (classCode='PRS').
        </assert>
        <assert test='not(cda:participant) or 
            cda:participant/cda:participantRole[@classCode="PRS"]/cda:code[@code and @codeSystem="2.16.840.1.113883.5.111"]'>
            Erreur [PCC Family History Organizer] : L'élément "code" sera présent et identifie le lien entre le participant et l'élément "subject".
            L'attribut @code sera présent et contiendra une valeur du vocabulaire HL7 FamilyMember. l'attribut @codeSystem sera présent
            et prendra la valeur "2.16.840.1.113883.5.111". 
        </assert>
        <assert test='not(cda:participant) or
            cda:participant/cda:participantRole[@classCode="PRS"]/cda:playingEntity[@classCode="PSN"]'>
            Erreur [PCC Family History Organizer] : L'élément "playingEntity" est présent et identifie la relation.
            Il prendra la valeur &lt;playingEntity classCode='PSN'&gt;.
        </assert>              
        <assert test='.//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.3"]'>
            Erreur [PCC Family History Organizer] : L'organizer Family History contient un ou plusieurs éléments. 
            Ces éléments se conforment au template "Family History Observation".
        </assert>     
        
        <!-- 
        <assert test='cda:subject/cda:relatedSubject[@classCode="PRS"]/cda:subject/cda:administrativeGenderCode'>
            Alerte [PCC Family History Organizer] : Le code "administrativeGenderCode" de l'élément "subject" devrait être présent.
        </assert>-->    
        
        <!--<assert test='cda:subject/cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.15.2"'>
            Alerte [PCC Family History Organizer] : L'élément "subject" devrait contenir le template ID du participant.
        </assert>-->
        
    </rule>
</pattern>

