<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ CSEimmunizationsEnt.sch ]O@%#o>>=-
    
    Teste les entrées relatives aux types de vaccins délivrés du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24 pour la section "Immunizations Section" 
    
    Historique :
    24/06/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEimmunizationsEnt-errors">
    <title>IHE PCC v3.0 Immunization Section</title>
    
    <!-- ****** Contexte = Section Immunizations****** -->
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.12']">
        <assert test='cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[@code = "CSE-055" or 
            @code = "P2-47026" or
            @code = "P2-47020" or
            @code = "P2-47430" or
            @code = "P2-47120" or
            @code = "P2-47044" or
            @code = "P2-47050" or
            @code = "XX-MCH193"]'>
            [CSEimmunizationsEnt] : L'attribut 'code' doit être codé selon les valeurs prévues. 
        </assert>
    </rule>
</pattern>
