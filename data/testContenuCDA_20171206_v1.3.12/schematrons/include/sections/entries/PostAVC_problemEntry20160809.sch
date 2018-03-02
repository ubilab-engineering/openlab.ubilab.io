<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ problemEntry.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "Problem Entry" (1.3.6.1.4.1.19376.1.5.3.1.4.5)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    07/11/17 : NMA : Suppression du test sur la nomenclature utilisée pour un diagnostic
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="problemEntry-errors">
    <title>IHE PCC v3.0 Problem Entry</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']">

        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            Erreur [problemEntry]: Dans l'élément "Problem Entry", le format de base utilisé pour 
            représenter un problème utilise l'élément CDA 'observation' d'attribut classCode='OBS' pour
            signifier qu'il s'agit l'observation d'un problème, et moodCode='EVN', pour exprimer 
            que l'événement a déjà eu lieu. </assert>


        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.28']"> 
            Erreur [problemEntry]: Dans l'élément "Problem Entry", les éléments &lt;templateId&gt; 
            identifient l'entrée comme répondant aux spécifications de PCC et de CCD (2.16.840.1.113883.10.20.1.28). 
            Cette déclaration de conformité est requise.</assert>

        <assert test="count(./cda:id) = 1"> 
            Erreur [problemEntry]: L'élément "Problem Entry" doit nécessairement avoir un identifiant (&lt;id&gt;) 
            qui est utilisé à des fins de traçage. Si la source d'information du SIS ne fournit pas d'identifiant, 
            un GUID sera affecté comme attribut "root", sans extension (ex: id root='CE1215CD-69EC-4C7B-805F-569233C5E159'). 
            Bien que CDA permette l'utilisation de plusieurs identifiants, "Problem Entry" impose qu'un identifiant 
            seulement soit présent. </assert>

        <assert test="cda:statusCode[@code='completed']"> 
            Erreur [problemEntry]: Un élément "Problem Entry" décrit l'observation d'un fait clinique. 
            Son composant "statutCode" sera donc toujours fixé à la valeur code='completed'. </assert>

        <report test="cda:effectiveTime/cda:low[@value or @nullFlavor = 'UNK'] "> 
            Erreur [problemEntry]:  La notion du temps est inconnu .
            Dans ce cas, l'élément "low" aura pour attribut un "nullFlavor" fixé à la valeur 'UNK'.</report>
        
        <report test="cda:effectiveTime/cda:high[@value or @nullFlavor = 'UNK'] "> 
            Erreur [problemEntry]:  La notion du temps est inconnu .
            Dans ce cas, l'élément "high" aura pour attribut un "nullFlavor" fixé à la valeur 'UNK'.</report>


        <assert test="cda:value[@xsi:type='CD'] or cda:value[@xsi:type='BL'] "> 
            Erreur [problemEntry]: L'élément "value"   est   obligatoire.
            Cet élément est codé et son type sera de type 'CD' (xsi:type='CD') ou BL dans le cas ouc'est booléen. </assert>

        <assert
            test="(cda:value[@code and @codeSystem]) or
                    (not(cda:value[@code]) and not(cda:value[@codeSystem]))"> 
            Erreur [problemEntry]: Si l'élément "value" est codé (CD), les attributs "code" et "codeSystem" 
            seront obligatoirement présents. </assert>
       
        <!-- Un diagnostic est codé en CIM-10  -->
