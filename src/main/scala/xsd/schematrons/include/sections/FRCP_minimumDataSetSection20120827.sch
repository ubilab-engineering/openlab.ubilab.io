<!--   ASIP FRCP Minimum Data Set Section: 1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5 -->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_minimumDataSet-errors">
    <title>ASIP FRCP Minimum Data Set Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5"]'>
<!-- 
        <assert test="not(cda:entry/cda:observation/cda:code[@code='RCP_082']) or
            cda:entry/cda:observation/cda:code[@code='RCP_082'] and
            cda:entry/cda:observation/cda:value[@code='RCP_069' or
            @code='RCP_070' or
            @code='RCP_071' or
            @code='RCP_072' or
            @code='RCP_073']">
            Erreur [FRCP_minimumDataSet]: Les résultats de l'évaluation de performance OMS. sont des valeurs contenues dans le jeu de valeurs 'RCP_OMSEchPerf'.
        </assert>
        
        <assert test="not(cda:entry/cda:observation/cda:code[@code='RCP_082']) or
            cda:entry/cda:observation/cda:code[@code='RCP_082'] and
            cda:entry/cda:observation/cda:interpretationCode[@code='RCP_001' or
            @code='RCP_002' or
            @code='RCP_003' or
            @code='RCP_004' or
            @code='RCP_005']">
            Erreur [FRCP_minimumDataSet]: L'interprétation des résultats de l'évaluation de performance OMS. sont des valeurs contenues dans le jeu de valeurs 'RCP_OMSInterpret'.
        </assert>
         -->
        <assert test="not(cda:entry/cda:observation/cda:code[@code='RCP_042']) or
            cda:entry/cda:observation/cda:code[@code='RCP_042'] and
            cda:entry/cda:observation/cda:value/cda:originalText/cda:reference[@value]">
            Erreur [FRCP_minimumDataSet]: Les résultats de l'évaluation onco-gériatrique sont au format texte.
        </assert>
    </rule>
</pattern>

