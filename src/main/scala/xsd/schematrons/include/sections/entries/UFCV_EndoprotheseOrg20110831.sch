<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ UFCV_EndoprotheseOrg.sch ]O@%#o>>=-
    
    Teste la conformité de l'organizer "Dispositif Médical Implanté" (1.2.250.1.213.1.1.3.2)
    aux spécifications du volet 'Patients à riques en cardiologie' du CI-SIS concernant un dispositif 
    d'endoprothèse
    
    
    Historique :
    31/08/11 (CRI): Création
        
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="UFCV_EndoprotheseOrg-errors">
    <title>CI-SIS - Endoprothèse </title>
    
    <rule context='*[(/cda:ClinicalDocument/cda:templateId[@root="1.2.250.1.213.1.1.1.2.1.2"]) 
        and (cda:code/@code="D0001-12")]'>       
        
        <!--=<<o#%@O[ Général ]O@%#o>>=-->
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code ="D0001-12"]'> 
            Erreur de Conformité CI-SIS: Le code de l'organizer 'Endoprothèse' doit être D0001-11
            pris dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2)</assert> 
        
        <assert test='cda:code[@codeSystem = "1.2.250.1.213.1.1.4.2"]'> 
            Erreur de Conformité CI-SIS: L'élément 'codeSystem' de l'organizer 'Endoprothèse'
            doit être codé dans dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2).</assert>
        
        <!-- Verifier que l'organizer contient au moins un élément de type Observation Dispositifs Médicaux -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.1.3.1"]'> 
            Erreur de Conformité CI-SIS : L'organizer 'Endoprothèse' doit au moins contenir une entrée 'Observation Dispositifs Médicaux'</assert> 
        
        <!--=<<o#%@O[ Contenu Organizer ]O@%#o>>=-->
        
        <!-- Date d'implantation -->
        <assert test='cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:code/@code="L0055"'> 
            Erreur de Conformité CI-SIS: La date d'implantation du matériel est un élément obligatoire de l'organizer.</assert>
        
        <!-- Type de matériel implanté -->
        <assert test='cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:code/@code="L0056"'> 
            Erreur de Conformité CI-SIS: Le 'Type de matériel implanté' est un élément obligatoire de l'organizer. 
        </assert>
        
        <!-- Nom de l'implant -->
        <assert test='cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:code/@code="L0039"'> 
            Erreur de Conformité CI-SIS: Le 'Nom de l'mplant' de l'implant est un élément obligatoire de l'organizer.
        </assert>
        
        <!-- Localisation de l'implant -->
        <assert test='cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:code/@code="L0054"'> 
            Erreur de Conformité CI-SIS: La Localisation de l'implant est un élément obligatoire de l'organizer. 
        </assert>
        
        <!-- Modèle de l'implant -->
        <assert test='cda:component/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.1.3.1"]/cda:code/@code="L0051"'> 
            Erreur de Conformité CI-SIS: Le modèle de l'implant est l'un 
            des éléments obligatoires constitutifs de l'organizer'.</assert>        
       

    </rule>
</pattern>


