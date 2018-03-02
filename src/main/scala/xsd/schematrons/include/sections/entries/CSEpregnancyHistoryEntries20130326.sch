<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ CSEpregnancyHistoryEntries.sch ]O@%#o>>=-
    
    Teste les entrées de la section PCC Pregnancy History (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4) utilisée dans le volet du CI-SIS 
    "Certificats de santé de l'enfant du 8ème jour"
    
    Historique :
    25/07/11 : CRI : Création
    
    retirés : 
    @code="D8-110F9" 
    @code="R-F70D9" 
    @code="F-04821" 
    
    22/11/17 : NMA : Mise à jour des codes TA_CS ==> TA_ASIP
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CSEpregnancyHistoryEntries-errors">
    <title>IHE PCC v3.0 Pregnancy History Section</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]'> 
 
        <assert test='cda:code[@code="ORG-076" or            
            @code="11977-6" or
            @code="11640-0" or
            @code="11637-6" or
            @code="MED-159" or
            @code="MED-160" or
            @code="MED-161" or
            @code="11878-6" or
            @code="11884-4" or 
            @code="D8-20432" or
            @code="P2-87524" or
            @code="MED-162" or
            @code="MED-163" or
            @code="MED-164" or
            @code="D8-11210" or
            @code="D8-11120" or
            @code="DB-61400" or
            @code="MED-165" or
            @code="ORG-077" or
            @code="D8-11000" or
            @code="D8-70110" or
            @code="D8-12000" or
            @code="ORG-078" or
            @code="F-87000" or
            @code="MED-166"
            ]'>
            
            [CSEpregnacyHistoryEntries] L'attribut 'code' doit être codé selon les valeurs prévues dans le volet. 
        </assert>

        <assert test='not(cda:code[@code="ORG-076"]) or cda:value[@xsi:type="CD"]'>
            [CSEpregnacyHistoryEntries] l'élément "date de déclaration de grossesse" 
            est une donnée codée (@xsi:type="CD").           
        </assert>
    
        <assert test='not(cda:code[@code="11977-6"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Gestité" s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="11640-0"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Parité" s'exprime en entier (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="11637-6"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Nb d'enfants nés avant 37 semaines" 
            s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="MED-159"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Nb d'enfants pesant moins de 2500g" 
            s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="MED-160"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Nb d'enfants morts-nés" 
            s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="MED-161"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Nb d'enfants morts avant 28 jours" 
            s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="11878-6"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Nb de Foetus" 
            s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="11884-4"]) or cda:value[@unit="wk"]'>
            [CSEpregnacyHistoryEntries] l'élément "L'âge gestationnel" 
            s'exprime en semaines (value[@unit="wk"]).
        </assert>
        <assert test='not(cda:code[@code="D8-20432"]) or cda:value[@xsi:type="BL"]'>
            [CSEpregnacyHistoryEntries] l'élément "Antécédents de Césarienne" 
            est un booléen (@xsi:type="BL").
        </assert>
        <assert test='not(cda:code[@code="P2-87524"]) or cda:value[@xsi:type="BL"]'>
            [CSEpregnacyHistoryEntries] l'élément "Transfert in utero" 
            est un booléen (@xsi:type="BL").
        </assert>
        <assert test='not(cda:code[@code="MED-162"]) or cda:value[@xsi:type="INT"]'>
            [CSEpregnacyHistoryEntries] l'élément "Rang de naissance" 
            s'exprime en entier sans unité (@xsi:type="INT").           
        </assert>
        <assert test='not(cda:code[@code="MED-163"]) or cda:value[@xsi:type="BL"]'>
            [CSEpregnacyHistoryEntries] l'élément "Préparation à la naissance" 
            est un booléen (@xsi:type="BL").
        </assert>
    </rule>
</pattern>