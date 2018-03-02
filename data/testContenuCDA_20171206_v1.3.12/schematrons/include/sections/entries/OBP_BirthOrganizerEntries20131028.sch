<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ OBP_BirthOrganizerEntries.sch ]O@%#o>>=-
    
    Teste la conformité des entrées de la section "Birth Organizer" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    28/10/2013 : CRI : Création OBP_BirthOrganizerEntries20131028.sch
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="OBP_BirthOrganizerEntries-errors">
  
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]'>  
        <!--  Vérification de la présence des entrées obligatoires        -->
        
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='XX-MCH219']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Méthode d'accouchement"
        </assert>

        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='8339-4']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Poids à la naissance"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_004']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Etat de l'enfant"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_005']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Transfert ou mutation"
        </assert>

        
    </rule>
</pattern>