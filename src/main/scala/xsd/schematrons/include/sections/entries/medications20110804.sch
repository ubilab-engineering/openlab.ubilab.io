<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ medications.sch ]O@%#o>>=-
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    PCC medication (1.3.6.1.4.1.19376.1.5.3.1.4.7)  
    
    
    Historique :
    02/08/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="medications-errors">
    <title>IHE PCC v3.0 Medications</title>
       
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.7"]'>
        
        <!-- Conformité template CCD -->
        
        <assert test='cda:templateId[@root = "2.16.840.1.113883.10.20.1.24"]'>
            [medications] Toute entrée 'Medications' doit se conformer au template 
            'CCD Medication activity' (2.16.840.1.113883.10.20.1.24). Cette identification est obligatoire</assert>
        
        <assert test='count(cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7.1"] | 
            cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.8"] |
            cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.9"] |
            cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.10"] |
            cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.11"])  = 1'>
            
            [medications] Toute entrée 'Medications' doit se conformer à l'un des templates suivant,
            identifiant le type de dosage utilisé pour la prescription/administration du médicament : 
            normal dosing (1.3.6.1.4.1.19376.1.5.3.1.4.7.1), tapered dosing (1.3.6.1.4.1.19376.1.5.3.1.4.8), 
            split dosing (1.3.6.1.4.1.19376.1.5.3.1.4.9), conditional dosing (1.3.6.1.4.1.19376.1.5.3.1.4.10), 
            combination dosing (1.3.6.1.4.1.19376.1.5.3.1.4.11) 
            Cette identification est obligatoire.</assert>
        
        <assert test='not(cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7.1"]) or 
            count(.//cda:substanceAdministration) = 0'>
            [medications] L'utilisation du template normal dosing (1.3.6.1.4.1.19376.1.5.3.1.4.7.1) 
            dans une entrée 'Medications' implique que l'élément 'substanceAdministration' ne comporte pas d'éléments 
            'substanceAdministration' subordonné.</assert>
        
        <assert test='count(cda:id) = 1'>
            [medications] un élément 'substanceAdministration' doit avoir un identifiant unique. Si l'éditeur de
            la source (LPS, SIH,...) n'a pas prévu celle-ci, on pourra lui substituer un GUID, utilisé pour l'attribut 'root',
            l'attribut 'extension' pouvant alors être omis.
            Note: même si HL7 admet qu'un élément puisse avoir plusieurs identifiants, cette entrée n'en utilisera qu'un, et un seul.</assert>
        
        <assert test='cda:statusCode[@code = "completed"]'>
            [medications] l'élément 'statusCode' de tout élément 'substanceAdministration' d'une entrée 'Medications' 
            est obligatoirement fixé à la valeur 'completed': soit l'acte a été réalisé, soit la prescription a été faite.</assert>
        
        <assert test='cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[@codeSystem="1.2.250.1.213.2.3.1" or @nullFlavor="UNK"]'>
            [medications] Le médicament doit obligatoirement être codé en utilisant la terminologie CIS (1.2.250.1.213.2.3.1) ou utiliser l'attribut NullFlavor='UNK'</assert>   
        
        <assert test='cda:consumable/cda:manufacturedProduct/cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.7.2"]'>
            [medications] L'élément 'consumable' doit obligatoirement être présent dans une entrée 'Medications'.
            Il comportera une entrée 'manufacturedProduct' se conformant au template 'Product Entry' (1.3.6.1.4.1.19376.1.5.3.1.4.7.2).</assert>   
        

<!-- Alertes
               
        <assert test='(cda:effectiveTime[1][@xsi:type="IVL_TS"]) and
            cda:effectiveTime[1]/cda:low[@value or @nullFlavor="UNK"] and
            cda:effectiveTime[1]/cda:high[@value or @nullFlavor="UNK"]'>
            Erreur de Conformité PCC (Alerte): La première occurence de l'élément 'effectiveTime' est requise 
            et code le début et la fin du traitement.
            S'agissant d'un intervalle de temps, il sera spécifié comme tel (@xsi:type="IVL_TS").
            Les attributs 'low' et 'high' de cet élément représentent respectivement le début et la fin du tratement prescrit.
            Si ces dates sont inconnues, un attribut nullFlavor attribute les remplacera avec une valeur fixée à 'UNK'.</assert>
        
        
        <assert test='cda:effectiveTime[@operator="A"]'>
            Erreur de Conformité PCC (Alerte): La fréquence d'administration est requise si elle est connue. 
            Celle-ci sera un élément effectiveTime avec un attribut 'operator' égal à 'A'.
        </assert>
        
        <assert test='cda:routeCode'>
            Erreur de Conformité PCC (Alerte): L'élément routeCode' (voie d'administration) est requis s'il est connu.</assert>
                
        <assert test='cda:doseQuantity'>
            Erreur de Conformité PCC (Alerte): L'élément 'doseQuantity' est requis s'il est connu.
        </assert>
        
        <assert test='cda:rateQuantity'>
            Erreur de Conformité PCC (Alerte): L'élément 'rateQuantity' est requis s'il est connu. 
        </assert>
 -->
        
    </rule>
</pattern>




