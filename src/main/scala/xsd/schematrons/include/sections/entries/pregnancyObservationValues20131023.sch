<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ pregnancyObservationValues20131023.sch ]O@%#o>>=-
    
    Teste la conformité de la section " IHE PCC Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    21/08/13 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="pregnancyObservationValues-errors">
   <title>IHE PCC Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)</title>
   <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&quot;]">
      
      <assert test='not(cda:code[@code="11449-6"]) or 
         (cda:code[@code="11449-6"] and
         cda:value[@xsi:type="CE"])'>
         [pregnancyObservationValues]  Un élément Pregnancy Observation codé 11449-6 (LOINC) utilise un type de données CE.
      </assert>
      <assert test='not(cda:code[@code="8678-5"]) or
         (cda:code[@code="8678-5"] and
         cda:value[@xsi:type="CE"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 8678-5 (LOINC) utilise un type de données CE.
      </assert>
      <assert test='not(cda:code[@code="8665-2"]) or
         (cda:code[@code="8665-2"] and
         cda:value[@xsi:type="TS"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 8665-2 (LOINC) utilise un type de données TS.
      </assert>
      <assert test='not(cda:code[@code="11636-8"]) or
         (cda:code[@code="11636-8"] and
         (cda:value[@xsi:type="QTY"] or
         cda:value[@xsi:type="INT"] or
         cda:value[@xsi:type="MO"] or
         cda:value[@xsi:type="TS"] or
         cda:value[@xsi:type="REAL"] or
         cda:value[@xsi:type="PQ"] or
         cda:value[@xsi:type="RTO"]))'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11636-8 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test='not(cda:code[@code="11637-6"]) or
         (cda:code[@code="11637-6"] and
         (cda:value[@xsi:type="QTY"] or
         cda:value[@xsi:type="INT"] or
         cda:value[@xsi:type="MO"] or
         cda:value[@xsi:type="TS"] or
         cda:value[@xsi:type="REAL"] or
         cda:value[@xsi:type="PQ"] or
         cda:value[@xsi:type="RTO"]))'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11637-6 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test='not(cda:code[@code="11638-4"]) or
         (cda:code[@code="11638-4"] and
         (cda:value[@xsi:type="QTY"] or
         cda:value[@xsi:type="INT"] or
         cda:value[@xsi:type="MO"] or
         cda:value[@xsi:type="TS"] or
         cda:value[@xsi:type="REAL"] or
         cda:value[@xsi:type="PQ"] or
         cda:value[@xsi:type="RTO"]))'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11638-4 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test='not(cda:code[@code="11639-2"]) or
         (cda:code[@code="11639-2"] and
         (cda:value[@xsi:type="QTY"] or
         cda:value[@xsi:type="INT"] or
         cda:value[@xsi:type="MO"] or
         cda:value[@xsi:type="TS"] or
         cda:value[@xsi:type="REAL"] or
         cda:value[@xsi:type="PQ"] or
         cda:value[@xsi:type="RTO"]))'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11639-2 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test='not(cda:code[@code="11640-0"]) or
         (cda:code[@code="11640-0"] and
         (cda:value[@xsi:type="QTY"] or
         cda:value[@xsi:type="INT"] or
         cda:value[@xsi:type="MO"] or
         cda:value[@xsi:type="TS"] or
         cda:value[@xsi:type="REAL"] or
         cda:value[@xsi:type="PQ"] or
         cda:value[@xsi:type="RTO"]))'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11640-0 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test='not(cda:code[@code="11778-8"]) or
         (cda:code[@code="11778-8"] and
         cda:value[@xsi:type="TS"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11778-8 (LOINC) utilise un type de données TS.
      </assert>
      <assert test='not(cda:code[@code="11779-6"]) or
         (cda:code[@code="11779-6"] and
         cda:value[@xsi:type="TS"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11779-6 (LOINC) utilise un type de données TS.
      </assert>
      <assert test='not(cda:code[@code="11780-4"]) or
         (cda:code[@code="11780-4"] and
         cda:value[@xsi:type="TS"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11780-4 (LOINC) utilise un type de données TS.
      </assert>
      <assert test='not(cda:code[@code="11884-4"]) or
         (cda:code[@code="11884-4"] and
         cda:value[@xsi:type="PQ"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11780-4 (LOINC) utilise un type de données PQ.
      </assert>
      <assert test='not(cda:code[@code="11885-1"]) or
         (cda:code[@code="11885-1"] and
         cda:value[@xsi:type="PQ"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11884-4 (LOINC) utilise un type de données PQ.
      </assert>
      <assert test='not(cda:code[@code="11886-9"]) or
         (cda:code[@code="11886-9"] and
         cda:value[@xsi:type="PQ"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11886-9 (LOINC) utilise un type de données PQ.
      </assert>
      <assert test='not(cda:code[@code="11887-7"]) or
         (cda:code[@code="11887-7"] and
         cda:value[@xsi:type="PQ"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11887-7 (LOINC) utilise un type de données PQ.        
      </assert>
      <assert test='not(cda:code[@code="11977-6"]) or
         (cda:code[@code="11977-6"] and
         cda:value[@xsi:type="INT"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11977-6 (LOINC) utilise un type de données INT.        
      </assert>
      <assert test='not(cda:code[@code="OBS_041"]) or
         (cda:code[@code="OBS_041"] and
         cda:value[@xsi:type="INT"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_041 (TA_OBP) utilise un type de données INT.        
      </assert>
      <assert test='not(cda:code[@code="OBS_001"]) or
         (cda:code[@code="OBS_001"] and
         cda:value[@xsi:type="CD"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_001 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test='not(cda:code[@code="XX-MCH184"]) or
         (cda:code[@code="XX-MCH184"] and
         cda:value[@xsi:type="CD"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé XX-MCH184 (TA_CS) utilise un type de données CD.        
      </assert>
      <assert test='not(cda:code[@code="OBS_003"]) or
         (cda:code[@code="OBS_003"] and
         cda:value[@xsi:type="CD"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_003 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test='not(cda:code[@code="D8-34000"]) or
         (cda:code[@code="D8-34000"] and
         cda:value[@xsi:type="BL"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé D8-34000 (SNOMED 3.5) utilise un type de données BL.        
      </assert>
      <assert test='not(cda:code[@code="XX-MCH219"]) or
         (cda:code[@code="XX-MCH219"] and
         cda:value[@xsi:type="CD"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé XX-MCH219 (TA_CS) utilise un type de données CD.        
      </assert>
      <assert test='not(cda:code[@code="8339-4"]) or
         (cda:code[@code="8339-4"] and
         cda:value[@xsi:type="PQ"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 8339-4 (TA_CS) utilise un type de données PQ.        
      </assert>
      <assert test='not(cda:code[@code="OBS_004"]) or
         (cda:code[@code="OBS_004"] and
         cda:value[@xsi:type="CD"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_004 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test='not(cda:code[@code="OBS_005"]) or
         (cda:code[@code="OBS_005"] and
         cda:value[@xsi:type="CD"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_005 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test='not(cda:code[@code="3141-9"]) or
         (cda:code[@code="3141-9"] and
         cda:value[@xsi:type="PQ"])'>
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 3141-9 (LOINC) utilise un type de données CD.        
      </assert>
      
      <assert test='cda:code[@code = "11449-6" or
         @code = "8678-5" or
         @code = "8665-2" or
         @code = "11636-8" or
         @code = "11637-6" or
         @code = "11638-4" or
         @code = "11639-2" or
         @code = "11640-0" or
         @code = "11778-8" or
         @code = "11779-6" or
         @code = "11780-4" or
         @code = "11884-4" or
         @code = "11885-1" or
         @code = "11886-9" or
         @code = "11887-7" or
         @code = "11977-6" or
         @code = "OBS_041" or
         @code = "OBS_001" or
         @code = "XX-MCH184" or
         @code = "OBS_003" or
         @code = "D8-34000" or
         @code = "XX-MCH219" or
         @code = "8339-4" or
         @code = "OBS_004" or
         @code = "OBS_005" or
         @code = "OBS_006" or
         @code = "3141-9" 
         ]'>
         [pregnancyObservationValues] Un élément Pregnancy Observation est codé à partir d'une liste de valeurs spécifique.
      </assert>
    </rule>


  </pattern>
