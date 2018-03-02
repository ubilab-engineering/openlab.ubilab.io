<?xml version="1.0" encoding="UTF-8"?>

<!--  CI-SIS  Section: 1.2.250.1.213.1.1.2.37 -->

<!--                  -=<<o#%@O[ imageIllustrative.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Section Image Illustrative" (1.2.250.1.213.1.1.2.37)
    aux spécifications du CI-SIS
   
   
    
    Historique :
    05/10/16 : NMA : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="imageIllustrative-errors">
    <title>CI-SIS - Section Image Illustrative</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.37"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [imageIllustrative] 'Image Illustrative' ne peut être utilisé que comme section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "52040-3"]'> 
            [imageIllustrative] Le code de la section 'Image Illustrative' doit être '52040-3' 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [imageIllustrative] L'attribut 'codeSystem' de la section a pour valeur '2.16.840.1.113883.6.1' (LOINC). 
        </assert>
        <!-- Vérifier la présence d'un organizer 'Document Attaché' -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"]'>
            [imageIllustrative] Cette section doit contenir un organizer 'Document Attaché'. 
        </assert> 
       <!-- <!-\- Vérifier la présence d'un label 'Papille optique' -\->
        <assert test='not(.//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"])
            or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="T-AA630")'>
            [imageIllustrative] L'organizer 'Document Attaché' de cette section doit comporter un élément 'Papille Optique'. 
        </assert> 
        <!-\- Vérifier la présence d'un label 'Papille Oeil gauche' -\->
        <assert test='not(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="T-AA630")
            or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value[@code="T-AA630"]/cda:qualifier/cda:value/@code="G-A101")'>
            [imageIllustrative] L'organizer 'Document Attaché' de cette section doit comporter un élément 'Papille OG'. 
        </assert> 
        <!-\- Vérifier la présence d'un label 'Papille Oeil droit' -\->
        <assert test='not(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="T-AA630")
            or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value[@code="T-AA630"]/cda:qualifier/cda:value/@code="G-A100")'>
            [imageIllustrative] L'organizer 'Document Attaché' de cette section doit comporter un élément 'Papille OD'. 
        </assert> 
        <!-\- Vérifier la présence d'un label 'Macula Oeil gauche' -\->
        <assert test='not(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="T-AA620")
            or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value[@code="T-AA620"]/cda:qualifier/cda:value/@code="G-A101")'>
            [imageIllustrative] L'organizer 'Document Attaché' de cette section doit comporter un élément 'Macula OG'. 
        </assert> 
        <!-\- Vérifier la présence d'un label 'Macula Oeil droit' -\->
        <assert test='not(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="T-AA620")
            or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value[@code="T-AA620"]/cda:qualifier/cda:value/@code="G-A100")'>
            [imageIllustrative] L'organizer 'Document Attaché' de cette section doit comporter un élément 'Macula OD'. 
        </assert> -->
    </rule>
    
</pattern>