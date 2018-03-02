<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    FRCP_StatutCasPresente20140109.sch :
    Contenu :
    Contrôle du code du niveau diagnostique d'une entrée Problem Entry (nullFlavor interdit)
        Spécialisation du pattern dansJeuDeValeurs
    Paramètres d'appel :
        Néant 
    Historique :
        27/06/11 : CRI ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="FRCP_StatutCasPresente" is-a="dansJeuDeValeurs">
    <p>Conformité du statut du cas présenté à la RCP la RCP</p>
    <param name="path_jdv" value="$jdv_FRCP_StatutCasPresente"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.33']/cda:entry/cda:organizer/cda:component/cda:observation[cda:code/@code='RCP_087']/cda:value"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

