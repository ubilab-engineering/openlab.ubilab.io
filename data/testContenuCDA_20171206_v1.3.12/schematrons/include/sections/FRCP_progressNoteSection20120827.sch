<!--  ASIP FRCP Progress Note Section: 1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7 -->

<!-- errors -->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_progressNote-errors">
    <title>ASIP FRCP Progress Note Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->

        <assert test="cda:entry/cda:observation/cda:code[@code='RCP_051']">
            Erreur [FRCP_progressNote]: La phase du cancer (rechute-initiale) doit être indiquée.
        </assert>
        <!-- 
        <assert test="not(cda:entry/cda:observation/cda:code[@code='RCP_051']) or
            cda:entry/cda:observation/cda:code[@code='RCP_051'] and
            cda:entry/cda:observation/cda:value[@code='RCP_052' or
            @code='RCP_053']">
            Erreur [FRCP_progressNote]: La phase du cancer est l'une des valeurs contenues dans le jeu de valeurs 'RCP_PhaseCancer'.
        </assert>
         -->
        <assert test="cda:entry/cda:observation/cda:code[@code='RCP_059']">
            Erreur [FRCP_progressNote]: La progression du cancer doit être indiquée.
        </assert>
        
        <assert test="cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='RCP_055']">
            Erreur [FRCP_progressNote]: La présence ou l'absence de progression locale du cancer doit être indiquée.
        </assert>
        <assert test="cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='RCP_056']">
            Erreur [FRCP_progressNote]: La présence ou l'absence de progression régionale du cancer doit être indiquée.
        </assert>
        <assert test="cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@code='RCP_057']">
            Erreur [FRCP_progressNote]: La présence ou l'absence de progression à distance du cancer doit être indiquée.
        </assert>
    </rule>
    
    
    
</pattern>