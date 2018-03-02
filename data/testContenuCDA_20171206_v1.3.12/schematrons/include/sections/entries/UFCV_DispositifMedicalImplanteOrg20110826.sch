<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ UFCV_DispositifMédicalImplanté.sch ]O@%#o>>=-
    
    Teste la conformité de l'organizer "Dispositif Médical Implanté" (1.2.250.1.213.1.1.3.2)
    aux spécifications du volet 'Modèles de Contenu' du CI-SIS

    
    Historique :
    26/08/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="UFCV_DispositifMédicalImplantéOrg-errors">
    <title>CI-SIS - Dispositif Médical Implanté</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.2"]'>
        
<!-- Vérifier le code de l'organizer --> 
        <!--  
        <assert test='cda:code[@code ="L0062" and @codeSystem="1.2.250.1.213.1.1.4.2"]'> 
            Erreur de Conformité CI-SIS: Le code de l'organizer doit avoir pour attributs
            @code='L0062' (Référence appareillage) et @codeSystem='1.2.250.1.213.1.1.4.2' (TA_PRC)</assert> 
        -->
        <!-- Verifier que l'organizer contient au moins un élément de type Observation Dispositifs Médicaux (S+D) -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.1.3.1"]'> 
            Erreur de Conformité PCC: L'organizer doit au moins contenir une entrée 'Observation Dispositifs Médicaux'</assert> 
        
        <!--=<<o#%@O[ Présence des observations obligatoires  ]O@%#o>>=-->
        
        <!-- Date d'implantation -->
        <assert test='(cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:code/@code="L0055")
            and (cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:value/@value)'> 
            Erreur de Conformité CI-SIS: La date d'implantation est un élément obligtoire de l'organizer. 
        </assert>
        <!-- Dispositif implanté -->
        <assert test='cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]
            /cda:code/@code="L0056"'> 
            Erreur de Conformité CI-SIS: 'Dispositif implanté' est un élément obligtoire. 
        </assert>
        
    </rule>
</pattern>


