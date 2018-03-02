<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ newbornDeliverySection.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Newborn Delivery Information Section" (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    16/01/17 : NMA : Seul "Detailed Physical Examination" est obligatoire
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="newbornDeliverySection-errors">
    <title>IHE PCC Newborn Delivery Information Section</title>

    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4"]'> 
    <!-- Verifier que le templateId est utilisé pour une section --> 
    <assert test='../cda:section'> 
        [newbornDeliverySection] le templateId de 'Newborn Delivery Information Section' ne peut être utilisé que pour une section. 
    </assert> 
 
    <!-- Vérifier le code de la section -->

        <assert test='cda:code[@code = "57075-4"]'> 
            [newbornDeliverySection] Le code utilisé pour la section "Newborn Delivery Information " doit être "57075-4" 
            </assert> 
    <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
        [newbornDeliverySection] La nomenclature LOINC doit être utilisée pour coder la section "Newborn Delivery Information Section"  
        system (2.16.840.1.113883.6.1). 
    </assert> 
   <!-- <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'> 
        <!-\- Note any missing optional elements -\->
        [newbornDeliverySection]:Cette section doit contenir une sous-section 'Procédures et interventions'.
    </assert>-->
        
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'> 
        <!-- Note any missing optional elements -->
            [newbornDeliverySection]:Cette section doit contenir une sous-section 'Detailed Physical Examination'.
        </assert>
<!--        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.21.2.123"]'> 
            <!-\- Note any missing optional elements -\->
            [newbornDeliverySection]:Cette section doit contenir une sous-section 'Newborn Scoring Assessment section'.
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.21.2.124"]'> 
            <!-\- Note any missing optional elements -\->
            [newbornDeliverySection]:Cette section doit contenir une sous-section 'Newborn Measurements section'.
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.7.3.1.1.13.7"]'> 
            <!-\- Note any missing optional elements -\->
            [newbornDeliverySection]:Cette section doit contenir une sous-section 'Coded Event Outcomes'.
        </assert>-->
    </rule> 
        
    </pattern>