<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ OBP_codedSocialHistoryValues.sch ]O@%#o>>=-

Teste la conformité de la section "Coded Social History" (1.3.6.1.4.1.19376.1.5.3.1.3.16.1)
aux spécifications d'IHE PCC v3.0
Vérification que les entrées sont du type Social History Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13.4)

Historique :
24/06/11 : CRI : Création

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="OBP_codedSocialHistoryValues-errors">
   
    <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>   
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]'> 
        
        <assert test='.//cda:code[
            @code = "XX-MCH177" 
            or @code="XX-MCH181"
            or @code="OBS_011"
            or @code="OBS_012"
            or @code="OBS_013"
            ]'> 
            [OBP_codedSocialHistoryValues] La section "Coded Social History"  doit uniquement contenir des éléments spécifiés dans le volet OBP.
        </assert> 
    </rule>
</pattern>

