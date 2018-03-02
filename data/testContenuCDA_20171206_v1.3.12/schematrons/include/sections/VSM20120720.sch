<?xml version="1.0" encoding="UTF-8"?>

<!--  ASIP Santé  1.2.250.1.213.1.1.1.13 -->

<!--                  -=<<o#%@O[ VSM.sch ]O@%#o>>=-
    
    Teste la conformité du document VSM (1.2.250.1.213.1.1.1.13)
    aux spécifications du volet VSM du CI-SIS de l'ASIP Santé sur le contenu du document") .    
   Pas d'entrée.

    
    Historique :
    20/07/12 : CRI : Création
    24/03/17 : LBE : Suppression du test de présence de la section medication car elle n'est pas obligatoire 
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="VSM-errors">
    <title>CI-SIS Volet de Synthèse Médicale (VSM) </title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.1.13"]'>
        <!-- Vérifier que le template est à la bonne place -->
        <assert test='../cda:ClinicalDocument'>
            Erreur [VSM]: le Template VSM n'est utilisable que dans Clinical Documents.
        </assert>
        <!-- Vérifier que toutes les sections du document sont présentes -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.29"]'>
            Erreur [VSM]: La section Section Pathologie en cours, antécédents, allergies et facteurs de risque doit être présente dans le document.           
        </assert> 
        <!--<assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.19"]'>
            Erreur [VSM]: La section Médications doit être présente dans le document.           
        </assert> -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.27"]'>
            Erreur [VSM]: La section Points de Vigilance doit être présente dans le document.           
        </assert>
    </rule>
</pattern>