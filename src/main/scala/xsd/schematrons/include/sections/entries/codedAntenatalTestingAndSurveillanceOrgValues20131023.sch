<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ codedAntenatalTestingAndSurveillanceOrgValues20131023.sch ]O@%#o>>=-
    
    Teste la conformité de l'organizer "Coded Antenatal Testing and Surveillance Organizer" (1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedAntenatalTestingAndSurveillanceOrgValues-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing and Surveillance Organizer</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10"]'>
        <assert test='(.//cda:component/cda:observation/cda:code[@code="OBS_020"])'>
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit comporter un élément 'Anomalie de croissance intra-utérine (OBS_020)'.        
        </assert>
        <assert test='(.//cda:component/cda:observation/cda:code[@code="OBS_021"])'>
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit comporter un élément 'Anomalie constitutionnelle' (OBS_021).        
        </assert>
        <assert test='(.//cda:component/cda:observation/cda:code[@code="OBS_023"])'>
            [codedAntenatalTestingAndSurveillanceOrgValues]L'organizer coded Antenatal 
            Testing and Surveillance doit comporter un élément 'Autres Foetopathie acquises' (OBS_023).        
        </assert>
        <assert test='(.//cda:component/cda:observation/cda:code[@code="OBS_024"])'>
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit compporter un élément 'Pathologie fœtale spécifique des grossesses multiples' (OBS_024).        
        </assert>
        <assert test='(.//cda:component/cda:observation/cda:code[@code="OBS_274"])'>
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit compporter un élément 'Nombre de Foetus' (OBS_274).        
        </assert>
        <assert test='(.//cda:component/cda:observation/cda:code[@code="OBS_275"])'>
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit compporter un élément 'Metrorragies du premier trimestre' (OBS_275).        
        </assert>
        
    </rule>
</pattern>

