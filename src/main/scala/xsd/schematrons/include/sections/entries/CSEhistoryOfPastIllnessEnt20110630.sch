<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEhistoryOfPastIllnessEnt.sch ]O@%#o>>=-
    
    Teste les entrées relatives aux antécédents médicaux du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "History of Past Illness Section"
    
    Historique :
    24/06/11 : CRI : Création
    30/06/11 : CRI : Adaptation aux modifications de structure du volet concernant les entrées Problem Concern de la section
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEhistoryOfPastIllnessEnt-errors">
    <title>IHE PCC v3.0 History of Past Illness Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.8"]'> 
        
        <!-- Pathologie en cours de grossesse CS8 seulement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.1']) or
            .//cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='DF-00006'"> 
            Erreur de Conformité volet CSE: Le test "Pathologie en cours de grossesse" doit être présent 
        </assert>
        
        <!-- Prééclampsie CS8 seulement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.1']) or
            .//cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='D8-110F9'"> 
            Erreur de Conformité volet CSE: Le test "Prééclampsie" doit être présent 
        </assert>
        <!-- HTA traitée CS8 seulement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.1']) or
            .//cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='D8-11120'"> 
            Erreur de Conformité volet CSE: Le test "HTA traitée" doit être présent 
        </assert>
        <!-- Diabète gestationnel CS8 seulement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.1']) or
            .//cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='DB-61400'"> 
            Erreur de Conformité volet CSE: Le test "Diabète gestationnel" doit être présent 
        </assert>
        
        <!-- Prématurité inf. à 33 semaines CS9 et CS24 seulement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3'] or /cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-183')"> 
            Erreur de Conformité volet CSE: Le test "Prématurité inf. à 33 semaines" doit être présent 
        </assert>
        <!-- Otites à répétition CS9 et CS24 seulement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3'] or /cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-211')"> 
            Erreur de Conformité volet CSE: Le test "Otites à répétition" doit être présent 
        </assert>
        <!-- Affections bronchopulmonaires à répétition CS9 et CS24 seulement  -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3'] or /cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-182')"> 
            Erreur de Conformité volet CSE: Le test "Affections bronchopulmonaires à répétition" doit être présent 
        </assert>
        <!-- Affections bronchopulmonaires sifflantes >3 CS24 uniquement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3']) or 
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-184')"> 
            Erreur de Conformité volet CSE: Le test "Affections bronchopulmonaires sifflantes >3" doit être présent 
        </assert>  
        
        <!-- Accidents domestiques depuis le 9ème mois CS24 uniquement  -->
        
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3']) or 
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-185')"> 
            Erreur de Conformité volet CSE: Le test 'Accidents domestiques avant le 9ème mois' doit être présent 
        </assert>       
        <report test='((cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code="MED-185"]/cda:value/@value="true") and
            (cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code="MED-185"]//cda:entryRelationship/@typeCode!="CAUS"))'> 
            Erreur de Conformité volet CSE: La cause de la pathologie s'exprime à partir d'un élément entryRelationship d'attribut typeCode='CAUS'
        </report> 
     
        

        <!-- Nombre/Cause d'hospitalisations depuis le 9ème mois CS24 uniquement -->

        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:entryRelationship/cda:observation/cda:code/@code='ORG-088')"> 
            Erreur de Conformité volet CSE: Le test "Nombre d'hospitalisations depuis le 9ème mois" doit être présent 
        </assert>
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.3']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation/cda:value/@code='ORG-090')"> 
            Erreur de Conformité volet CSE: Le test "causes d'hospitalisations depuis le 9ème mois" doit être présent  
        </assert>
        
        
        <!-- Accident domestique avant le 9ème mois CS9 uniquement  -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or 
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:value/@code='MED-186')"> 
            Erreur de Conformité volet CSE: Le test 'Accidents domestiques avant le 9ème mois' doit être présent 
        </assert>       
        <report test='((cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code="MED-186"]/cda:value/@value="true") and
            (cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code="MED-186"]//cda:entryRelationship/@typeCode!="CAUS"))'> 
            Erreur de Conformité volet CSE: La cause de la pathologie s'exprime à partir d'un élément entryRelationship d'attribut typeCode='CAUS'
        </report> 
        
        <!-- Nombre/Cause d'hospitalisations en période néonatale CS9 uniquement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:entryRelationship/cda:observation/cda:code/@code='ORG-092')"> 
            Erreur de Conformité volet CSE: Le test "Nombre d'hospitalisations en période néonatale" doit être présent 
        </assert>
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation/cda:value/@code='ORG-091')"> 
            Erreur de Conformité volet CSE: Le test "causes d'hospitalisations en période néonatale" doit être présent  
        </assert>
        
        <!-- Nombre/Cause d'hospitalisations après la période néonatale CS9 uniquement -->
        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']/cda:entryRelationship/cda:observation/cda:code/@code='ORG-094')"> 
            Erreur de Conformité volet CSE: Le test "Nombre d'hospitalisations après la période néonatale" doit être présent 
        </assert>

        <assert          
            test="not(/cda:ClinicalDocument/cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']) or
            (cda:entry/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2']/cda:entryRelationship/cda:observation/cda:value/@code='ORG-093')"> 
            Erreur de Conformité volet CSE: Le test "causes d'hospitalisations après la période néonatale" doit être présent  
        </assert>
    </rule> 
</pattern>

