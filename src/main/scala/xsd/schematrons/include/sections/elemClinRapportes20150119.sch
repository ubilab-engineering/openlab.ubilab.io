<?xml version="1.0" encoding="UTF-8"?>

<!--  CI-SIS  Section: 1.2.250.1.213.1.1.2.46 -->

<!--                  -=<<o#%@O[ elemClinRapportes.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Eléments Cliniques Rapportés" (1.2.250.1.213.1.1.2.46)
    aux spécifications du CI-SIS
   
   
    
    Historique :
    24/06/11 : CRI : Création
    13/12/16 : LBE : mise en commentaire de la condition imposant le code 55752-0.  Il faut discuter de la possibilité de publier une section générique et de la surcontraindre en fonction des besoins des volets
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="elemClinRapportes-errors">
    <title>CI-SIS - Section Eléments Cliniques Rapportés</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.46"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient --> 
        <assert test='../cda:section'> 
            [elemClinRapportes] 'Eléments Cliniques Rapportés' ne peut être utilisé que comme section. 
        </assert> 
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "55107-7"]'> 
            [elemClinRapportes] Le code de la section 'Eléments Cliniques Rapportés' doit être '55107-7' 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [elemClinRapportes] L'attribut 'codeSystem' de la section a pour valeur '2.16.840.1.113883.6.1' (LOINC). 
        </assert>
        
        <!-- Vérifier la présence d'un organizer 'Document Attaché' -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"]'>
            [elemClinRapportes] Cette section doit contenir un organizer 'Document Attaché'. 
        </assert> 
        
        <!-- Vérifier la présence d'un label 'Information Clinique' -->
        <assert test='(.//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"])'>
           <!-- or(.//cda:organizer[cda:templateId/@root = "1.2.250.1.213.1.1.3.18"]/cda:component/cda:observation/cda:value/@code="55752-0")'>-->
            [elemClinRapportes] L'organizer 'Document Attaché' de cette section doit être identifié comme 'Information Clinique'. 
        </assert> 

    </rule>
    
</pattern>