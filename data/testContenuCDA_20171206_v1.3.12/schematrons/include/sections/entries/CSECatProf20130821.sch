<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSECatProf.sch ]O@%#o>>=-
    
    Teste les entrées des examens physiques relatifs à la définition de la CSP  du volet du CI-SIS Certificats de santé de l'enfant 
    CS9, et CS24" 
    
    Historique :
    27/06/11 : CRI : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSECatProf-errors">
    <title>IHE PCC v3.0 Ears</title>
    
    <!-- ****** Contexte = aNTENATAL TESTING BATTERY ****** -->
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>
        <assert test='.//cda:observation[cda:code/@code="J-00000" and (cda:subject/cda:relatedSubject/cda:code/@code="MTH")] /cda:value[
            @code="1" or 
            @code="2" or 
            @code="3" or
            @code="4" or
            @code="5" or
            @code="6" or
            @nullFlavor]'>
            [CSECatProf] Le codage de la CSP doit faire partie des valeurs prévues dans le jeu de valeurs CSE_Prof
            ou utiliser l'élément nullFlavor.
        </assert>
        <assert test='.//cda:observation[cda:code/@code="J-00000" and (cda:subject/cda:relatedSubject/cda:code/@code="FTH")] /cda:value[
            @code="1" or 
            @code="2" or 
            @code="3" or
            @code="4" or
            @code="5" or
            @code="6" or
            @nullFlavor]'>
            [CSECatProf] Le codage de la CSP doit faire partie des valeurs prévues dans le jeu de valeurs CSE_Prof
            ou utiliser l'élément nullFlavor.
        </assert>
    </rule>
</pattern>
