<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ socialHistoryObservationValues20131023.sch ]O@%#o>>=-
   
   Teste la conformité de la section " IHE PCC Social History Observation (valeurs): 1.3.6.1.4.1.19376.1.5.3.1.4.13.4
   aux spécifications d'IHE PCC v3.0
   
   Historique :
   23/10/13 : CRI : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="socialHistoryObservationValues-errors">
   <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]'>

   <assert test='cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"'>
      [socialHistoryObservation] Le templateId du parent (Simple Observation)doit être présent.
   </assert>

       <assert test='cda:code[@code = "XX-MCH177" or
          @code = "XX-MCH181" or
          @code = "OBS_011" or
          @code = "OBS_013" or
          @code = "OBS_012" 
          ]'>
          [socialHistoryObservation] Un élément Social History Observation est codé à partir d'une liste de valeurs spécifique.
       </assert>
       <assert test='not(cda:code[@code="XX-MCH177"]) or
          (cda:code[@code="XX-MCH177"] and
          cda:value[@xsi:type="BL"])'>
          [socialHistoryObservation] Un élément Pregnancy Observation codé XX-MCH177 (TA_CS) utilise un type de données BL.        
       </assert>
       <assert test='not(cda:code[@code="XX-MCH181"]) or
          (cda:code[@code="XX-MCH181"] and
          cda:value[@xsi:type="BL"])'>
          [socialHistoryObservation] Un élément Pregnancy Observation codé XX-MCH181 (TA_CS) utilise un type de données BL.        
       </assert>
       <assert test='not(cda:code[@code="OBS_011"]) or
          (cda:code[@code="OBS_011"] and
          cda:value[@xsi:type="BL"])'>
          [socialHistoryObservation] Un élément Pregnancy Observation codé OBS_011 (TA_OBP) utilise un type de données BL.        
       </assert>
       <assert test='not(cda:code[@code="OBS_012"]) or
          (cda:code[@code="OBS_012"] and
          cda:value[@xsi:type="BL"])'>
          [socialHistoryObservation] Un élément Pregnancy Observation codé OBS_012 (TA_OBP) utilise un type de données BL.        
       </assert>
       <assert test='not(cda:code[@code="OBS_013"]) or
          (cda:code[@code="OBS_013"] and
          cda:value[@xsi:type="BL"])'>
          [socialHistoryObservation] Un élément Pregnancy Observation codé OBS_013 (TA_OBP) utilise un type de données BL.        
       </assert>
    </rule>

  </pattern>


