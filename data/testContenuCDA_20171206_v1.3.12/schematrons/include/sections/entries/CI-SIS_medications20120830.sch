<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CI-SIS_medications.sch ]O@%#o>>=-
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    PCC medication (1.3.6.1.4.1.19376.1.5.3.1.4.7) concernant les données. 
    
    
    Historique :
    05/08/11 : CRI : Création
    10/11/16 : NMA : Modification du templateId 1.2.250.1.213.2.3 en 1.2.250.1.213.2.3.1
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CI-SIS_medications-errors">
    <title>IHE PCC v3.0 Medications</title>
       
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.7"]'>

        <!-- codification EDQM_routes_of_adminitration 
        <assert test='not(cda:routeCode) or cda:routeCode[@codeSystem = "1.250.1.213.2.4.1"]'>
            Erreur [CI-SIS_medications]: La voie d'administration, si elle est mentionnée, 
            utilise le vocabulaire 'EDQM_routes_of_administration (1.250.1.213.2.4.1)'.
        </assert>
        Annulé dans la version 2012/08/30
        -->
          <!-- codification CIS (code) -->    
        <assert test='not(cda:consumable and cda:consumable/cda:manufacturedMaterial) or 
            (cda:consumable//cda:manufacturedMaterial/cda:code[@codeSystem="1.2.250.1.213.2.3.1"])'>
            Erreur [CI-SIS_medications]: l'attribut '@codeSystem'de l'élément 'code' d'un composant 
            'manufacturedMaterial' doit être présent et sera fixé à la valeur '1.2.250.1.213.2.3.1' (vocabulaire 'CIS').
        </assert> 
        
        <!-- codification CIS-Composition (code/translation)-->  
        <assert test='not(cda:consumable and cda:consumable/cda:manufacturedMaterial) or
            (cda:consumable//cda:manufacturedMaterial/cda:code[@codeSystem="1.2.250.1.213.2.3.1"]/cda:translation[@codeSystem="1.2.250.1.213.2.3.2"])'>
            Erreur [CI-SIS_medications]: le composant 'code' d'un élément 'manufacturedMaterial' 
            comportera un composant 'translation', destiné à coder la prescription en dénomination commune (CD). 
            L'attribut @codeSystem de cet élément prendra obligatoirement la valeur 1.2.250.1.213.2.3.2 (vocabulaire 'CIS_Composition')
        </assert>
    </rule>
</pattern>




