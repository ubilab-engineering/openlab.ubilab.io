<?xml version="1.0" encoding="UTF-8"?>

<!--  CI-SIS  organizer : 1.2.250.1.213.1.1.3.18 -->

<!--                  -=<<o#%@O[ organizerDocIncl.sch ]O@%#o>>=-
    
    Teste la conformité de l'organizer "Document Attaché" (1.2.250.1.213.1.1.3.18)
    aux spécifications du CI-SIS
   
   
    
    Historique :
    24/06/11 : CRI : Création
    27/01/17 : LBE : Il a été décider de ne pas rendre cette section trop contraignante afin de pouvoir la réutiliser. Les condition sur le type de document (68764-9) ainsi que l'obligation d'une observation media ont été commentées.
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="organizerDocIncl-errors">
    <title>CI-SIS - Organizer "Document Attaché"</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.18"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:organizer'> 
            [organizerDocIncl] 'Document Attaché' ne peut être utilisé que comme élément organizer. 
        </assert> 
        <!-- Vérifier le code de l'organizer --> 
        <assert test='cda:code[@code = "55107-7"]'> 
            [organizerDocIncl] Le code de l'entrée 'Document attaché' doit être '55107-7' 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [organizerDocIncl] L'attribut 'codeSystem' de la section a pour valeur '2.16.840.1.113883.6.1' (LOINC). 
        </assert>         
       <!-- <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:code/@code='69764-9'">
            [organizerDocIncl] : Un organizer "Document attaché" doit contenir une entrée "Type de document"
        </assert>
        <assert test="cda:component/cda:observationMedia">
            [organizerDocIncl] : Un organizer "Document attaché" doit contenir une entrée "observationMedia"
        </assert>   -->
        <assert test="not(cda:component/cda:observationMedia) 
            or(cda:component/cda:observationMedia/cda:value/@representation='B64')">
            [organizerDocIncl] : Un organizer "Document attaché" doit contenir une entrée "observationMedia" codée en B64
        </assert> 
    </rule>
    
</pattern>