<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ activeProblemSection.sch ]O@%#o>>=-
    
    Teste la conformité de la section " Active Problems Section" (1.3.6.1.4.1.19376.1.5.3.1.3.6)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="activeProblemSection-errors">


    <title>IHE PCC v3.0 Active Problems Section</title>

    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.3.6&quot;]">
        <!-- Verifier que le templateId est utilisé correctement -->
        <assert test="../cda:section"> 
            Erreur de Conformité PCC: 'Active Problems' ne peut être utilisé que comme section.</assert>
        
        <!-- Vérifier la présence des templateId parents. -->
        <assert test="cda:templateId[@root=&quot;2.16.840.1.113883.10.20.1.11&quot;]"> 
            Erreur de Conformité PCC: Le templateId parent de la section 'Active Problems' (2.16.840.1.113883.10.20.1.11) doit être présent</assert>
        
        <!-- Vérifier le code de la section -->
        <assert test="cda:code[@code = &quot;11450-4&quot;]"> 
        Erreur de Conformité PCC: Le code de la section 'Active Problems' doit être '11450-4'</assert>
        
        <assert test="cda:code[@codeSystem = &quot;2.16.840.1.113883.6.1&quot;]"> Error: The section
            Erreur de Conformité PCC: L'élément 'codeSystem' de la section 
            'Active Problems' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
        <!-- Vérifier que la section contient des éléments Problem Concern Entry -->
        <assert test=".//cda:templateId[@root = &quot;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&quot;]">
            Erreur de Conformité PCC: Une section "Active Problems" doit contenir des entrée de type "Problem Concern Entry"</assert>
    </rule>
</pattern>
