<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ immunizationsEnt.sch ]O@%#o>>=-
    
    Définition: Teste les entrées relatives à la vaccination du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Immunizations Section" 
    
    Historique :
    24/06/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="immunizationsEnt-errors">
    <title>IHE PCC v3.0 Immunizations Section</title>
    
    <!-- ****** Contexte = Section Immunizations****** -->
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']">
        
        <assert test='@negationInd="true" or @negationInd="false"'>
            Erreur de Conformité PCC: 
            Une entrée 'Immunization' peut être le moyen de notifier qu'une vaccination spécifique n'a pas eu lieu, et pourquoi. 
            Dans ce cas, l'attribut negationInd prendra la valeur 'true' et dans tous les autres cas la valeur 'false'.
        </assert>

        
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.24"]'>
            Erreur de Conformité PCC: Immunization doit notifier l'OID du template CCD parent (2.16.840.1.113883.10.20.1.24).
        </assert>
        
        <assert test='cda:id'>
            Erreur de Conformité PCC: Une vaccination aura un identifiant (id).
        </assert>
        
        <assert test='cda:code[@code and @codeSystem]'>
            Erreur de Conformité PCC: 
            Cet élément obligatoire indique que l'acte effectué est une vaccination. 
            L'élément act substance administration doit présenter un élément 'code' avec des attributs 'code' et 'codeSystem' obligatoirement présents.
            Si aucun système de codage est utilisé, on utilisera les valeurs code='IMMUNIZ' codeSystem='2.16.840.1.113883.5.4' codeSystemName='ActCode'
        </assert>
        
        <assert test='cda:statusCode[@code="completed"]'>
            Erreur de Conformité PCC: L'élément 'statusCode' prendra la valeur 'completed' pour toutes les vaccinations.
        </assert>
        
        <assert test='cda:effectiveTime[@value or @nullFlavor]'>
            Erreur de Conformité PCC: 
            
            Dans Immunizations, l'élément 'effectiveTime' sera obligatoirement présent, indiquant l'horodatage de la vaccination.
            Si la date est inconnue, l'attribut nullFlavor sera utilisé.
        </assert>
        
        <assert test='cda:consumable//cda:manufacturedProduct//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.7.2"]'>
            Erreur de Conformité PCC: 
            Dans 'Immunizations', l'élément 'consumable' sera présent, and contiendra une entrée 'manufacturedProduc' se conformant au 
            template 'Product Entry template' (1.3.6.1.4.1.19376.1.5.3.1.4.7.2).XX
        </assert>
        
        <assert test='not(cda:entryRelationship[@inversionInd="false" and @typeCode="CAUS"]) or
            (cda:entryRelationship[@inversionInd="false" and @typeCode="CAUS"]//cda:observation/cda:id and
            cda:entryRelationship[@inversionInd="false" and @typeCode="CAUS"]//cda:templateId[@root="2.16.840.1.113883.10.20.1.28"] and
            cda:entryRelationship[@inversionInd="false" and @typeCode="CAUS"]//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.5"] and
            cda:entryRelationship[@inversionInd="false" and @typeCode="CAUS"]//cda:templateId[@root="2.16.840.1.113883.10.20.1.54"])'>   
            Erreur de Conformité PCC: 
            Dans 'Immunizations', un élément entryRelationship pourra être utilisé pour identifier d'éventuelles réactions adverses 
            causées par la vaccination.
            Dans ce cas l'identifiant (id) de l'observation est requis. 
            L'observation se conformara au template 'Problem Entry', ainsi qu'au template 'CCD Reaction'.

        </assert>
        
		<!-- LBE :  Cette entryrelationship n'est pas obligatoire d'après IHE et Modèle de contenus CDA -->
		
        <!-- <assert test='cda:entryRelationship/cda:observation/cda:code[@code="30973-2" and @codeSystem="2.16.840.1.113883.6.1"]'>
            Erreur de Conformité PCC: 
            dans l'élément entryRelationship permettant d'assigner le rang de la vaccination 
            dans une série de vaccinations effectuée (1ère vaccination, deuxième, etc), l'élément 'code' sera présent et ses 
            attributs prendront les valeurs (code='30973-2' displayName='Dose Number' codeSystem='2.16.840.1.113883.6.1' codeSystemName='LOINC')
            Cet élément indique que l'observation concerne le rand de la vaccination. 
        </assert> -->

        <assert test='not(ancestor::*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.12"]) or 
            cda:statusCode[@code="completed"]'>
            Erreur de Conformité PCC: 
            dans l'élément entryRelationship permettant d'assigner le rang de la vaccination 
            dans une série de vaccinations effectuée (1ère vaccination, deuxième, etc), l'élément 'statusCode', obligatoire, 
            prendra la valeur 'completed'.
        </assert>
        
		<!-- LBE :  Cette entryrelationship n'est pas obligatoire d'après IHE et Modèle de contenus CDA -->
		
      <!--   <assert test='cda:entryRelationship/cda:observation/cda:value[@value]'>
            Erreur de Conformité PCC: 
            Dans une entrée 'Immunization', dans l'élément entryRelationship permettant d'assigner le rang de la vaccination 
            dans une série de vaccinations effectuée (1ère vaccination, deuxième, etc), l'élément 'value' sera présent et 
            indiquera le numéro de lot du vaccin.
        </assert> -->

    </rule>
</pattern>
