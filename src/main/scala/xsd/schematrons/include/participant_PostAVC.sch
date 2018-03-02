<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Participant.sch :
    Contenu :
        Contrôle du participant dans l'en-tête CDA  
    Paramètres d'appel :
        Néant
    Historique :
    08/08/16 :  Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="participant">
    <rule context="cda:ClinicalDocument/cda:participant">
        <assert test="((name(@*) = 'typeCode') and 
            (@* = 'CON' or @* = 'INF' or @* = 'REF' or @* = 'REFB' or @* = 'REFT' or @* = 'SPRF' or @* = 'DIST')
            )">
            Erreur de conformité CI-SIS : L'élément participant typeCode doit avoir un attribut classCode dont la valeur est dans l'ensemble :
            (CON, INF, REF, REFB, REFT, SPRF, DIST).
        </assert>
        
        <assert test="./cda:functionCode">
            Erreur de conformité CI-SIS : L'élément participant/functionCode   est obligatoire  
        </assert>
    
        <assert test="./cda:associatedEntity">
            Erreur de conformité CI-SIS : L'élément participant/associatedEntity    est obligatoire  
         </assert>
        
        <assert test="./cda:associatedEntity/cda:id">
            Erreur de conformité CI-SIS : L'élément "associatedEntity" doit comporter un  élément id.
        </assert>
        
        <assert test="./cda:associatedEntity/cda:associatedPerson">
            Erreur de conformité CI-SIS : L'élément "associatedEntity"doit compoter un  élément fils associatedPerson  
        </assert>
    </rule>
</pattern>