<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ AllergiesAndIntoleranceConcern.sch ]O@%#o>>=-
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    PCC allergies and Intolerance Concern (1.3.6.1.4.1.19376.1.5.3.1.4.5.3)  
    
    
    Historique :
    03/08/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AllergiesAndIntoleranceConcern-errors">
    <title>IHE PCC v3.0 Allergies and Intolerance Concern</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.3']">
        <assert test='cda:templateId[@root = "2.16.840.1.113883.10.20.1.27"] and
            cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.1"]'>
            Erreur de Conformité PCC: Les déclarations de conformité aux templates des parents 
            CCD 'Problem Act' (2.16.840.1.113883.10.20.1.27) 
            et PCC 'Concern Entry' (1.3.6.1.4.1.19376.1.5.3.1.4.5.1) sont requises pour l'entrée 'Allergy and Intolerance Concern'.</assert>
        
        <assert test='cda:entryRelationship[@typeCode="SUBJ" and @inversionInd="false"]//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.6"]'>
            
            Erreur de Conformité PCC: Cette entrée 'Allergy and Intolerance Concern' doit contenir une ou plusieurs entrées se conformant
            au template de l'entrée 'Allergy and Intolerance' (1.3.6.1.4.1.19376.1.5.3.1.4.6).
            Ces entrées sont reliées à l'entrée 'Allergy and Intolerance Concern' par des éléments entryRelationshipdont les attributs 
            'typeCode' et 'inversionInd' prendront respectivement les valeurs 'SUBJ' et 'false'.
        </assert>
        
    </rule>
    
</pattern>
