<?xml version="1.0" encoding="UTF-8"?>
<!--                  ### codedAdvanceDirectives20150701.sch ###
    
    Teste la conformité de la section "Coded Advance Directives" (1.3.6.1.4.1.19376.1.5.3.1.3.35)
    aux spécifications d'IHE PCC
    
    Historique :
    01/07/15 : TDA : Création
    
-->
<pattern  xmlns="http://purl.oclc.org/dsdl/schematron" id='codedAdvanceDirectives-errors'> 
    <title>IHE PCC v3.0 Coded Advance Directives Section</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.35"]'> 
        <!-- Verify that the template id is used on the appropriate type of object --> 
        <assert test='../cda:section'> 
            [codedAdvanceDirectives]: le templateId de 'Coded Advance Directives' 
            ne peut être utilisé que pour une section.
        </assert> 
        <!-- Verify that the parent templateId is also present. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.3.34"]'>
            [codedAdvanceDirectives]: le templateId parent n'est pas présent.de 'Coded Advance Directives' 
        </assert> 
        <!-- Verify the section type code --> 
        <assert test='cda:code[@code = "42348-3"]'> 
            [codedAdvanceDirectives] : Le code de la section 'Coded Advance Directives' doit être 42348-3 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [codedAdvanceDirectives] : L'attribut 'codeSystem' de la section 'Coded Advance Directives' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.13.7"]'> 
            <!-- Alert on any missing required if known elements -->
            [codedAdvanceDirectives] : la section 'Coded Advance Directives' doit avoir une 'Advance Directive Observation Entry'
            http://wiki.ihe.net/index.php?title=1.3.6.1.4.1.19376.1.5.3.1.3.35
        </assert> 
    </rule> 
</pattern>
