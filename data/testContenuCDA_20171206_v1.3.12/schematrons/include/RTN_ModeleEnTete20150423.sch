<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ RTN_ModeleEnTete.sch ]O@%#o>>=-
    
    Règles de contrôle de l'en-tête CDA  d'un Compte rendu de rétinographie
    
    Historique :
    23/04/2015 : JDU : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="RTN_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle du RTN</p>
    <rule context="cda:ClinicalDocument">
        
        <!-- Volet CRRTN : "Le médecin prescripteur est un élément obligatoire" -->
        <assert test="./cda:participant[@typeCode='REFB'] and ./cda:participant/cda:functionCode[@code='PCP']"> 
            Erreur de conformité RTN : 
            L'élément participant Médecin prescripteur est un élément obligatoire du volet CRRTN 
            (attribut typeCode fixé à 'REFB' et L'attribut code de l'element participant/functionCode est fixé à 'PCP')</assert>
        <assert test="./cda:participant[@typeCode='REFB']/cda:associatedEntity/cda:telecom"> 
            Erreur de conformité RTN : 
            L'élément associatedEntity/telecom du participant Médecin prescripteur est un élément obligatoire du volet CRRTN 
            </assert>
        
        <assert test="./cda:participant[@typeCode='REFB']/cda:associatedEntity/cda:addr"> 
            Erreur de conformité RTN : 
            L'élément associatedEntity/addr du participant Médecin prescripteur est un élément obligatoire du volet CRRTN 
        </assert>
        
        <!-- Volet CRRTN : "L'ophtalmologiste est un élément obligatoire" -->
        <assert test="./cda:participant[@typeCode='REFT'] and ./cda:participant/cda:functionCode[@code='OPHTA']"> 
            Erreur de conformité RTN : 
            L'élément participant Ophtalmologiste est un élément obligatoire du volet CRRTN 
            (attribut typeCode fixé à 'REFT' et L'attribut code de l'element participant/functionCode est fixé à 'OPHTA')</assert>
        
        <!-- Volet CRRTN : "Les éléments <telecom> et <addr> sont obligatoires pour l'élément legalAuthenticator" -->
        <assert test="./cda:legalAuthenticator/cda:assignedEntity/cda:addr">
            Erreur de conformité RTN : L'élément "addr" doit être présent sous legalAuthenticator/assignedEntity 
            dans le cadre du volet CRRTN 
        </assert>
        <assert test="./cda:legalAuthenticator/cda:assignedEntity/cda:telecom">
            Erreur de conformité RTN : L'élément "telecom" doit être présent sous legalAuthenticator/assignedEntity
            dans le cadre du volet CRRTN
        </assert>
    </rule>
</pattern>
