<?xml version="1.0" encoding="UTF-8"?>

<!--  CI-SIS  Section: 1.2.250.1.213.1.1.2.38 -->

<!--                  -=<<o#%@O[ SV_informationAssure.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Section Informations Assuré" (1.2.250.1.213.1.1.2.38)
    aux spécifications du CI-SIS
   
   
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SV_informationAssure-errors">
    <title>CI-SIS - Section Informations Assuré</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.38"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [SV_informationAssure] 'Informations Assuré' ne peut être utilisé que comme section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "35525-4"]'> 
            [SV_informationAssure] Le code de la section 'Informations Assuré' doit être '35525-4' 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [SV_informationAssure] L'attribut 'codeSystem' de la section a pour valeur '2.16.840.1.113883.6.1' (LOINC). 
        </assert>
        <!-- Vérifier la présence d'un organizer 'Document Attaché' -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"]'>
            [SV_informationAssure] Cette section doit contenir un organizer 'Document Attaché'. 
        </assert> 
        <!-- Vérifier la présence d'un label 'Source de paiement' -->
        <assert test='not(.//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"])
            or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="48768-6")'>
            [SV_informationAssure] L'organizer 'Document Attaché' de cette section doit être identifié comme 'Source de Paiement'. 
        </assert> 

    </rule>
    
</pattern>