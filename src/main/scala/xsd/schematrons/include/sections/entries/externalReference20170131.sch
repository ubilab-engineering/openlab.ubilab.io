<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ ExternalReference20170131.sch ]O@%#o>>=-
    
    Test la conformité de l'entrée external reference
    aux spécifications d'IHE PCC v3.0
    
    Historique :
   31/01/2017 : LBE Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="externalReference-errors">
   <title>IHE PCC externalReference" (1.3.6.1.4.1.19376.1.5.3.1.4.4)</title>
   <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.4&quot;]">
      
      <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.4"]'>
         [externalReference] : le templateId 1.3.6.1.4.1.19376.1.5.3.1.4.4 doit être présent.
    </assert>

      <assert test='../cda:act'> 
         [externalReference] :  ne peut être utilisé que comme un act
      </assert> 
      <assert test='cda:id'> 
         [externalReference] : l'élément Id doit être présent
      </assert> 
      <assert test='cda:code[@nullFlavor="NA"]'> 
         [externalReference] : l'élément code est à nullFlavor
      </assert>
      <assert test='cda:text'> 
         [externalReference] : l'élément texte doit être présent
      </assert> 
      <assert test='cda:reference[@typeCode="REFR"]'> 
         [externalReference] : l'élément typeCode est fixé à REFR
      </assert> 
      <assert test='cda:reference/cda:externalDocument[@classCode="DOC"]'> 
         [externalReference] : l'attribut de l'externaldocument doit être classCode='DOC'
      </assert> 
      <assert test='cda:reference/cda:externalDocument[@moodCode="EVN"]'> 
         [externalReference] : l'attribut de l'externaldocument doit être moodCode='EVN'
      </assert> 
      

      
    </rule>


  </pattern>
