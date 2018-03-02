<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ CSEimmunizationsEnt.sch ]O@%#o>>=-
    
    Teste les entrées relatives aux types de vaccins délivrés du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Immunizations Section" 
    
    Historique :
    24/06/11 : CRI : Création
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEimmunizationsEnt-errors">
    <title>IHE PCC v3.0 Immunization Section</title>
    
    <!-- ****** Contexte = Section Immunizations****** -->
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']">
        
        <assert test='cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[@code = "C-B6050" or 
            @code = "C-B6010" or
            @code = "MED-207" or
            @code = "C-B6140" or
            @code = "C-B6060" or
            @code = "C-B6050" or
            @code = "C-B60A0" or
            @code = "C-B6150" ]'>
            Erreur de Conformité volet CSE: L'attribut 'code' doit être codé dans la nomenclature SNOMED 3.5 ou TA_ASIP selon les valeurs prévues. 
        </assert>
    </rule>
</pattern>
