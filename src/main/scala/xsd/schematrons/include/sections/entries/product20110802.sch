<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ product.sch ]O@%#o>>=-
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
    PCC Product Entry (1.3.6.1.4.1.19376.1.5.3.1.4.7.2)  
    
    
    Historique :
    02/08/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="product-errors">
    <title>IHE PCC v3.0 Product Entry</title>
       
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.7.2"]'>
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.53"]'>
            Erreur de Conformité PCC: Le template CCD parent 'Product' (2.16.840.1.113883.10.20.1.53) 
            est requis dans une entrée 'Product Entry'.</assert>
        
        <assert test='not(cda:manufacturedMaterial) 
            or (cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference)'>
            Erreur de Conformité PCC: Le nom et le dosage du médicament doit être spécifié dans 
            une entrée 'Product Entry' à partir de l'élément 'manufacturedMaterial'.
            L'élément 'originalText' contiendra un élément 'reference' dont l'URI pointera vers le nom 
            générique et le dosage (force) du médicament si celle-ci est pertinente.</assert>
        
        <!-- warning 
        
        
        <assert test='not(cda:manufacturedMaterial) or (cda:manufacturedMaterial/cda:name)'>
            Erreur de Conformité PCC (Alerte): L'élément 'name' dans une entrée 'Product Entry' devrait contenir 
            le nom de fantaisie du médicament.</assert>
        -->
    </rule>
</pattern>
