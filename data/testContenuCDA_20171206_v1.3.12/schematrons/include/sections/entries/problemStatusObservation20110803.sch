<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ problemStatusObservation.sch ]O@%#o>>=-
    
    Teste les entrées de la section PCC Problem Status Observation (1.3.6.1.4.1.19376.1.5.3.1.4.1.1)
    
    03/08/11 : CRI : Création
    08/10/12 : FMY : Remplacement des codes SNOMED CT par les codes SNOMED 3.5 pour observation/value
                     basé sur le contenu des fiches de patients à risque cardio
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="problemStatusObservation-errors">
        <title>IHE PCC v3.0 Problem Status Observation</title>
        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.1.1"]'>
            
            <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.57"] and 
                cda:templateId[@root="2.16.840.1.113883.10.20.1.50"]'>
                [ProblemStatusObservation]: Les templates Id CCD 'Problem Status Observation' (2.16.840.1.113883.10.20.1.50)
                et 'Status Observation' (2.16.840.1.113883.10.20.1.57) parents de l'entrée 'Problem Status Observation' seront présents.</assert>
            
            <assert test='cda:code[@code = "33999-4" and @codeSystem = "2.16.840.1.113883.6.1"]'>
                Erreur de Conformité PCC: l'élément 'code' d'une entrée 'Problem Status Observation' est obligatoire
                et signale qu'il s'agit d'une observation du statut clinique. L'attribut 'code' est fixé à la valeur '33999-4' 
                et l'attribut 'codeSystem' à la valeur '2.16.840.1.113883.6.1' (LOINC).</assert>
            
            <assert test='cda:text'>
                [ProblemStatusObservation]: l'élément 'observation' d'une entrée 'Problem Status Observation' comporte 
                une composante 'text' contenant un élément 'reference' pointant sur la partie narrative où la sévérité 
                de l'observation est signalée.</assert>
            
            <assert test='cda:statusCode[@code = "completed"]'>
                [ProblemStatusObservation]: L'attribut 'code' de l'élément 'statusCode' pour tous les éléments 'Problem Status
                observations' sera nécessarement fixé à la valeur 'completed' dans ce contexte.</assert>
 <!--           
            <assert test='cda:value[@xsi:type="CE" and @codeSystem="2.16.840.1.113883.6.96"] and 
                cda:value[@code = "55561003" or
                @code = "73425007" or
                @code = "90734009" or
                @code = "7087005" or
                @code = "255227004" or
                @code = "415684004" or
                @code = "410516002" or
                @code = "413322009"]'>
                Erreur de Conformité PCC: pour tout élément de type 'Problem Status', l'élément 'value' signale le statut clinique.
                Il est toujours représenté utilisant le datatype 'CE' (xsi:type='CE'). 
                Il sera codé à partir d'un jeu de valeurs provenant de la nomenclature SNOMED CT.
            </assert>
            FMY 8/10/12 : 
            Remplacé par l'assert ci-dessous, conformément au volet Modèles de Contenus CDA et à son annexe JDV. 
            Je ne modifie pas la date du fichier en attendant validation.
-->
            <assert test='cda:value[@xsi:type="CE"] and 
                cda:value[@code = "G-A397" or
                @code = "G-A230" or
                @code = "G-A270" or
                @code = "G-A378" or 
                @code = "G-A500" or
                @code = "G-A201" or
                @code = "G-A224" or
                @code = "CDA_002" or
                @code = "G-A201"]'>
                [ProblemStatusObservation] : pour tout élément de type 'Problem Status', l'élément 'value' signale le statut clinique.
                Il est toujours représenté utilisant le datatype 'CE' (xsi:type='CE') 
                et codé à partir du jeu de valeurs PCC_HealthStatusCodes.
            </assert>
            <!-- 
            CRI 10/10/14 : 
            Les valeurs G-A201, G-A202 et CDA_002 sont rajoutés. Ces valeurs étaient manquantes par rapport au jeu de valeurs initial en SNOMED CT -->
    <!-- Alerte -->

            <assert test='cda:text/cda:reference'>
                [ProblemStatusObservation]: Il'élément 'observation' d'une entrée 'Problem Status Observation' comporte 
                une composante 'text' contenant un élément 'reference' pointant sur la partie narrative où la sévérité 
                de l'observation est signalée.
            </assert>
            
        </rule>
        
        
    </pattern>
    
        
