<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    OBP_MotifDeclenchementTravail20131025.sch :
    Contenu :
    Contrôle du code des causes du déclenchement (Procedures & Interventions subsection)
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="OBP_MotifDeclenchementTravail" is-a="dansJeuDeValeurs">
    <p>Conformité des demandes d'examen complémentaires</p>
    <param name="path_jdv" value="$jdv_OBP_MotifDeclenchementTravail"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/component/section/entry/procedure/entryRelationship/act/code"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:procedure[cda:code/@code='F84610']/cda:entryRelationship/cda:act/cda:code"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

