<?xml version="1.0" encoding="UTF-8"?>

<!--  IHE PCC v3.0  Section: 1.3.6.1.4.1.19376.1.5.3.1.3.31 -->

<!--                  -=<<o#%@O[ FRCP_carePlan.sch ]O@%#o>>=-
    

    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_carePlan-errors">
    <title>IHE PCC v3.0 Care Plan Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.31"]'> 
        
        <!-- 
        <assert test="cda:entry/cda:procedure/cda:code[@code='P0-0000E']">
            Erreur [FRCP_carePlan]: L'indication de la présence ou l'absence de prise en charge est obligatoire.
        </assert> -->
<!-- 
        <assert test="cda:entry/cda:observation/cda:code[@code='RCP_042' or
            @code='RCP_050' or
            @code='RCP_062']">
            Erreur [FRCP_carePlan]: Les demande d'examens complémentaires sont des valeurs contenues dans le jeu de valeurs 'RCP_TypeExamenComp'.
        </assert>
 -->        
        <assert test="not(cda:entry/cda:observation/cda:code[@code='P0-0000E']) or
            cda:entry/cda:observation/cda:code[@code='RCP_062'] and
            cda:entry/cda:observation/cda:text/cda:reference[@value]">
            Erreur [FRCP_carePlan]: Indiquer le détail de la demande d'expertise/examen complémentaires.
        </assert>
        <!-- 
        <assert test="not(cda:entry/cda:procedure/cda:code[@code='RCP_062' or @code='RCP_061']) or
            cda:entry/cda:procedure/cda:code[@code='P5-C0300' or @code='0']">
            Erreur [FRCP_carePlan]: La proposition thérapeutiques doivent se faire à partir des choix proposés dans le jeu de valeurs FRCP_TypeTraitement
        </assert>
         -->
    </rule>
    
</pattern>