<!--        <assert
            test="not(cda:code[@code='G-1009'])
            or (cda:code[@code='G-1009'] and ((cda:value[@codeSystem='2.16.840.1.113883.6.3']) or (cda:value[@codeSystem='1.2.250.1.213.2.12']) or (cda:value[@codeSystem='1.2.250.1.213.1.1.4.321'])))"> 
            Erreur [problemEntry]: L'élément "value" est codé à partir de la CIM-10. </assert>-->
        
        
        <!-- Sévérité d'une affection -->
        <assert
            test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1']) &lt;= 1"> 
            Erreur [problemEntry]: Un et un seul élément évaluant la sévérité d'une affection 
            sera présent (entryRelationship) pour une entrée "Problem Entry" </assert>

        <assert
            test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1']) or
                    (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1'] and
                    cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true'])"> 
            Erreur [problemEntry]: un élément "entryRelationship" optionnel peut être présent 
            et donner une indication sur la sévérité d'une affection. S'il est présent, cet élément 
            se conformera au template Severity Entry (1.3.6.1.4.1.19376.1.5.3.1.4.1).
            Son attribut 'typeCode' prendra alors la valeur 'SUBJ' et 'inversionInd' la valeur 'true'. </assert>
        
        <!-- Statut d'une affection -->
        <assert
            test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']) &lt;= 1"> 
            Erreur [problemEntry]: Un et un seul élément évaluant le statut d'une affection (Problem Status Observation)
            sera présent par le biais d'une relation "entryRelationship" pour toute entrée "Problem Entry"</assert>

        <assert
            test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']) or
                    (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1'] and
                    cda:entryRelationship[@typeCode='REFR' and @inversionInd='false'])"> 
            Erreur [problemEntry]: un élément "entryRelationship" optionnel peut être présent 
            et donner une indication sur le statut clinique d'une affection -- cf. value set "PCC_ClinicalStatusCodes" (1.2.250.1.213.1.1.4.2.283.2). 
            S'il est présent, cet élément se conformera au template "Problem Status Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.1.1).
            Son attribut 'typeCode' prendra alors la valeur 'REFR' et 'inversionInd' la valeur 'false'.</assert>

        <!-- Statut de l'état de santé du patient -->
        <assert
            test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']) &lt;= 1"> 
            Erreur [problemEntry]: Un et un seul élément évaluant le statut de l'état de santé 
            d'un patient (Health Status Observation) sera présent par le biais d'une relation "entryRelationship" 
            pour toute entrée "Problem Entry". </assert>

        <assert
            test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']) or
                    (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2'] and
                    cda:entryRelationship[@typeCode='REFR' and @inversionInd='false'])"> 
            Erreur [problemEntry]: un élément "entryRelationship" optionnel peut être présent et donner
            une indication sur le statut de l'état de santé d'un patient -- cf. value set "PCC_HealthStatusCodes" (1.2.250.1.213.1.1.4.2.283.1). 
            S'il est présent, cet élément se conformera au template "Health Status Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.1.2).
            Son attribut 'typeCode' prendra alors la valeur 'REFR' et 'inversionInd' la valeur 'false'.</assert>
        
        <!-- Commentaire(s) -->
        <assert
            test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2']) or
                    (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2'] and
                    cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true'])"> 
            Erreur [problemEntry]: un ou plusieurs éléments "entryRelationship" optionnels peuvent être présents et 
            permettre d'apporter des informations additionnelles sur le problème observé.
            S'il est présent, cet élément se conformera au template "Comment Entry" (1.3.6.1.4.1.19376.1.5.3.1.4.2).
            Son attribut 'typeCode' prendra alors la valeur 'SUBJ' et 'inversionInd' la valeur 'true'.</assert>

        <assert test="cda:code">  
            Erreur [problemEntry] (Alerte): L'élément code -- cf. jeu de valeurs "PCC_ProblemCodes" (1.2.250.1.213.1.1.4.2.283.3) 
            d'une entrée Problem Entry permet d'établir à quel stade diagnostique se positionne un problème : par exemple un diagnostic 
            est un stade plus évolué qu'un symptôme dans la description d'un problème. Cette évaluation est importante pour les cliniciens. </assert>
        
        
        <report test="cda:uncertaintyCode"> 
            Erreur [problemEntry] (Alerte): CDA permet à la description d'un état clinique un certain degré d'incertitude avec 
            l'élément "uncertaintyCode". En l'absence actuelle de consensus clairement établi sur le bon usage de cet élément, 
            PCC déconseille de l'utiliser dans le cadre d'une entrée Problem Entry.</report>   
        
        <report test="cda:confidentialityCode"> 
            Erreur [problemEntry] (Alerte): CDA permet l'utilisation de l'élément "confidentialtyCode" pour une observation.
            PCC déconseille cependant pour des raisons pratiques de l'utiliser dans le cadre d'une entrée Problem Entry.
            Il y a en effet d'autres manières d'assurer la confidentialité des documents, qui pourront être résolus au sein
            du domaine d'affinité.</report>
        
        <assert test="not(cda:value[@codeSystem]) or cda:value[@codeSystemName]"> 
            Erreur [problemEntry] (Alerte): les attributs "codeSystem" et "codeSystemName" de l'élément "value" d'une 
            entrée Problem Entry devraient être présents pour une meilleure lisibilité, mais ne sont pas obligatoires. </assert>
        
        <assert test="not(cda:value[@code]) or cda:value[@displayName]"> 
            Erreur [problemEntry] (Alerte): l'attribut "displaySystemName" de l'élément "value" d'une 
            entrée Problem Entry devrait être présent pour une meilleure lisibilité, mais n'est pas obligatoire.</assert>
    </rule>
</pattern>
