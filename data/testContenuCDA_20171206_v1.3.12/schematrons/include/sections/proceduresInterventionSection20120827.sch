<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ proceduresInterventionSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Procedures" (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    06/05/15 : JDS : Correction du texte affiché ( "Le code de la section 'Procedures' doit être '29544-3' ")
    12/08/16 : NMA : Correction du code de la section Procedures and interventions
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="proceduresInterventionSection-errors">
    <title>IHE PCC v3.0 Procedures and Intervention Section</title>

        <title>IHE PCC v3.0 Procedures and Interventions Section</title>
        
        
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
            <assert test='../cda:section'> 
                Erreur [proceduresInterventionSection]: 'Procedures' ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
        <!--<assert test='cda:code[@code = "29544-3"]'> 
            Erreur [proceduresInterventionSection]: Le code de la section 'Procedures' doit être '29544-3'              
            </assert> -->
        <assert test='cda:code[@code = "29554-3"]'> 
            Erreur [proceduresInterventionSection]: Le code de la section 'Procedures' doit être '29554-3'              
        </assert> 
        
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                Erreur [proceduresInterventionSection]: L'élément 'codeSystem' de la section 
                'Procedures' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
            <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.19"]'> 
                <!-- Vérifier que la section contient des éléments Procedure Entry -->
                Erreur [proceduresInterventionSection]: Une section "Procedures and Interventions" doit contenir des entrée de type "Procedures entry"
            </assert> 
        </rule> 
        
    </pattern>