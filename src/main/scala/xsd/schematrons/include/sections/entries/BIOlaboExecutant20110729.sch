<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    BIOlaboExecutant.sch :
    Contenu :
        Contrôle d'un élément performer d'une entry d'un CR d'examens biologiques  
    Paramètres d'appel :
        Néant
    Historique :
        22/07/11 : FMY ASIP/PRAS : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="BIOlaboExecutant">
    <p>Contrôle de l'exécutant d'un examen ou d'une analyse de biologie dans une entry d'un CR d'examens biologiques</p>
    <rule context="*[cda:templateId/@root = $templatePerformer]">
        
        <assert test="self::cda:performer">
            Erreur de conformité CR-BIO :
            Un exécutant dans une entry (avec templateId <value-of select="$templatePerformer"/>)
            doit être un performer. </assert>      
        
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:id and
                    cda:assignedEntity/cda:representedOrganization/cda:name"> 
            Erreur de conformité CR-BIO :
            L'exécutant d'un examen ou d'une analyse de biologie (performer avec templateId 
            <value-of select="$templatePerformer"/>
            doit préciser l'identifiant et le nom du laboratoire exécutant (representedOrganization). </assert>
        
        <assert test="cda:time"> 
            Erreur de conformité CR-BIO :
            L'exécutant d'un examen ou d'une analyse de biologie (performer avec templateId 
            <value-of select="$templatePerformer"/>
            doit dater l'intervalle de sa prestation, à l'aide d'un élément time. </assert>
        
    </rule>
</pattern>
