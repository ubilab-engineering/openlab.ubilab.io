<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ medicationsAdministered.sch ]O@%#o>>=-

Teste la conformité de la section "Medicaments Administrés" (1.3.6.1.4.1.19376.1.5.3.1.3.21)
aux spécifications d'IHE PCC v3.0

Historique :
18/10/2013 : CRI : Création

-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="medicationsAdministered-errors">
    <title>IHE PCC v3.0 Medications Section</title>
    <rule context='*[cda:templateId/@root = "1.3.6.1.4.1.19376.1.5.3.1.3.21"]'>
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> [medicationsAdministered] le templateId de 'Medications' ne
            peut être utilisé que pour une section. </assert>
        <!-- Verify the section type code -->
        <assert test='cda:code[@code = "18610-6"]'> [medicationsAdministered] Le code de la section
            'Medications doit être 18610-6 </assert>
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> [medicationsAdministered] Le
            code de la section doit être un code LOINC system (2.16.840.1.113883.6.1). </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.7"]'>
            <!-- Vérifier que les entrées sont conformes --> [medicationsAdministered] La section
            Medications doit contenir des entrées de type Medications Entry. See
            http://wiki.ihe.net/index.php?title=1.3.6.1.4.1.19376.1.5.3.1.3.19 </assert>
    </rule>
</pattern>
