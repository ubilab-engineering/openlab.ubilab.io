<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    AVC_NIHSSPfInt20131025.sch :
    Contenu :
    Paramètres d'appel : Néant 
    Historique :
        25/10/2013 : CRI : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="AVC_NIHSSPfInt" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$jdv_AVC_NIHSSPfInt"/>
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/observation/entryRelationship/observation/interpretationCode"/>
    <param name="xpath_elt" value="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation
        [cda:code/@code='70189-6']/cda:interpretationCode"/>
    <param name="nullFlavor" value="0"/>
</pattern>   

<!-- 


	 
	
	
	
70967-5	et 70190-4	AVC_NIHSSMsInt
70968-3	et 70191-2	AVC_NIHSSMiInt
70192-0	AVC_NIHSSAtaxInt
70193-8	AVC_NIHSSSensInt
70194-6	AVC_NIHSSLangInt
70195-3	AVC_NIHSSDysInt
-->