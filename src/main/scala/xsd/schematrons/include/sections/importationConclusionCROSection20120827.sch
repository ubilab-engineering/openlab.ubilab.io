<!--  ASIP Section Importation Conclusion CRO :1.2.250.1.213.1.1.2.26 -->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="importationConclusionCRO-errors">
    <title>ASIP Section Importation Conclusion CRO</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.26"]'> 
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur [importationConclusionCRO]: Ce template ne peut être utilisé que pour une section. 
        </assert>
        
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "22033-5"]'> 
            Erreur [importationConclusionCRO]: Le code de la section 'Importation Conclusion CRO' doit être 22033-5
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [importationConclusionCRO]: L'élément 'codeSystem' de la section 'Importation Conclusion CR' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test='cda:title'>
            Erreur [importationConclusionCRO]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        <assert test='cda:id'>
            Erreur [importationConclusionCRO]: Les sections doivent avoir un identifiant unique permettant de les identifier.
        </assert>
        <assert test='cda:text'>
            Erreur [importationConclusionCRO]: Les sections doivent avoir un élément text.
        </assert>
        
    </rule>
    
</pattern>
        
