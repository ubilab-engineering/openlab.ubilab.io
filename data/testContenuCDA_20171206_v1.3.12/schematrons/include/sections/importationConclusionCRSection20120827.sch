<!--  ASIP Section Importation Conclusion CR :1.2.250.1.213.1.1.2.34 -->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="importationConclusionCR-errors">
    <title>ASIP Section Importation Conclusion CR</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.34"]'> 
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur [importationConclusionCR]: Ce template ne peut être utilisé que pour une section. 
        </assert>
        
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "30954-2"]'> 
            Erreur [importationConclusionCR]: Le code de la section 'Importation Conclusion CR' doit être 30954-2
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [importationConclusionCR]: L'élément 'codeSystem' de la section 'Importation Conclusion CR' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test='cda:title'>
            Erreur [importationConclusionCR]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        <assert test='cda:id'>
            Erreur [importationConclusionCR]: Les sections doivent avoir un identifiant unique permettant de les identifier.
        </assert>

        
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'> 
            <!-- Note any missing optional elements -->
            [importationConclusionCR]:Cette section ne contient pas de Sous-section 'Procédures et interventions'.
        </assert> 
        
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.8.1.2.5"]'> 
            <!-- Note any missing optional elements -->
            [importationConclusionCR]:Cette section ne contient pas de Sous-section 'Conclusions de CR-ACP'.
        </assert> 
    </rule>
    
</pattern>
        
