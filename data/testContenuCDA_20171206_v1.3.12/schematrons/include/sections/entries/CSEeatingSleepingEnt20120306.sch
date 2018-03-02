<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEeatingSleepingEnt.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs aux fonctions d'alimentation et du sommeil du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Child Functional Status Assessment Section/Eating and Sleeping Assessment" 
    
    Historique :
    24/06/11 : CRI : Création
    25/07/11 : CRI : Prise en compte des trois volets CS8, CS9, CS24
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEeatingSleepingEnt-errors">
    <title>IHE PCC v3.0 Eating and Sleeping Assessment Section</title>
    
    <!-- ****** Contexte = Sous-section Eating and Sleeping Assessment ****** -->
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.5"]'>
        
        <!-- Troubles du sommeil -->
        <assert test='.//cda:entry/cda:observation/cda:code/@code="D9-74000"'>
            Erreur de Conformité volet CSE: La mention de l'élément "Troubles du sommeil" est obligatoire
        </assert>
        <assert test='.//cda:entry/cda:observation[cda:code/@code="D9-74000"]/cda:value/@value'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être reporté (pas de Nullflavor) 
        </assert>
        
        <!-- Troubles de l'alimentation -->
        <assert test='.//cda:entry/cda:observation/cda:code/@code="D9-13000"'>
            Erreur de Conformité volet CSE: La mention de l'élément "Troubles de l'alimentation" est obligatoire
        </assert>
        <assert test='.//cda:entry/cda:observation[cda:code/@code="D9-13000"]/cda:value/@value'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être reporté (pas de Nullflavor) 
        </assert>
        
        <!-- Allergie alimentaire CS24 exclusif -->
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"]) or (.//cda:entry/cda:observation/cda:code/@code="D5-00300")'>
            Erreur de Conformité volet CSE: La mention de l'élément "Allergie alimentaire" est obligatoire
        </assert>
        
        <assert test='not(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.5.3"]) or (.//cda:entry/cda:observation[cda:code/@code="D5-00300"]/cda:value/@value)'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être reporté (pas de Nullflavor) 
        </assert>
        
        <!--  Allaitement au sein -->
        <assert test='.//cda:entry/cda:observation/cda:code/@code="F-8A040"'>
            Erreur de Conformité volet CSE: La mention de l'élément "Allaitement au sein" est obligatoire
        </assert>
        <assert test='.//cda:entry/cda:observation[cda:code/@code="F-8A040"]/cda:value/@value'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être reporté (pas de Nullflavor) 
        </assert>
        
        <!--  Durée de l'allaitement au sein -->
        <assert test='.//cda:entry/cda:observation/cda:code/@code="MED-203"'>
            Erreur de Conformité volet CSE: La mention de l'élément "Durée de l'allaitement au sein" est obligatoire
        </assert>
        <assert test='.//cda:entry/cda:observation[cda:code/@code="MED-203"]/cda:value/@value'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être reporté (pas de Nullflavor) 
        </assert>        
        
        <!--  Durée de l'alimentation exclusive au sein -->
        <assert test='.//cda:entry/cda:observation/cda:code/@code="MED-204"'>
            Erreur de Conformité volet CSE: La mention de l'élément "Durée de l'alimentation exclusive au sein" est obligatoire
        </assert>
        <assert test='.//cda:entry/cda:observation[cda:code/@code="MED-204"]/cda:value/@value'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être reporté (pas de Nullflavor) 
        </assert>  
        <assert test='.//cda:entry/cda:observation[cda:code/@code="MED-204"]/cda:value/@xsi:type="PQ"'>
            Erreur de Conformité volet CSE: Le résultat de l'observation doit être de type 'PQ' 
        </assert>

    </rule>
</pattern>
