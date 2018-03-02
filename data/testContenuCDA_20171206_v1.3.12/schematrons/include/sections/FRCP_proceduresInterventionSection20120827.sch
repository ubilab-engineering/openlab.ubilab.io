<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ FRCP_proceduresInterventionSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Procedures" (1.3.6.1.4.1.19376.1.5.3.1.3.12)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_proceduresIntervention-errors">


        <title>ASIP FRCP Procedures and Interventions Section</title>
        
        
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.12"]'> 
           
        <assert test="cda:entry/cda:procedure/cda:code[@code='P1-00000' or
            @code='P5-C0300' or
            @code='P2-67010' or
            @code='P2-00200' or
            @code='P2-01351' or
            @code='P5-C0600' or
            @code='RCP_076' or
            @code='P2-69200' or
            @code='RCP_077' or
            @code='RCP_078' or
            @code='RCP_061' or
            @code='RCP_080' or
            @code='P0-0044D' or
            @code='RCP_081']">
            Erreur [FRCP_minimumDataSet]: Les prises en charge proposées sont des valeurs contenues dans le jeu de valeurs 'RCP_TypeTraitement'.
        </assert>
        
        <assert test="not(cda:entry/cda:procedure/cda:code[@code='P0-0044D']) or
            cda:entry/cda:procedure/cda:code[@code='P0-0044D'] and
            cda:entry/cda:procedure/cda:code/cda:originalText/cda:reference[@value]">
            Erreur [FRCP_minimumDataSet]: Indiquer le détail de la prise en charge sous format texte.
        </assert>
        
            
        </rule> 
        
    </pattern>