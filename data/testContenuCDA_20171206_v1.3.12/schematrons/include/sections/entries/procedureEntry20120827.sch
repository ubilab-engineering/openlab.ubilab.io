<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ procedureEntry.sch ]O@%#o>>=-
    
    Teste les entrées de la section PCC Procedure Entry (1.3.6.1.4.1.19376.1.5.3.1.4.19)
    
    25/07/11 : CRI : Création
	12/12/16 : LBE : Suprresion de la condition imposant un attribut code à la balise <code></code> alors que la spécification ne le mentionne pas
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="procedureEntry-errors">

        <title>IHE PCC v3.0 Procedure Entry</title>
        <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19"]'>
            
            <assert test='self::cda:procedure[@classCode="PROC"]'>
                [procedureEntry]: L'attribut "classCode" pour un élément "Procedure Entry" sera fixé à la valeur "PROC".</assert>
            
            <assert test='not(./@moodCode="EVN") or
                cda:templateId[@root="2.16.840.1.113883.10.20.1.29"]'>
                [procedureEntry]: Lorsque l'élément "Procedure Entry" est en mode événement (moodCode='EVN'), 
                cette entrée se conforme au template CCD 2.16.840.1.113883.10.20.1.29</assert>
            
            <assert test='not(./@moodCode="INT") or
                cda:templateId[@root="2.16.840.1.113883.10.20.1.25"]'>
                [procedureEntry]: Lorsque l'élément "Procedure Entry" est en mode intention (moodCode='INT'),
                cette entrée se conforme au template CCD 2.16.840.1.113883.10.20.1.25.</assert>
            
            <assert test='cda:id'>
                [procedureEntry]: Un élément "Procedure Entry" comporte un identifiant "id".</assert>
            
            <assert test='cda:code'>
            [procedureEntry]: Un élément "Procedure Entry" comporte un élément "code".</assert>
            <!-- 
            <assert test='cda:code[@codeSystem="1.2.250.1.213.2.5"]'>
                Erreur [procedureEntry]: Un élément "Procedure Entry" est codé à partir de la nomenclature CCAM.</assert>
             
          <assert test='cda:code/cda:originalText/cda:reference[@value]'>
            Erreur [procedureEntry]: Un élément "reference" d'une entrée "Procedure Entry" 
            contiendra une référence à la partie narrative décrivant la procédure
            </assert>
    -->
            
            <assert test='cda:statusCode[@code = "completed" or
                @code = "active" or
                @code = "aborted" or
                @code = "cancelled"]'>
                [procedureEntry]: L'élément "statusCode" sera présent.
                Il prendra la valeur "completed" pour les procédures réalisées, ou "active" pour les procédures 
                toujours en cours. Il prendra la valeur "aborted" por les procédures ayant été stoppées avant la fin 
                et "cancelled" pour celles qui ont été annulées (avant d'avoir débuté).</assert>
            
            <assert test='not(./@moodCode="INT") or 
                (cda:effectiveTime or cda:priorityCode)'>
                [procedureEntry]: dans une entrée "Procedure Entry", l'élément "priorityCode" sera présent en mode "INT" 
                lorsque l'élément "effectiveTime" est omis.
                Il peut cependant exister dans d'autres modes, indiquant le degré de priorité de la procédure.</assert>
    
            <assert test='./@moodCode = "INT" or ./@moodCode = "EVN"'>
                [procedureEntry] (Alerte): L'attribut "moodCode" d'une entrée "Procedure Entry" peut prendre la valeur "INT" 
                pour indiquer une procédure escomptée, ou "EVN" pour indiquer qu'elle a déjà été réalisée.</assert>
            
           <!--  <assert test='cda:code[@code]'>
                [procedureEntry] (Alerte): une entrée "Procedure Entry" devrait comporter un code décrivant le type de la procédure.</assert>
             -->
            <assert test='cda:effectiveTime'>
                [procedureEntry] (Alerte): l'élément "effectiveTime" devrait être présent dans une entrée "Procedure Entry"
                pour horodater la procédure (en mode "EVN") ou la date escomptée pour la procédure (en mode "INT").</assert>
            <!--  
            <assert test='//cda:entryRelationship[@typeCode="RSON"]/cda:act/cda:code[@codeSystem="2.16.840.1.113883.6.3"]'>
                Erreur [procedureEntry] (Alerte): La raison d'une intervention est codée à partir de la classifiation CIM10.</assert>
            -->
            
        </rule>
</pattern>
        
