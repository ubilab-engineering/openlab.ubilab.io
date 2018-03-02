<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ pregnancyObservation20130821.sch ]O@%#o>>=-
    
    Teste la conformité de la section " IHE PCC Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    21/08/13 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="pregnancyObservation-errors">
   <title>IHE PCC Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)</title>
   <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&quot;]">
      
    <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]'>
       [pregnancyObservation] Le templateId parent (1.3.6.1.4.1.19376.1.5.3.1.4.13) doit être présent.
    </assert>

      <report test='cda:repeatNumber'>
         [pregnancyObservation] L'élément &lt;repeatNumber&gt; devrait être absent.
      </report>

      <report test='cda:interpretationCode or cda:methodCode or cda:targetSiteCode'>
         [pregnancyObservation] Les éléments &lt;interpretationCode&gt;, 
         &lt;methodCode&gt;, and &lt;targetSiteCode&gt; devraient être absents.
      </report>
    </rule>


  </pattern>
