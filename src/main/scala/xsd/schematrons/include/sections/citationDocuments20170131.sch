<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[Citation de document ]O@%#o>>=-
    
    Cette section contient des entrées external Référence permettant de faire référence à d'autres documents
    
    Historique :
    31/01/2017 : LBE : Création    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="citationDocuments-errors">
    <title>IHE PCC v3.0 Citation de documents Section</title>

    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.55"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
       
        
            <assert test='../cda:section'> 
                Erreur [citation doucment Section]:  ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
            <assert test='cda:code[@code = "LP72255-0"]'> 
            Erreur [citation doucment Section]: Le code de la section doit être 'LP72255-0'              
            </assert>
       
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                Erreur [citation doucment Section]: L'élément 'codeSystem' de la section 
                doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.4"]'> 
                <!-- Vérifier que la section contient des éléments externalReference Entry -->
            Erreur [citation doucment Section]: Une section  doit contenir des entrée de type "External Reference" (1.3.6.1.4.1.19376.1.5.3.1.4.4)
            </assert> 
        </rule> 
        
    </pattern>