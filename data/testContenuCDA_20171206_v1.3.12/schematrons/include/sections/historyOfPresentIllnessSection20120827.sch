<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ historyOfPresentIllnessSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section IHE PCC History of Present Illness Section: 1.3.6.1.4.1.19376.1.5.3.1.3.4
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/08/12 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="historyOfPresentIllnessSection-errors">

    <title>IHE PCC v3.0 History of Present Illness Section</title>
        
        
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.4"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
            <assert test='../cda:section'> 
                Erreur [historyOfPresentIllnessSection]: 'History of Present Illness' ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "10164-2"]'> 
            Erreur [historyOfPresentIllnessSection]: Le code de la section 'History of Present Illness' doit être '10164-2'              
            </assert> 
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                Erreur [historyOfPresentIllnessSection]: L'élément 'codeSystem' de la section 
                'History of Present Illness' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test='cda:title'>
            Erreur [historyOfPresentIllnessSection]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        
        <assert test='cda:id'>
            Erreur [historyOfPresentIllnessSection]: La section doit avoir un identifiant unique permettant de les identifier.
        </assert>
        
        <assert test='cda:text'>
            Erreur [historyOfPresentIllnessSection]: La section doit avoir un élément text.
        </assert>
    </rule>
    
        
</pattern>

