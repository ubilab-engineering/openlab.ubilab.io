<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ allergiesAndIntoleranceConcern20130821.sch ]O@%#o>>=-
  
  - Teste la conformité de la section "Allergies and Intolerance Concern" (1.3.6.1.4.1.19376.1.5.3.1.4.5.3)

  
  Historique :
  24/06/11 : CRI : Création
  
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="allergiesAndIntoleranceConcern-errors">
  <title>IHE PCC v3.0 Allergy and Intolerance Concern</title>


    <rule context="*[cda:templateId/@root=&quot;1.3.6.1.4.1.19376.1.5.3.1.4.5.3&quot;]">
    <assert test='cda:templateId[@root = "2.16.840.1.113883.10.20.1.27"] and
	          cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.1"]'>
      [allergiesAndIntoleranceConcern] Les  template ID des parents CCD (2.16.840.1.113883.10.20.1.27) 
      et PCC (1.3.6.1.4.1.19376.1.5.3.1.4.5.1) doivent être présents. 
    </assert>
    <assert test='(cda:entryRelationship[@typeCode="SUBJ" and @inversionInd="false"]//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.6"]) or
      (cda:sourceOf[@typeCode="SUBJ" and @inversionInd="false"]//cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.6"])'>
      [allergiesAndIntoleranceConcern] Cet élément doit contenir un ou plusieurs entrées se conformant au modèle Allergy and Intolerance Entry. 
      Ces éléments sont liés à l'entrée à l'aide de liens &lt;entryRelationship&gt;. L'attribut typeCode est fixé à la valeur 'SUBJ' et l'attribut inversionInd à la valeur 'false'.
    </assert>
    </rule>
</pattern>

