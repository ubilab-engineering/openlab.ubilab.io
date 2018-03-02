<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  1.2.250.1.213.1.1.1.13 -->

<!--                  -=<<o#%@O[ FRCP.sch ]O@%#o>>=-
    
    Teste la conformité du document FRCP (1.2.250.1.213.1.1.1.13)
    aux spécifications du volet FRCP du CI-SIS de l'ASIP Santé sur le contenu du document") .    
   Pas d'entrée.

    
    Historique :
    20/07/12 : CRI : Création
    14/01/2013 : CRI Ajout Section "Statut du document"
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP-errors">
    <title>CI-SIS Volet de Synthèse Médicale (VSM) </title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.1.8"]'>

        <!-- Vérifier que toutes les sections du document sont présentes -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.2"]'>
            Erreur [FRCP]: La section "Motif de la RCP" doit être présente dans le document.           
        </assert> 
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.7.3.1.3.14.1"]'>
            Erreur [FRCP]: La section "Diagnostic du cancer" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.8"]'>
            Erreur [FRCP]: La section "Antécédents Médicaux" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.6"]'>
            Erreur [FRCP]: La section "Comorbidités" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.12.2.1"]'>
            Erreur [FRCP]: La section "Evaluation du statut fonctionnel" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.25"]'>
            Erreur [FRCP]: La section "Cas présenté à la RCP" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.28"]'>
            Erreur [FRCP]: La section "Résultats d'examens" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.34"]'>
            Erreur [FRCP]: La section "Importation-Conclusion CR" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.26"]'>
            Erreur [FRCP]: La section "Importation-Conclusion CRO" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>
            Erreur [FRCP]: La section "Procédures et Interventions" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.4"]'>
            Erreur [FRCP]: La section "Synthèse du cas présenté" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.31"]'>
            Erreur [FRCP]: La section "Plan de soins" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.33"]'>
            Erreur [FRCP]: La section "Statut de la FRCP" doit être présente dans le document.           
        </assert>
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.35"]'>
            Erreur [FRCP]: La section "Statut du document" doit être présente dans le document.           
        </assert>
        
    </rule>
</pattern>