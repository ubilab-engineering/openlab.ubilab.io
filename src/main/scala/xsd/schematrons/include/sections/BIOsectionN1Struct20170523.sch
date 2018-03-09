<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOsectionN1Struct.sch :
    Contenu :
        Conformité structurelle d'une section de 1er niveau d'un CR d'examens biologiques  
    Paramètres d'appel :
        Néant
    Historique :
    21/07/11 : FMY ASIP/PRAS : Création
    23/05/17 : NMA: Mise à jour du schématron pour accepter la section CR non Structuré
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOsectionN1Struct">
    <p>Conformité structurelle d'une section de 1er niveau d'un CR d'examens biologiques</p>
    <rule context="cda:structuredBody/cda:component/cda:section">
        <assert test="(./cda:templateId[@root=$templateSectN1]) or (./cda:templateId[@root=$templateCRNonStructure])"> 
            Erreur de conformité CR-BIO :
            une section de niveau 1 d'un CR de biologie doit se conformer au template 
            avec @root = "<value-of select="$templateSectN1"/>" ou  @root = "<value-of select="$templateCRNonStructure"/>".</assert>
        <assert test="./cda:code"> Erreur de conformité CR-BIO :
            une section de niveau 1 d'un CR de biologie doit comporter un élément code. </assert>
        <assert test="(./cda:text and count(./cda:entry) = 1 and not(./cda:component)) or
           (not(./cda:text) and not(./cda:entry) and count(./cda:component) &gt; 0)">
            Erreur de conformité CR-BIO : 
            Une section de niveau 1 doit comporter 
            soit un élément text et un seul élément entry soit des sections de niveau 2. </assert>
        <assert test="not(../@nullFlavor)">
            Erreur de conformité CR-BIO : 
            Une section de niveau 1 ne doit pas avoir d'attribut nullFlavor. </assert>
    </rule>
</pattern>
