<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ medications.sch ]O@%#o>>=-

Teste la conformité de la section "Medications" (1.3.6.1.4.1.19376.1.5.3.1.3.19)
aux spécifications d'IHE PCC v3.0

Historique :
24/06/11 : CRI : Création

-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="medications_Section-errors"> 
    <title>IHE PCC v3.0 Medications Section</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.19"]'> 
        <!-- Verifier que le templateId est utilisé pour une section --> 
        <assert test='../cda:section'> 
            Erreur [medications] : le templateId de 'Medications' ne peut être utilisé que pour une section. 
        </assert> 
        <!-- Vérifier que le template parent est présent. --> 
        <assert test='cda:templateId[@root="2.16.840.1.113883.10.20.1.8"]'> 
            Erreur [medications] : le templateId parent de Medications est absent. 
        </assert> 
        <!-- Verify the section type code --> 
        <assert test='cda:code[@code = "10160-0"]'> 
            Erreur [medications] : Le code de la section 'Medications doit être 10160-0 
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur [medications] : Le code de la section doit être un code LOINC  
            system (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7"]'> 
            <!-- Vérifier que les entrées sont conformes -->
            Erreur [medications] : La section Medications doit contenir des entrées de type Medications Entry.
            See http://wiki.ihe.net/index.php?title=1.3.6.1.4.1.19376.1.5.3.1.3.19
        </assert> 
    </rule> 
</pattern>