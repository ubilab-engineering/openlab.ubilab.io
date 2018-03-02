<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ statutFRCP.sch ]O@%#o>>=-
    
    Teste la conformité de la section ASIP Statut de la FRCP: 1.2.250.1.213.1.1.2.33
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/08/12 : CRI : Création
    14/01/2013 : CRI: adaptation modification value sets
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="statutFRCPSection-errors">

    <title>ASIP Section Statut de la FRCP</title>
        
        
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.33"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
            <assert test='../cda:section'> 
                Erreur [statutFRCPSection]: 'Statut de la FRCP' ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "21874-3"]'> 
            Erreur [statutFRCPSection]: Le code de la section 'Statut de la FRCP' doit être '21874-3'              
            </assert> 
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                Erreur [statutFRCPSection]: L'élément 'codeSystem' de la section 
                'Statut de la FRCP' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test='cda:title'>
            Erreur [statutFRCPSection]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        
        <assert test='cda:id'>
            Erreur [statutFRCPSection]: La section doit avoir un identifiant unique permettant de les identifier.
        </assert>
        
        <assert test="cda:entry/cda:organizer/cda:component/cda:observation/cda:code[@code='RCP_086']">
            Erreur [statutFRCPSection]: Le Statut du Quorum doit être indiqué.
        </assert>
        <!--  
        <assert test="cda:entry/cda:organizer/cda:component/cda:observation/cda:code[@code='RCP_086'] and 
            cda:entry/cda:organizer/cda:component/cda:observation/cda:value[@code='RCP_089' or
            @code='RCP_090']">
            Erreur [statutFRCPSection]: La valeur donnée pour le Statut du Quorum ne fait pas partie des valeurs permises.
            </assert>-->
        
        <assert test="cda:entry/cda:organizer/cda:component/cda:observation/cda:code[@code='RCP_087']">
            Erreur [statutFRCPSection]: Le Statut du cas présenté doit être indiqué.
        </assert>
        <!-- 
        <assert test="cda:entry/cda:organizer/cda:component/cda:observation/cda:code[@code='RCP_087'] and 
            cda:entry/cda:organizer/cda:component/cda:observation/cda:value[@code='RCP_091' or
            @code='RCP_092']">
            Erreur [statutFRCPSection]: La valeur donnée pour le Statut du Cas Présenté ne fait pas partie des valeurs permises.
        </assert> -->
        <!-- 
        <assert test="cda:entry/cda:organizer/cda:component/cda:observation/cda:code[@code='RCP_088']">
            Erreur [statutFRCPSection]: Le contexte (urgence) doit être indiqué.
        </assert> -->
    </rule>
</pattern>

