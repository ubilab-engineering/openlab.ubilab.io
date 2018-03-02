<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    catProf.sch :
    Contenu :
    Contrôle du code du statut de la santé d'un patient pour une entrée Problem Entry (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="HealthStatusCodes" is-a="dansJeuDeValeurs">
    <p>Conformité PCC du statut de santé d'un patient</p>
    <param name="path_jdv" value="$jdv_HealthStatusCodes"/>
    <param name="vue_elt" value="entryRelationship/observation/value"/>
    <param name="xpath_elt" value="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

