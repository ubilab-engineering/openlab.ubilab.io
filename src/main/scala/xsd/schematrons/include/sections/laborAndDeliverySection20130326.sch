<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ laborAndDeliverySection.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Labor and Delivery" (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="laborAndDeliverySection-errors">
    <title>IHE PCC Labor and Delivery section</title>

<rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3"]'> 
    <!-- Verifier que le templateId est utilisé pour une section --> 
    <assert test='../cda:section'> 
        [laborAndDeliverySection] le templateId de 'Labor and Delivery' ne peut être utilisé que pour une section. 
    </assert> 
 
    <!-- Vérifier le code de la section -->
    <assert test='cda:code[@code = "57074-7"]'> 
        [laborAndDeliverySection] Le code utilisé pour la section "Labor and Delivery" doit être "57074-7" 
            </assert> 
    <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
        [laborAndDeliverySection] La nomenclature LOINC doit être utilisée pour coder la section "Labor and Delivery"  
        system (2.16.840.1.113883.6.1). 
    </assert> 
    <!-- 
    <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'> 
        
        [laborAndDeliverySection]:Cette section ne contient pas de Sous-section 'Procédures et interventions'.
    </assert> 
    
    <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.7.3.1.1.13.7"]'> 
        
        [laborAndDeliverySection]:Cette section ne contient pas de Sous-section 'Coded Event Outcome'.
    </assert> 
     -->
    
        </rule> 
        
    </pattern>