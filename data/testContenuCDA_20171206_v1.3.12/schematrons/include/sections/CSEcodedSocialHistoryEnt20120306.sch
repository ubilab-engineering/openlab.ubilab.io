<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEabdomenEnt.sch ]O@%#o>>=-
    
    Teste les entrées du volet du CI-SIS Certificats de santé de l'enfant 
    CS8, CS9, et CS24 pour la section "Coded Social History"
    Note: Ce schematron est commun aux trois volets CS8, CS9, CS24
    
    Historique :
    24/06/11 : CRI : Création
    25/07/11 : CRI : Compatbilité du schematron aux trois volets CS8, CS9, CS24
    06/03/12 : CRI : SUpression des références à SNOMED CT
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEcodedSocialHistoryEnt-errors">
    <title>IHE PCC v3.0 Coded Social History Section</title>
    
    <!-- ****** Contexte : Coded Social History Section ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>
        
        <!-- Niveau de scolarité + affectation  (mère seulement) -->
        <assert test='//cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]/cda:code/@code="S-00610"'>             
            Erreur de Conformité volet CSE: L'entrée "niveau de scolarité" doit obligatoirement faire partie des entrées de la section "Coded Social History"
        </assert>
        <assert test='.//cda:entry/cda:observation[cda:code/@code="S-00610"]/cda:subject[@typeCode="SBJ"]/cda:relatedSubject/cda:code/@code="MTH"'>             
            Erreur de Conformité volet CSE: l'entrée "niveau de scolarité" doit obligatoirement être affectée à la mère
        </assert>
      
        <!-- Profession + affectation mère -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="MTH"]/cda:code/@code="J-00000"'>             
            Erreur de Conformité volet CSE: L'entrée "Profession" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History attribuées à la mère de l'enfant"
        </assert>
        <!-- Profession + affectation  père -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="FTH"]/cda:code/@code="J-00000"'>             
            Erreur de Conformité volet CSE: L'entrée "Profession" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History attribuées au père de l'enfant"
        </assert>        
        <!-- Statut professionnel + affectation  mère -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="MTH"]/cda:code/@code="XX-MCH176"'>             
            Erreur de Conformité volet CSE: L'entrée "Statut professionnel" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History attribuées à la mère de l'enfant"
        </assert>
        <!-- Statut professionnel + affectation  père -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="FTH"]/cda:code/@code="XX-MCH176"'>             
            Erreur de Conformité volet CSE: L'entrée "Statut professionnel" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History attribuées au père de l'enfant"
        </assert>
        <!-- Statut professionnel + affectation  -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="MTH"]/cda:code/@code="XX-MCH176"'>             
            Erreur de Conformité volet CSE: L'entrée "Statut professionnel" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History attribuées à la mère de l'enfant"
        </assert>
        
        <!-- Type de garde de l'enfant  CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"]) or
            (.//cda:entry/cda:observation/cda:code/@code="XX-MCH178")'>             
            Erreur de Conformité volet CSE: L'entrée "Type de garde de l'enfant" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History.
        </assert>
        <!-- Garde à temps complet CS9 et CS24 seulement  -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation/cda:code/@code="XX-MCH179"'>             
            Erreur de Conformité volet CSE: L'entrée "Garde à temps complet" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History.
        </assert>
        <!-- Risque de saturnisme  CS9 et CS24 seulement -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"] or /cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.2"]) or
            .//cda:entry/cda:observation/cda:code/@code="XX-MCH180"'>             
            Erreur de Conformité volet CSE: L'entrée "Risque de staurnisme" doit obligatoirement faire partie des entrées de la section 
            "Coded Social History.
        </assert>
    </rule>
</pattern>


