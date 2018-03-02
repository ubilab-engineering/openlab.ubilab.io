<!--  IHE PCC Minimum Data Set Section: 1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5 -->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="minimumDataSet-errors">
    <title>IHE PCC Minimum Data Set Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5"]'> 
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur [minimumDataSetSection]: Ce template ne peut être utilisé que pour une section. 
        </assert>

        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "46006-3"]'> 
            Erreur [minimumDataSetSection]: Le code de la section 'Minimum Data Set' doit être 46006-3
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [minimumDataSetSection]: L'élément 'codeSystem' de la section 'Minimum Data Set' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test='cda:title'>
            Erreur [minimumDataSetSection]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        
        <assert test='cda:id'>
            Erreur [minimumDataSetSection]: Les sections doivent avoir un identifiant unique permettant de les identifier.
        </assert>
        
       <!-- <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.3.6"] or 
            .//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.3.7"]'>
            Erreur [minimumDataSetSection]: Cette section doit contenir au minimum un élément 'Survey Panel' ou une observation de type 'Survey Observation'. 
        </assert> -->

        
    </rule>
    
</pattern>
