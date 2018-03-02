<!--  IHE PCC Coded Functional Status Section: 1.3.6.1.4.1.19376.1.5.3.1.1.12.2.1 -->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedFunctionalStatus-errors">
    <title>IHE PCC Progress Note Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.2.1"]'> 
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur [codedFunctionalStatusSection]: Ce template ne peut être utilisé que pour une section. 
        </assert>
        <!-- Verifier la présence du templateId parent. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.3.17"]'> 
            Erreur [codedFunctionalStatusSection]: Le templateiD parent est absent. 
        </assert> 
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "47420-5"]'> 
            Erreur de Conformité : Le code de la section 'Progress Note' doit être 47420-5
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [codedFunctionalStatusSection] : L'élément 'codeSystem' de la section 'Progress Note' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test='cda:title'>
            Erreur [codedFunctionalStatusSection]: : Cette section doit avoir un titre significatif de son contenu.
        </assert>
        <assert test='cda:id'>
            Erreur [codedFunctionalStatusSection]:Les sections doivent avoir un identifiant unique permettant de les identifier.
        </assert>
        <assert test="./cda:component/cda:section/cda:templateId[
            @root = '1.3.6.1.4.1.19376.1.5.3.1.1.12.2.3' or
            @root = '1.3.6.1.4.1.19376.1.5.3.1.1.12.2.4' or
            @root = '1.3.6.1.4.1.19376.1.5.3.1.1.12.2.5']">
            Error: Au moins l'une des sous-sections optionnelles doit être présente.
        </assert>
        
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.2.2"]'> 
            <!-- Note any missing optional elements -->
            Erreur [codedFunctionalStatusSection]:Cette section Coded Functional Status Assessment ne contient pas de Pain Scale Assessment.
        </assert> 
        

    </rule>
    
</pattern>
        
