<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  Section: 1.2.250.1.213.1.1.2.32 -->

<!--                  -=<<o#%@O[ traitementLC.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Traitements au long cours" (1.2.250.1.213.1.1.2.32)
    aux spécifications du volet VSM du CI-SIS de l'ASIP Santé.    
   Pas d'entrée.

    
    Historique :
    30/05/12 : CRI : Création
    19/03/15 : JDS : Modification de la valeur de l'attribut code de l'élément code ( "10160-0" -> "18776-5")
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="traitementLC-errors">
    <title>CI-SIS Section Traitements au long cours</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.32"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            Erreur de Conformité : Ce template ne peut être utilisé que pour une section.
        </assert>         
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "18776-5"]'> 
            Erreur de Conformité : Le code de la section 'Traitements au long cours' doit être 18776-5
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur de Conformité : L'élément 'codeSystem' de la section 'Traitements au long cours' 
            doit être codé à partir de la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
    </rule>
    
</pattern>