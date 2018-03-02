<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ statutDocSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section ASIP Statut du document : 1.2.250.1.213.1.1.2.35
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/08/12 : CRI : Création
    14/01/2013 : CRI : adaptation au value set modifié: 3 statuts: "en cours", "complété", "validé"
    18/01/2013 : CRI : "neutralisation" de l'intitulé des value sets et des codes pour une utilisation transversale de la section
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="statutDocSection-errors">

    <title>ASIP Section Statut du document</title>
        
        
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.35"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
            <assert test='../cda:section'> 
                Erreur [statutDocSection]: 'Statut du document' ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "33557-0"]'> 
            [statutDocSection]: Le code de la section 'Statut du document' doit être '33557-0'              
            </assert> 
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                [statutDocSection]: L'élément 'codeSystem' de la section 
                'Statut du document' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test='cda:title'>
            [statutDocSection]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        
        <assert test='cda:id'>
            [statutDocSection]: La section doit avoir un identifiant unique permettant de les identifier.
        </assert>
        <!-- 
        <assert test="cda:entry/cda:observation/cda:code[@code='CDA_001'] and 
            cda:entry/cda:observation/cda:value[@code='CDA_002' or
            @code='RCP_003' or
            @code='RCP_004']">
            [statutDocSection]: La valeur donnée pour le Statut du document ne fait pas partie des valeurs permises.
        </assert>      -->  
    </rule>
</pattern>

