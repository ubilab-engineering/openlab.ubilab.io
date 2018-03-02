<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ socialHistoryObservation20130821.sch ]O@%#o>>=-
   
   Teste la conformité de la section " IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4
   aux spécifications d'IHE PCC v3.0
   
   Historique :
   21/08/13 : CRI : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="socialHistoryObservation-errors">
   <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]'>

   <assert test='cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"'>
      [socialHistoryObservation] Le templateId du parent (Simple Observation)doit être présent.
   </assert>

   <assert test='cda:templateId/@root="2.16.840.1.113883.10.20.1.33"'>
      [socialHistoryObservation] Le templateId du parent HL7 CCD Social History doit être présent.
   </assert>
       <!-- 
       <assert test='not(cda:value) or cda:value[@xsi:type = "PQ" or @xsi:type="CD" or @xsi:type="ANY"]'>
      [socialHistoryObservation] (Warning) Le type de données des observationdevraient être PQ, CD ou ANY.
   </assert>
 -->
   <assert test='not(cda:repeatNumber)'>
      [socialHistoryObservation] (Warning) L'élément &lt;repeatNumber&gt; devrait être omis.
   </assert>

   <assert test='not(cda:interpretationCode)'>
      [socialHistoryObservation] (Warning) L'élément &lt;interpretationCode&gt; devrait être omis.
   </assert>

   <assert test='not(cda:methodCode)'>
      [socialHistoryObservation] (Warning) L'élément &lt;methodCode&gt; devrait être omis.
   </assert>

   <assert test='not(cda:targetSiteCode)'>
      [socialHistoryObservation] (Warning) L'élément &lt;targetSiteCode&gt; devrait être omis.
   </assert>

    </rule>

  </pattern>


