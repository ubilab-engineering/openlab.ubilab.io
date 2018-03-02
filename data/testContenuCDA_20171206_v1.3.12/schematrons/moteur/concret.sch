<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" defaultPhase="SAP-20131017" queryBinding="xslt2" schemaVersion="CI-SIS_OBP_SAP.sch">
    <title>Conformité d'un document CDAr2 au volet OBP - Synthèse Antepartum (SAP) du CI-SIS</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
              
    
    <!--Suppressed abstract pattern dansJeuDeValeurs was here-->
    <!--Suppressed abstract pattern IVL_TS was here-->   
    <!--Suppressed abstract pattern personName was here-->
    
                   
    
    <pattern id="addr">
    <rule context="cda:addr">
        <let name="nba" value="count(@*)"/>
        <let name="nbch" value="count(*)"/>
        <let name="val" value="@*"/>
        <assert test="(             ($nba = 0 and $nbch &gt; 0) or             ($nba and name(@*) = 'use' and $nbch &gt; 0) or              ($nba = 1 and name(@*) = 'nullFlavor' and $nbch = 0 and             ($val = 'UNK' or $val = 'NASK' or $val = 'ASKU' or $val = 'NAV' or $val = 'MSK'))              )">
            Erreur de conformité CI-SIS : <name/> ne contient pas un attribut autorisé pour une adresse, 
            ou est vide et sans nullFlavor, ou contient une valeur de nullFlavor non admise.
        </assert>
        <assert test="$nbch = 0 or                         (cda:streetAddressLine and not(cda:postalCode) and not(cda:city) and not(cda:country) and not(cda:state)                         and not(cda:houseNumber) and not(cda:streetName)and not(cda:additionalLocator) and not(cda:unitID)                         and not(cda:postBox) and not(cda:precinct)) or                         (not(cda:streetAddressLine))                         ">
            Erreur de conformité CI-SIS : <name/> doit être structuré : 
            - soit sous la formes de lignes d'adresse (streetAddressLine)
            - soit sous la forme de composants élémentaires d'adresse
        </assert>
    </rule>
</pattern>    
    <pattern id="administrativeGenderCode">
    <p>Conformité du code sexe du patient ou du subject, nullFlavor autorisé</p>
    <rule context="cda:administrativeGenderCode">
        <let name="NF" value="@nullFlavor"/>
        <let name="sex" value="@code"/>
        <assert test="$sex = 'M' or $sex = 'F' or $sex = 'U' or $NF = 'UNK' or $NF = 'NASK' or $NF = 'ASKU' or $NF = 'NAV' or $NF = 'MSK'">
            Erreur de conformité CI-SIS : l'élément administrativeGenderCode doit être présent, avec code sexe ou un nullFlavor autorisé 
            (valeur trouvée <value-of select="@*"/>).
        </assert>
    </rule>
</pattern>
    <pattern id="assignedEntity">
    <rule context="cda:assignedEntity">
        <assert test="./cda:id"> Erreur de conformité CI-SIS : L'élément "id" doit être présent sous
            assignedEntity. </assert>
        <assert test="cda:assignedPerson"> Erreur de conformité CI-SIS : L'élément
            "assignedPerson" doit être présent sous assignedEntity (nullFlavor autorisé). 
        </assert>
        <assert test="cda:assignedPerson/cda:name or cda:assignedPerson/@nullFlavor"> 
            Erreur de conformité CI-SIS : 
            Si l'élément assignedPerson n'est pas vide avec un nullFlavor, alors il 
            doit comporter un élément fils "name" (nullFlavor autorisé). 
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract personName--><pattern id="authenticatorName">
    <rule context="cda:authenticator/cda:assignedEntity/cda:assignedPerson/cda:name">
        <assert test="(                         (name(@*) = 'nullFlavor' and 1 and                            (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or                         ((./cda:family) and                        ((./cda:family[@qualifier='BR' or @qualifier='SP' or @qualifier='CL']) or not(./cda:family[@qualifier])))                     )">
            Erreur de conformité CI-SIS : L'élément <value-of select="'authenticator/assignedEntity/assignedPerson/name'"/>/family doit être présent 
            avec un attribut qualifier valorisé dans : BR (nom de famille), SP (nom d'usage) ou CL (pseudonyme)
            ou sans attribut qualifier. Valeur trouvée pour family : <value-of select="./cda:family"/>. Valeur trouvée pour family@qualifier : <value-of select="./cda:family/@qualifier"/>
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract personName--><pattern id="authorPersonName">
    <rule context="cda:assignedAuthor/cda:assignedPerson/cda:name">
        <assert test="(                         (name(@*) = 'nullFlavor' and 1 and                            (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or                         ((./cda:family) and                        ((./cda:family[@qualifier='BR' or @qualifier='SP' or @qualifier='CL']) or not(./cda:family[@qualifier])))                     )">
            Erreur de conformité CI-SIS : L'élément <value-of select="'assignedAuthor/assignedPerson/name'"/>/family doit être présent 
            avec un attribut qualifier valorisé dans : BR (nom de famille), SP (nom d'usage) ou CL (pseudonyme)
            ou sans attribut qualifier. Valeur trouvée pour family : <value-of select="./cda:family"/>. Valeur trouvée pour family@qualifier : <value-of select="./cda:family/@qualifier"/>
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="authorSpecialty">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/author/assignedAuthor/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/author/assignedAuthor/code'"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_authorSpecialty)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'ClinicalDocument/author/assignedAuthor/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_authorSpecialty"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract IVL_TS--><pattern id="authorTime">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:author/cda:time">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'author/time'"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            Erreur de conformité CI-SIS : <value-of select="'author/time'"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and 1 and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            Erreur de conformité CI-SIS : <value-of select="'author/time'"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
    </rule> 

    <rule context="cda:author/cda:time/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'author/time'"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="cda:author/cda:time/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'author/time'"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="documentCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:ClinicalDocument/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'ClinicalDocument/code'"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_typeCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'ClinicalDocument/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_typeCode"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract IVL_TS--><pattern id="documentEffectiveTime">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:ClinicalDocument/cda:effectiveTime">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and 0 and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
    </rule> 

    <rule context="cda:ClinicalDocument/cda:effectiveTime/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:effectiveTime/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/effectiveTime'"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="healthcareFacilityTypeCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_healthcareFacilityTypeCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'componentOf/encompassingEncounter/location/healtCareFacility/code'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_healthcareFacilityTypeCode"/>.
        </assert>
    </rule>
</pattern> 
    <!--Start pattern based on abstract personName--><pattern id="informantAssignedPersonName">
    <rule context="cda:informant/cda:assignedEntity/cda:assignedPerson/cda:name">
        <assert test="(                         (name(@*) = 'nullFlavor' and 1 and                            (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or                         ((./cda:family) and                        ((./cda:family[@qualifier='BR' or @qualifier='SP' or @qualifier='CL']) or not(./cda:family[@qualifier])))                     )">
            Erreur de conformité CI-SIS : L'élément <value-of select="'informant/assignedEntity/assignedPerson/name'"/>/family doit être présent 
            avec un attribut qualifier valorisé dans : BR (nom de famille), SP (nom d'usage) ou CL (pseudonyme)
            ou sans attribut qualifier. Valeur trouvée pour family : <value-of select="./cda:family"/>. Valeur trouvée pour family@qualifier : <value-of select="./cda:family/@qualifier"/>
        </assert>
    </rule>
</pattern>
    <pattern id="informantRelatedEntity">
    <rule context="cda:informant/cda:relatedEntity">
        <assert test="((name(@*) = 'classCode') and                          (@* = 'ECON' or @* = 'GUARD' or @* = 'POLHOLD' or @* = 'CON' or @* = 'QUAL')                     )">
            Erreur de conformité CI-SIS : L'élément informant/relatedEntity doit avoir un attribut classCode dont la valeur est dans l'ensemble :
            (ECON, GUARD, POLHOLD, CON, QUAL).
        </assert>
        <assert test="./cda:addr">
            Erreur de conformité CI-SIS : L'élément informant/relatedEntity doit comporter une adresse géographique (nullFlavor autorisé)
        </assert>
        <assert test="./cda:telecom">
            Erreur de conformité CI-SIS : L'élément informant/relatedEntity doit comporter une adresse telecom (nullFlavor autorisé)
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract personName--><pattern id="legalAuthenticatorName">
    <rule context="cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/cda:name">
        <assert test="(                         (name(@*) = 'nullFlavor' and 0 and                            (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or                         ((./cda:family) and                        ((./cda:family[@qualifier='BR' or @qualifier='SP' or @qualifier='CL']) or not(./cda:family[@qualifier])))                     )">
            Erreur de conformité CI-SIS : L'élément <value-of select="'legalAuthenticator/assignedEntity/assignedPerson/name'"/>/family doit être présent 
            avec un attribut qualifier valorisé dans : BR (nom de famille), SP (nom d'usage) ou CL (pseudonyme)
            ou sans attribut qualifier. Valeur trouvée pour family : <value-of select="./cda:family"/>. Valeur trouvée pour family@qualifier : <value-of select="./cda:family/@qualifier"/>
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract IVL_TS--><pattern id="legalAuthenticatorTime">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:legalAuthenticator/cda:time">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'legalAuthenticator/time'"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            Erreur de conformité CI-SIS : <value-of select="'legalAuthenticator/time'"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and 1 and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            Erreur de conformité CI-SIS : <value-of select="'legalAuthenticator/time'"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
    </rule> 

    <rule context="cda:legalAuthenticator/cda:time/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'legalAuthenticator/time'"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="cda:legalAuthenticator/cda:time/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'legalAuthenticator/time'"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern>
    <pattern id="modeleCommunEnTete">
    <p>Conformité de base de l'en-tête CDA au CI-SIS</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root=$enteteHL7France]"> 
            Erreur de conformité HL7 France :
            L'élément ClinicalDocument/templateId doit être présent 
            avec @root = "<value-of select="$enteteHL7France"/>". 
        </assert>
        <assert test="cda:templateId[@root=$commonTemplate]"> 
            Erreur de conformité CI-SIS :
            L'élément ClinicalDocument/templateId doit être présent avec @root = "<value-of select="$commonTemplate"/>". 
        </assert>
        <assert test="cda:title and normalize-space(cda:title) and not(cda:title[@nullFlavor])">
            Erreur de conformité CI-SIS : 
            L'élément "title" doit être présent dans l'en-tête, 
            sans nullFlavor et doit contenir un titre non vide. 
        </assert>
        <assert test="cda:effectiveTime and not(cda:effectiveTime[@nullFlavor])"> 
            Erreur de conformité CI-SIS : 
            L'élément "effectiveTime" doit être présent dans l'en-tête, sans nullFlavor. 
        </assert>
        <assert test="cda:realmCode[@code='FR']"> 
            Erreur de conformité CI-SIS : 
            L'élément "realmCode" doit être présent et valorisé à "FR". 
        </assert>
        <assert test="not(cda:confidentialityCode[@nullFlavor])"> 
            Erreur de conformité CI-SIS :
            L'élément "confidentialityCode" (obligatoire dans CDAr2) doit être sans nullFlavor. 
        </assert>
        <assert test="cda:languageCode[@code='fr-FR']"> 
            Erreur de conformité CI-SIS : 
            L'élément "languageCode" doit être présent dans l'en-tête, valorisé à "fr-FR". 
        </assert>
        <assert test="not(cda:id[@nullFlavor])"> 
            Erreur de conformité CI-SIS : 
            L'élément "id", identifiant unique du document (obligatoire dans CDAr2) doit être sans nullFlavor. 
        </assert>
        <assert test="cda:legalAuthenticator and not(./cda:legalAuthenticator[@nullFlavor])">
            Erreur de conformité CI-SIS : 
            L'élément "legalAuthenticator" doit être présent dans l'en-tête, sans nullFlavor. 
        </assert>
        <assert test="not(cda:author[@nullFlavor]) and not(./cda:author/cda:assignedAuthor[@nullFlavor])"> 
            Erreur de conformité CI-SIS : 
            Les éléments "author" et "author/assignedAuthor" doivent être sans nullFlavor dans l'en-tête. 
        </assert>
        <assert test="not(cda:custodian[@nullFlavor]) and not(./cda:custodian/cda:assignedCustodian[@nullFlavor])"> 
            Erreur de conformité CI-SIS : 
            Les éléments "custodian" et "custodian/assignedCustodian" doivent être sans nullFlavor dans l'en-tête. 
       </assert>
        <assert test="(cda:documentationOf) and not(cda:documentationOf[@nullFlavor]) and                     not(cda:documentationOf/cda:serviceEvent[@nullFlavor])"> 
            Erreur de conformité CI-SIS : 
            L'en-tête doit comporter au moins un élément documentationOf
            et l'attribut nullFlavor n'est pas autorisé ni sur documentationOf ni sur son fils serviceEvent. 
        </assert>
        <assert test="cda:componentOf">
            Erreur de conformité CI-SIS : 
            Le document doit comporter dans son en-tête un componentOf/encompassingEncounter.
        </assert>
        <assert test="cda:componentOf/cda:encompassingEncounter/cda:effectiveTime/@nullFlavor or                     cda:componentOf/cda:encompassingEncounter/cda:effectiveTime/cda:low/@value or                     cda:componentOf/cda:encompassingEncounter/cda:effectiveTime/cda:high/@value             ">
            Erreur de conformité CI-SIS : 
            L'élément componentOf/encompassingEncounter/effectiveTime doit comporter 
            soit un attribut nullFlavor soit l'un des éléments fils "low/@value" et "high/@value" 
            soit les deux.
        </assert>
        <assert test="cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:code">
            Erreur de conformité CI-SIS : 
            Le document doit comporter dans son en-tête un componentOf/encompassingEncounter/location/healthCareFacility/code.
        </assert>
    </rule>
</pattern>
    <pattern id="nonXMLBody">
    <p>Conformité d'un document CDA avec nonXMLBody au profil IHE XDS-SD et vérification des formats et encodage autorisés</p>
    <rule context="cda:nonXMLBody">
        <assert test="../../cda:templateId[@root=$XDS-SD]">
            Erreur de conformité XDS-SD : Un document avec un 
            corps non xml doit comporter l'élément ClinicalDocument/templateId avec @root = 
            "<value-of select="$XDS-SD"/>".
        </assert>
        <assert test="./cda:text[@representation=&#34;B64&#34;]">
            Erreur de conformité CDAr2 : Un document avec un corps non xml
            doit encapsuler en format base64 son contenu dans l'élément text, avec @representation = "B64"
        </assert>
        <assert test="./cda:text[@mediaType='application/pdf' or              @mediaType='image/jpeg' or              @mediaType='image/tiff' or              @mediaType='text/plain' or              @mediaType='text/rtf']">
            Erreur de conformité CI-SIS : Un document avec un corps non xml
            doit encapsuler en format base64 son contenu dans l'élément text, avec @mediaType devant prendre 
            l'une de ces valeurs : {"text/plain", "application/pdf", "image/jpeg", "image/tiff", "text/rtf"}.
        </assert>
    </rule>
</pattern>
    <pattern id="patient">
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole">
        <assert test="not(cda:id[@nullFlavor])">
            Erreur de conformité CI-SIS : L'élément recordTarget/patientRole/id (obligatoire dans CDAr2), 
            doit être sans nullFlavor.
        </assert>
        <assert test="cda:id[@root=$OIDINS-c]">
            Erreur de conformité CI-SIS : l'élément recordTarget/patientRole 
            doit comporter au moins un élément id contenant un INS-c du patient
        </assert>
        <assert test="cda:patient/cda:birthTime">
            Erreur de conformité CI-SIS : l'élément recordTarget/patientRole/patient/birthTime doit être présent 
            avec une date de naissance ou un nullFlavor autorisé.
        </assert>
        <assert test="cda:addr">
            Erreur de conformité CI-SIS : l'élément recordTarget/patientRole/addr doit être présent 
            avec une adresse géographique ou un nullFlavor autorisé.
        </assert>
        <assert test="cda:telecom">
            Erreur de conformité CI-SIS : l'élément recordTarget/patientRole/telecom doit être présent 
            avec une adresse de télécommunication ou un nullFlavor autorisé.
        </assert>
        <assert test="cda:patient/cda:administrativeGenderCode">
            Erreur de conformité CI-SIS : l'élément recordTarget/patientRole/patient/administrativeGenderCode 
            doit être présent avec le code sexe ou un nullFlavor autorisé.
        </assert>
        <assert test="                     not(cda:patient/cda:religiousAffiliationCode) and                     not(cda:patient/cda:raceCode) and                     not(cda:patient/cda:ethnicGroupCode)                      ">
            Erreur de conformité CI-SIS : Un élément recordTarget/patientRole/patient 
            ne doit contenir ni race ni religion ni groupe ethnique.
        </assert>
        <assert test="cda:patient/cda:name/cda:given">
            Erreur de conformité CI-SIS : l'élément recordTarget/patientRole/patient/name/given doit être présent avec le prénom du patient ou un nullFlavor.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract IVL_TS--><pattern id="patientBirthTime">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:patient/cda:birthTime">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'patient/birthTime'"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            Erreur de conformité CI-SIS : <value-of select="'patient/birthTime'"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and 1 and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            Erreur de conformité CI-SIS : <value-of select="'patient/birthTime'"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
    </rule> 

    <rule context="cda:patient/cda:birthTime/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'patient/birthTime'"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="cda:patient/cda:birthTime/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'patient/birthTime'"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern>
    <pattern id="patientId">
    <p>
        Vérification de la conformité au CI-SIS :
        l'INS-C doit être une chaîne de 22 chiffres 
    </p>
    <rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:id">
        <assert test="             (@root = $OIDINS-c and string-length(@extension) = 22 and number(@extension) &gt; 1)               or (@root != $OIDINS-c)">
            Erreur de conformité CI-SIS : L'INS-c doit contenir une chaine de 22 chiffres 
            (valeur trouvée dans le document : <value-of select="@extension"/>,
             OID trouvé : <value-of select="@root"/>)
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract personName--><pattern id="patientName">
    <rule context="cda:patient/cda:name">
        <assert test="(                         (name(@*) = 'nullFlavor' and 0 and                            (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or                         ((./cda:family) and                        ((./cda:family[@qualifier='BR' or @qualifier='SP' or @qualifier='CL']) or not(./cda:family[@qualifier])))                     )">
            Erreur de conformité CI-SIS : L'élément <value-of select="'patient/name'"/>/family doit être présent 
            avec un attribut qualifier valorisé dans : BR (nom de famille), SP (nom d'usage) ou CL (pseudonyme)
            ou sans attribut qualifier. Valeur trouvée pour family : <value-of select="./cda:family"/>. Valeur trouvée pour family@qualifier : <value-of select="./cda:family/@qualifier"/>
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="practiceSettingCode">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="'serviceEvent/performer/assignedEntity/representedOrganization/standardIndustryClassCode'"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="'serviceEvent/performer/assignedEntity/representedOrganization/standardIndustryClassCode'"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_practiceSettingCode)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="'serviceEvent/performer/assignedEntity/representedOrganization/standardIndustryClassCode'"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_practiceSettingCode"/>.
        </assert>
    </rule>
</pattern>
    <pattern id="relatedDocument">
    <p>
        Si l'élément relatedDocument est présent alors son attribut typeCode doit valoir RPLC 
    </p>
    <rule context="cda:relatedDocument">      
        <assert test="(count(@*) = 1 and name(@*) = 'typeCode' and @* = 'RPLC')">
            Erreur de conformité CI-SIS : ClinicalDocument/relatedDocument ne contient pas l'attribut typeCode avec la seule valeur autorisée : RPLC.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract personName--><pattern id="relatedPersonName">
    <rule context="cda:relatedPerson/cda:name">
        <assert test="(                         (name(@*) = 'nullFlavor' and 1 and                            (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or                         ((./cda:family) and                        ((./cda:family[@qualifier='BR' or @qualifier='SP' or @qualifier='CL']) or not(./cda:family[@qualifier])))                     )">
            Erreur de conformité CI-SIS : L'élément <value-of select="'relatedPerson/name'"/>/family doit être présent 
            avec un attribut qualifier valorisé dans : BR (nom de famille), SP (nom d'usage) ou CL (pseudonyme)
            ou sans attribut qualifier. Valeur trouvée pour family : <value-of select="./cda:family"/>. Valeur trouvée pour family@qualifier : <value-of select="./cda:family/@qualifier"/>
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract IVL_TS--><pattern id="serviceEventEffectiveTime">
    <p>
        Vérification de la conformité au CI-SIS d'un élément de type IVL_TS ou TS du standard CDAr2 :
        L'élément doit porter soit un attribut "value" soit un intervalle éventuellement semi-borné de sous-éléments "low", "high". 
        Alternativement, si l'attribut nullFlavor est autorisé, il doit porter l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/documentationOf/serviceEvent/effectiveTime'"/>/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
        <assert test="(@* and not(*)) or (not(@*) and *)">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/documentationOf/serviceEvent/effectiveTime'"/> doit contenir soit un attribut soit des éléments fils.
        </assert>
        <assert test="(             (name(@*) = 'nullFlavor' and 1 and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             (name(@*) != 'nullFlavor')              )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/documentationOf/serviceEvent/effectiveTime'"/> contient un 'nullFlavor' non autorisé ou porteur d'une valeur non admise.
        </assert>  
    </rule> 

    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:effectiveTime/cda:low">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/documentationOf/serviceEvent/effectiveTime'"/>/low/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:effectiveTime/cda:high">
        <let name="L" value="string-length(@value)"/>
        <let name="mm" value="number(substring(@value,5,2))"/>
        <let name="dd" value="number(substring(@value,7,2))"/>            
        <let name="hh" value="number(substring(@value,9,2))"/>
        <let name="lzp" value="string-length(substring-after(@value,'+'))"/> 
        <let name="lzm" value="string-length(substring-after(@value,'-'))"/>
        <let name="lDH1" value="string-length(substring-before(@value,'+'))"/>
        <let name="lDH2" value="string-length(substring-before(@value,'-'))"/>
        <assert test="(             ($L = 0) or             ($L = 4) or              ($L = 6 and $mm &lt;= 12) or              ($L = 8 and $mm &lt;= 12 and $dd &lt;= 31) or              ($L &gt; 14 and $mm &lt;= 12 and $dd &lt;= 31 and $hh &lt; 24 and ($lzp = 4 or $lzm = 4) and $lDH1 &lt;= 14 and $lDH2 &lt;= 14)             )">
            Erreur de conformité CI-SIS : <value-of select="'ClinicalDocument/documentationOf/serviceEvent/effectiveTime'"/>/high/@value = "<value-of select="@value"/>"  contient  
            une date et heure invalide, différente de aaaa ou aaaamm ou aaaammjj ou aaaammjjhh[mm[ss]][+/-]zzzz 
            en temps local du producteur.
        </assert>
     </rule>       

</pattern>
    <pattern id="serviceEventPerformer">
    <p>
        Vérification de la présence et de la conformité de l'acte principal documenté 
    </p>
    <rule context="cda:ClinicalDocument">
        
        <assert test="count(cda:documentationOf/cda:serviceEvent/cda:performer) = 1">
            Erreur de conformité CI-SIS : l'en-tête CDA doit comporter un et un seul documentationOf/serviceEvent 
            avec un élément fils performer. </assert>
        
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer">
        
        <assert test="not(@nullFlavor)">
            Erreur de conformité CI-SIS : L'élément documentationOf/serviceEvent/performer doit être renseigné sans nullFlavor. </assert>
        
        <assert test="../cda:effectiveTime/cda:low and                        not(../cda:effectiveTime[@nullFlavor]) and                       not(../cda:effectiveTime/cda:low[@nullFlavor])">
            Erreur de conformité CI-SIS : L'élément documentationOf/serviceEvent portant l'acte principal documenté
            doit comporter à la fois un fils performer et un petit-fils effectiveTime/low sans attribut nullFlavor. </assert>
        
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode">
            Erreur de conformité CI-SIS : L'élément documentationOf/serviceEvent/performer correspondant à l'acte principal documenté, 
            doit comporter un descendant assignedEntity/representedOrganization/standardIndustryClassCode. </assert>
        
    </rule>
</pattern>
    <pattern id="telecom">
    <p>
        Vérification de la conformité au CI-SIS d'un élément telecom (de type TEL) du standard CDAr2 :
        L'élément doit comporter un attribut "value" bien formaté avec les préfixes autorisés par le CI-SIS, 
        et optionnellement un attribut "use" (qui n'est pas contrôlé).
        Alternativement, si l'attribut nullFlavor est présent, il doit avoir l'une des valeurs admises par le CI-SIS. 
    </p>
    <rule context="cda:telecom">
        <let name="prefix" value="substring-before(@value, ':')"/>
        <let name="suffix" value="substring-after(@value, ':')"/>           
        <assert test="(             (count(@*) = 1 and name(@*) = 'nullFlavor' and             (@* = 'UNK' or @* = 'NASK' or @* = 'ASKU' or @* = 'NAV' or @* = 'MSK')) or             ($suffix and (             $prefix = 'tel' or              $prefix = 'fax' or              $prefix = 'mailto' or              $prefix = 'http' or              $prefix = 'ftp' or              $prefix = 'mllp'))             )">
            Erreur de conformité CI-SIS : <name/> n'est pas conforme à une adresse de télécommunication préfixe:chaîne 
            (avec préfixe = tel, fax, mailto, http, ftp ou mllp) 
            ou est vide et sans nullFlavor, ou contient un nullFlavor non admis.
        </assert>
        <assert test=" @use = 'H'                      or @use = 'HP'                      or @use = 'HV'                      or @use = 'WP'                     or @use = 'DIR'                      or @use = 'PUB'                      or @use = 'EC'                      or @use = 'MC'                      or @use = 'PG'                      or not(@use)">
            Erreur de conformité CI-SIS : L'attribut use de l'élément telecom n'est pas conforme. 
            Il est facultatif et les valeurs permises sont 'H','HP', 'HV','WP','DIR','PUB','EC','MC','PG'.
            </assert>
    </rule>
</pattern> 
    <pattern id="SAP_ModeleEnTete">
    <p>Conformité de l'en-tête CDA au modèle SAP</p>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.1']"> 
            SAP_ModeleEnTete: Le template parent "Volet Synthèse antepartum" (1.2.250.1.213.1.1.1.12.1) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            SAP_ModeleEnTete : 
            L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/&gt;. 
        </assert>
    </rule>
</pattern> 
    
                 
    
    <pattern id="allergiesAndIntolerance-errors">
    <title>IHE PCC v3.0 Allergy and Intolerance Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.13&#34;]"> 
         
        <assert test="../cda:section"> 
            Erreur [allergiesAndIntolerance (Section)]: Allergies and Intolerance ne peut être utilisé que dans une section. 
        </assert> 
        
        <assert test="cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.2&#34;]"> 
            Erreur [allergiesAndIntolerance (Section)]: Le templateId parent CCD 3.8 de la section 'Allergies and Intolerance' (2.16.840.1.113883.10.20.1.2) doit être présent</assert>
         
        <assert test="cda:code[@code = &#34;48765-2&#34;]"> 
            Erreur [allergiesAndIntolerance (Section)]: Le code de la section Allergies and Intolerance doit être 48765-2
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            Erreur [allergiesAndIntolerance (Section)]: L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.3&#34;]"> 
            
            Erreur [allergiesAndIntolerance (Section)]: Allergies and Intolerance doit contenir des éléments Allergy Concern Entry.
        </assert> 
    </rule> 
</pattern>
    <pattern id="allergiesAndIntoleranceConcern-errors">
  <title>IHE PCC v3.0 Allergy and Intolerance Concern</title>


    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.3&#34;]">
    <assert test="cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.27&#34;] and            cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.1&#34;]">
      [allergiesAndIntoleranceConcern] Les  template ID des parents CCD (2.16.840.1.113883.10.20.1.27) 
      et PCC (1.3.6.1.4.1.19376.1.5.3.1.4.5.1) doivent être présents. 
    </assert>
    <assert test="(cda:entryRelationship[@typeCode=&#34;SUBJ&#34; and @inversionInd=&#34;false&#34;]//cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]) or       (cda:sourceOf[@typeCode=&#34;SUBJ&#34; and @inversionInd=&#34;false&#34;]//cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;])">
      [allergiesAndIntoleranceConcern] Cet élément doit contenir un ou plusieurs entrées se conformant au modèle Allergy and Intolerance Entry. 
      Ces éléments sont liés à l'entrée à l'aide de liens &lt;entryRelationship&gt;. L'attribut typeCode est fixé à la valeur 'SUBJ' et l'attribut inversionInd à la valeur 'false'.
    </assert>
    </rule>
</pattern>
    <pattern id="activeProblemSection-errors">


    <title>IHE PCC v3.0 Active Problems Section</title>

    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.6&#34;]">
        
        <assert test="../cda:section"> 
            Erreur de Conformité PCC: 'Active Problems' ne peut être utilisé que comme section.</assert>
        
        
        <assert test="cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.11&#34;]"> 
            Erreur de Conformité PCC: Le templateId parent de la section 'Active Problems' (2.16.840.1.113883.10.20.1.11) doit être présent</assert>
        
        
        <assert test="cda:code[@code = &#34;11450-4&#34;]"> 
        Erreur de Conformité PCC: Le code de la section 'Active Problems' doit être '11450-4'</assert>
        
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> Error: The section
            Erreur de Conformité PCC: L'élément 'codeSystem' de la section 
            'Active Problems' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)</assert>
        
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&#34;]">
            Erreur de Conformité PCC: Une section "Active Problems" doit contenir des entrée de type "Problem Concern Entry"</assert>
    </rule>
</pattern>
    <pattern id="historyOfPastIllness-errors">
    <title>IHE PCC v3.0 History of Past Illness Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.8&#34;]"> 
         
        <assert test="../cda:section"> 
            [historyOfPastIllness] History of Past Illness ne peut être utilisé que dans une section. 
        </assert> 
         
        <assert test="cda:code[@code = &#34;11348-0&#34;]"> 
            [historyOfPastIllness] Le code de la section History of Past Illness doit être 11348-0 
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [historyOfPastIllness] L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&#34;]"> 
            
            [historyOfPastIllness] History of Past Illness doit contenir des éléments Problem Concern Entry.
        </assert> 
    </rule> 
</pattern>
    <pattern id="codedListOfSurgeries-errors">
    <title>IHE PCC v3.0 History of Past Illness Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.12&#34;]"> 
         
        <assert test="../cda:section"> 
            [codedListOfSurgeries] Coded List of Surgeries ne peut être utilisé que dans une section. 
        </assert> 
        
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.11&#34;]"> 
            [codedListOfSurgeries] Le templateId parent de la section 'Coded List of Surgeries' (1.3.6.1.4.1.19376.1.5.3.1.3.11) doit être présent</assert>
         
        <assert test="cda:code[@code = &#34;47519-4&#34;]"> 
            [codedListOfSurgeries] Le code de la section Coded List of Surgeries doit être 47519-4 
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [codedListOfSurgeries] L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.19&#34;]"> 
            
            [codedListOfSurgeries] Coded List of Surgeries doit contenir des éléments Procedure Entry.
        </assert> 
    </rule> 
</pattern>
    <pattern id="pregnancyHistorySection-errors">
    <title>IHE PCC v3.0 Pregnancy History Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4&#34;]"> 
         
        <assert test="../cda:section"> 
            [pregnancyHistorySection] Le templateId de 'Pregnancy History' ne peut être utilisé que pour une section. 
        </assert> 
        
         
        <assert test="cda:code[@code = &#34;10162-6&#34;]"> 
            [pregnancyHistorySection] Le code utilisé pour la section "Pregnancy History" doit être "10162-6" 
        </assert> 
        
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [pregnancyHistorySection] La nomenclature LOINC doit être utilisée pour coder la section "Pregnancy History"  
            system (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test=".//cda:templateId[@root =&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&#34;]">
            [pregnancyHistorySection] Une section Pregnancy History doit comporter des entrées de type Pregnancy Observation</assert> 
    </rule>
</pattern>
    <pattern id="transfusionHistory-errors">
    <title>IHE PCC v3.0 Transfusion History Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.9.12&#34;]"> 
         
        <assert test="../cda:section"> 
            [transfusionHistory (Section)]: Allergies and Intolerance ne peut être utilisé que dans une section. 
        </assert> 
                
        <assert test="cda:code[@code = &#34;56836-0&#34;]"> 
            [transfusionHistory (Section)]: Le code de la section Transfusion History doit être 56836-0 
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [transfusionHistory (Section)]: L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
    </rule> 
</pattern>
    <pattern id="codedSocialHistory-errors">
   
    <title>IHE PCC v3.0 Coded Social History Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.16.1&#34;]"> 
         
        <assert test="../cda:section"> 
            [codedSocialHistory] le templateId de 'Coded Social History' ne peut être utilisé que pour une section.
        </assert> 
         
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.16&#34;]"> 
            [codedSocialHistory] L'OID du template parent de la section 'Coded Social History' est absent. 
        </assert> 
         
        <assert test="cda:code[@code = &#34;29762-2&#34;]"> 
            [codedSocialHistory] Le code de la section 'Coded Social History' doit être 29762-2
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [codedSocialHistory] L'attribut 'codeSystem' de la section 'Coded Social History' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.4&#34;]"> 
            
            [codedSocialHistory] La section "Coded Social History"  doit contenir des éléments d'entrée "Social History Observation".
        </assert> 
    </rule>
</pattern>
    <pattern id="codedFamilyMedicalHistory-errors">
   
    <title>IHE PCC v3.0 Coded Social History Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.15&#34;]"> 
         
        <assert test="../cda:section"> 
            [codedFamilyMedicalHistory]: le templateId de 'Coded Family Medical History' 
            ne peut être utilisé que pour une section.
        </assert>
         
        <assert test="cda:code[@code = &#34;10157-6&#34;]"> 
            [codedFamilyMedicalHistory] : Le code de la section 'Coded Family Medical History' doit être 10157-6
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
           [codedFamilyMedicalHistory] : L'attribut 'codeSystem' de la section 'Coded Family Medical History' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert>  
         
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.14&#34;]"> 
            [codedFamilyMedicalHistory] : Le template parent de Coded Family Medical History n'est pas présent. 
        </assert> 
        
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.15&#34;]">
            [codedFamilyMedicalHistory] : La section Coded Family Medical History 
            doit contenir au moins une entrée Family History Organizer.
        </assert>
        
        <assert test="not(.//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.15&#34;]) or              (.//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.15&#34;] and .//cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.23&#34;])">
            [codedFamilyMedicalHistory] : Le template parent de l'entrée Family History Organizer doit être présent.
        </assert>
    </rule>
</pattern>
    <pattern id="codedResults-errors">

    <title>IHE PCC Coded Results Section</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.28&#34;]">
         
        <assert test="../cda:section"> 
            [codedResults] 'Coded Results' ne peut être utilisé que comme section.</assert>
        
        <assert test="cda:code[@code = '30954-2']"> 
            [codedResults] Le code de la section 'Coded Results' doit être '30954-2'</assert>
        
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [codedResults] L'élément 'codeSystem' de la section 
            'Coded Results' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1).</assert>
    </rule>
</pattern>
    <pattern id="CodedAntenatalTestingAndSurveillance-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing and Surveillance Section</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5.1&#34;]"> 
        
                
        <assert test="../cda:section"> 
            [CodedAntenatalTestingAndSurveillance] 'Coded Antenatal Testing and Surveillance' ne peut être utilisé que comme section.
        </assert> 

         
        <assert test="cda:code[@code = &#34;57078-8&#34;]"> 
            [CodedAntenatalTestingAndSurveillance] Le code de la section 'Prenatal Events' doit être '57078-8'
        </assert> 
        
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [CodedAntenatalTestingAndSurveillance] L'élément 'codeSystem' de la section 
            'Coded Antenatal Testing and Surveillance Section' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
         
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.21.2.5&#34;]"> 
            [CodedAntenatalTestingAndSurveillance] L'OID du template parent de la section 'Coded physical Exam' est absent. 
        </assert> 
        
        
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10&#34;]">
            [CodedAntenatalTestingAndSurveillance] Une section 'Antenatal Testing and Surveillance' doit contenir un élément 'Antenatal Testing and Surveillance Battery'.
        </assert> 
    </rule>
</pattern>
    <pattern id="patientEducationAndConsents-errors">
    
    <title>IHE PCC v3.0 Patient Education and Consents</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.9.39&#34;]">
         
        <assert test="../cda:section"> 
            [patientEducationAndConsents] 'Patient Education and Consents' ne peut qu'être utilisé que comme sections. 
        </assert> 
         
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.9.38&#34;]"> 
            [patientEducationAndConsents] le templateId parent de la section 'Patient Education and Consents' n'est pas présent. 
        </assert> 
         
        <assert test="cda:code[@code = &#34;34895-3&#34;]"> 
            [patientEducationAndConsents] Le code de la section 'Patient Education and Consents' doit être '34895-3' 
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [patientEducationAndConsents] élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert> 
        
        
    </rule>
</pattern>
    <pattern id="codedVitalSigns-errors">
    <title>IHE PCC v3.0 Coded Vital Signs Section - errors validation phase</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2&#34;]">
        

        <assert test="../cda:section"> 
            [codedVitalSigns] ce template ne peut être utilisé que comme section.
        </assert>         
         
        <assert test="cda:code[@code = &#34;8716-3&#34;]"> 
            [codedVitalSigns] Le code de la section Coded Vital signs doit être 8716-3
        </assert> 
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
            [codedVitalSigns] L'élément 'codeSystem' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
         
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.25&#34;]"> 
            [codedVitalSigns] L'identifiant du template parent pour la section est absent. 
        </assert>
        
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.1&#34;]">
            [codedVitalSigns] Une section 'Coded Vital Signs' doit contenir un élément 'Vital Signs Organizer'.
        </assert> 
    </rule>
</pattern>
    <pattern id="medicationsAdministered-errors">
    <title>IHE PCC v3.0 Medications Section</title>
    <rule context="*[cda:templateId/@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.3.21&#34;]">
        
        <assert test="../cda:section"> [medicationsAdministered] le templateId de 'Medications' ne
            peut être utilisé que pour une section. </assert>
        
        <assert test="cda:code[@code = &#34;18610-6&#34;]"> [medicationsAdministered] Le code de la section
            'Medications doit être 18610-6 </assert>
        <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> [medicationsAdministered] Le
            code de la section doit être un code LOINC system (2.16.840.1.113883.6.1). </assert>
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]">
             [medicationsAdministered] La section
            Medications doit contenir des entrées de type Medications Entry. See
            http://wiki.ihe.net/index.php?title=1.3.6.1.4.1.19376.1.5.3.1.3.19 </assert>
    </rule>
</pattern>
    <pattern id="statutDocSection-errors">

    <title>ASIP Section Statut du document</title>
        
        
    <rule context="*[cda:templateId/@root=&#34;1.2.250.1.213.1.1.2.35&#34;]"> 
             
            <assert test="../cda:section"> 
                Erreur [statutDocSection]: 'Statut du document' ne peut être utilisé que comme section
            </assert> 
             
        <assert test="cda:code[@code = &#34;33557-0&#34;]"> 
            [statutDocSection]: Le code de la section 'Statut du document' doit être '33557-0'              
            </assert> 
            <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
                [statutDocSection]: L'élément 'codeSystem' de la section 
                'Statut du document' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test="cda:title">
            [statutDocSection]: Cette section doit avoir un titre significatif de son contenu.
        </assert>
        
        <assert test="cda:id">
            [statutDocSection]: La section doit avoir un identifiant unique permettant de les identifier.
        </assert>
          
    </rule>
</pattern>
    <pattern id="laboratorySpecialtySection-errors">
    <title>Laboratory Specialty Section</title>

        
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.3.3.2.1&#34;]"> 
             
            <assert test="../cda:section"> 
                [laboratorySpecialtySection] 'Laboratory Specialty Section' ne peut être utilisé que comme section
            </assert> 
             
        <assert test="cda:code[             @code=&#34;18716-1&#34; or             @code=&#34;18717-9&#34; or             @code=&#34;18718-7&#34; or             @code=&#34;18719-5&#34; or             @code=&#34;18720-3&#34; or             @code=&#34;18721-1&#34; or             @code=&#34;18722-9&#34; or             @code=&#34;18723-7&#34; or             @code=&#34;18724-5&#34; or             @code=&#34;18725-2&#34; or             @code=&#34;18727-8&#34; or             @code=&#34;18728-6&#34; or             @code=&#34;18767-4&#34; or             @code=&#34;26435-8&#34; or             @code=&#34;26436-6&#34;                                        ]"> 
            [laboratorySpecialtySection] Le code de la section doit faire partie des valeurs prévues pour les examens de biologie             
        </assert> 
        
            <assert test="cda:code[@codeSystem = &#34;2.16.840.1.113883.6.1&#34;]"> 
                [laboratorySpecialtySection] L'élément 'codeSystem' de la section 
                'immunohématologie' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.3.1&#34;]"> 
            
            [laboratorySpecialtySection] Une section "Laboratory Specialty" doit contenir des entrée de type "Laboratory Report Data Processing Entry"
            </assert> 
        </rule> 
        
    </pattern>  
    
                  
    
    <pattern id="AllergiesAndIntolerances-errors">

    <title>IHE PCC v3.0 Allergies and Intolerances</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]">
        
        <assert test="../cda:observation[@classCode=&#34;OBS&#34;]">
            [AllergiesAndIntolerances]Erreur de Conformité PCC: Une entrée 'Allergies and intolerances' est un type particulier 
            de problème et sera de la même manière représentée comme une élément de type 'observation' 
            avec un attribut classCode='OBS'.</assert>
        
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5&#34;]">
            [AllergiesAndIntolerances]Erreur de Conformité PCC: Le template de l'entrée 'Allergies and intolerances' spécialise le template 
            de l'entrée 'Problem Entry'. A ce titre, le templateId de ce dernier (1.3.6.1.4.1.19376.1.5.3.1.4.5) sera déclaré.</assert>

        <assert test="cda:code[@code and @codeSystem]">
            [AllergiesAndIntolerances] Erreur de Conformité PCC: L'élément 'code' de l'entrée 'Allergies and Intolerances' indique le 
            type d'allergie provoqué (par un médicament, un facteur environnemental ou un aliment), 
            s'il s'agit d'une allergie, d'une intolérance sans manifestation allergique, ou encore un
            type inconnu de réaction (ni allergique, ni intolérance).
            L'élément 'code' doit obligatoirement comporter les attributs 'code' et 'codeSystem'.</assert>
        
        <assert test="(cda:value[@xsi:type=&#34;CD&#34;]) and              (cda:value[@code and @codeSystem] or cda:value[not(@code) and not(@codeSystem)])">
            [AllergiesAndIntolerances] Erreur de Conformité PCC: L'élément 'value' décrit l'allergie ou la réaction adverse observée. 
            Alors que l'élément 'value' peut être un caractère codé ou non, son type sera 
            toujours 'coded value' (xsi:type='CD'). 
            Dans le cas de l'utilisation d'un code, les attributs les attributs 'code' et 'codeSystem'seront présents, 
            et dans le cas contraire, tout autre attribut que xsi:type='CD' seront absents.</assert>

       
    </rule>
</pattern>
    <pattern id="problemConcernEntry-errors">
    <title>IHE PCC v3.0 Problem Concern Entry - errors validation phase</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.2&#34;]">

        <assert test="cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.1&#34;]"> 
            [problemConcernEntry] Problem Concern Entry a un template OID 1.3.6.1.4.1.19376.1.5.3.1.4.5.2. 
            Elle spécialise Concern Entry et doit donc se conformer à ses spécifications 
            en déclarant son template OID qui est 1.3.6.1.4.1.19376.1.5.3.1.4.5.1. Ces éléments 
            sont requis.
        </assert>
        
        <assert test="cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.27&#34;]"> 
            [problemConcernEntry] Le template parent de Problem Concern est absent.
        </assert>

        
        
        
        
        <assert test="../cda:act[@classCode=&#34;ACT&#34;] and ../cda:act[@moodCode=&#34;EVN&#34;]">
            [problemConcernEntry] une entrée "Concern Entry" est l'acte ("act classCode='ACT'") qui consiste 
            à enregistrer un événement (moodCode='EVN') relatif à un problème, une allergie ou tout autre élément se rapportant
            à l'état clinique d'un patient.
        </assert>

        <assert test="cda:id">
            [problemConcernEntry] L'entrée "Problem Concern Entry" requiert un élément "id".</assert>
        
        <assert test="cda:statusCode[@code=&#34;active&#34; or              @code=&#34;suspended&#34; or             @code=&#34;aborted&#34; or             @code=&#34;completed&#34;]">
            [problemConcernEntry] L'élément "statusCode" associé à tout élément concern doit prendre l'une des valeurs suivantes: 
            "active", "suspended", "aborted" ou "completed".</assert>
        
        <assert test="(cda:effectiveTime[@nullFlavor])or(cda:effectiveTime/cda:low)">
            [problemConcernEntry] l'élément "effectiveTime" indique le début et la fin de la période durant laquelle l'élément "Concern Entry" était actif. 
            Son composant "low" ou un élément nullFlavor sera au moins présent.</assert>
       
        <assert test="(cda:entryRelationship[@typeCode=&#34;SUBJ&#34;] and cda:entryRelationship/*/cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5&#34;])">
            [concernEntry] Tout élément "Problem Concern Entry" concerne un ou plusieurs problèmes ou allergies. 
            Cette entrée contient une ou plusieurs entrées qui se conforment aux spécifications de "Problem Entry" ou "Allergies and Intolerance Entry" 
            permettant à une série d'observations d'être regroupées en un unique élément "Concern Entry", ce à partir de liens de type entryRelationship 
            d'attribut typeCode='SUBJ' et inversionInd='false'</assert>
        
        
    </rule>
</pattern>
    <pattern id="problemEntry-errors">
    <title>IHE PCC v3.0 Problem Entry</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']">

        <assert test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [problemEntry]: Dans l'élément "Problem Entry", le format de base utilisé pour 
            représenter un problème utilise l'élément CDA 'observation' d'attribut classCode='OBS' pour
            signifier qu'il s'agit l'observation d'un problème, et moodCode='EVN', pour exprimer 
            que l'événement a déjà eu lieu. </assert>


        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.28']"> 
            [problemEntry]: Dans l'élément "Problem Entry", les éléments &lt;templateId&gt; 
            identifient l'entrée comme répondant aux spécifications de PCC et de CCD (2.16.840.1.113883.10.20.1.28). 
            Cette déclaration de conformité est requise.</assert>

        <assert test="count(./cda:id) = 1"> 
            [problemEntry]: L'élément "Problem Entry" doit nécessairement avoir un identifiant (&lt;id&gt;) 
            qui est utilisé à des fins de traçage. Si la source d'information du SIS ne fournit pas d'identifiant, 
            un GUID sera affecté comme attribut "root", sans extension (ex: id root='CE1215CD-69EC-4C7B-805F-569233C5E159'). 
            Bien que CDA permette l'utilisation de plusieurs identifiants, "Problem Entry" impose qu'un identifiant 
            seulement soit présent. </assert>

        <assert test="cda:statusCode[@code='completed']"> 
            [problemEntry]: Un élément "Problem Entry" décrit l'observation d'un fait clinique. 
            Son composant "statutCode" sera donc toujours fixé à la valeur code='completed'. </assert>

        <report test="cda:effectiveTime/cda:width or cda:effectiveTime/cda:center"> 
            [problemEntry]: Bien que CDA permette de nombreuses modalités pour exprimer un intervalle de 
            temps (low/high, low/width, high/width, ou center/width), Problem Entry sera contraint à l'utilisation
            exclusive de la forme low/high.</report>

        <assert test="cda:effectiveTime/cda:low[@value or @nullFlavor = 'UNK'] or cda:effectiveTime/cda:low[@value or @nullFlavor = 'NAV']"> 
            [problemEntry]: La composante "low" de l'élément "effectiveTime" doit être exprimée dans 
            un élément "Problem Entry".
            Des exceptions sont cependant admises, comme dans le cas où le patient ne se souvient pas de 
            la date de survenue d'une affection (ex: rougeole dans l'enfance sans date précise).
            Dans ce cas, l'élément "low" aura pour attribut un "nullFlavor" fixé à la valeur 'UNK'. </assert>

        <assert test="cda:value[@xsi:type='CD']"> 
            [problemEntry]: L'élément "value" correspond à l'état (clinique) décritet est donc obligatoire.
            Cet élément est toujours codé et son type sera toujours de type 'CD' (xsi:type='CD'). </assert>

        <assert test="(cda:value[@code and @codeSystem]) or                     (not(cda:value[@code]) and not(cda:value[@codeSystem]))"> 
            [problemEntry]: Si l'élément "value" est codé, les attributs "code" et "codeSystem" 
            seront obligatoirement présents. </assert>
        
        
        
        
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1']) &lt;= 1"> 
            [problemEntry]: Un et un seul élément évaluant la sévérité d'une affection 
            sera présent (entryRelationship) pour une entrée "Problem Entry" </assert>

        <assert test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1']) or                     (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1'] and                     cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true'])"> 
            [problemEntry]: un élément "entryRelationship" optionnel peut être présent 
            et donner une indication sur la sévérité d'une affection. S'il est présent, cet élément 
            se conformera au template Severity Entry (1.3.6.1.4.1.19376.1.5.3.1.4.1).
            Son attribut 'typeCode' prendra alors la valeur 'SUBJ' et 'inversionInd' la valeur 'true'. </assert>
        
        
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']) &lt;= 1"> 
            [problemEntry]: Un et un seul élément évaluant le statut d'une affection (Problem Status Observation)
            sera présent par le biais d'une relation "entryRelationship" pour toute entrée "Problem Entry"</assert>

        <assert test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']) or                     (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1'] and                     cda:entryRelationship[@typeCode='REFR' and @inversionInd='false'])"> 
            [problemEntry]: un élément "entryRelationship" optionnel peut être présent 
            et donner une indication sur le statut clinique d'une affection -- cf. value set "PCC_ClinicalStatusCodes" (1.2.250.1.213.1.1.4.2.283.2). 
            S'il est présent, cet élément se conformera au template "Problem Status Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.1.1).
            Son attribut 'typeCode' prendra alors la valeur 'REFR' et 'inversionInd' la valeur 'false'.</assert>

        
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']) &lt;= 1"> 
            [problemEntry]: Un et un seul élément évaluant le statut de l'état de santé 
            d'un patient (Health Status Observation) sera présent par le biais d'une relation "entryRelationship" 
            pour toute entrée "Problem Entry". </assert>

        <assert test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']) or                     (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2'] and                     cda:entryRelationship[@typeCode='REFR' and @inversionInd='false'])"> 
            [problemEntry]: un élément "entryRelationship" optionnel peut être présent et donner
            une indication sur le statut de l'état de santé d'un patient -- cf. value set "PCC_HealthStatusCodes" (1.2.250.1.213.1.1.4.2.283.1). 
            S'il est présent, cet élément se conformera au template "Health Status Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.1.2).
            Son attribut 'typeCode' prendra alors la valeur 'REFR' et 'inversionInd' la valeur 'false'.</assert>
        
        
        <assert test="not(cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2']) or                     (cda:entryRelationship/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.2'] and                     cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true'])"> 
            [problemEntry]: un ou plusieurs éléments "entryRelationship" optionnels peuvent être présents et 
            permettre d'apporter des informations additionnelles sur le problème observé.
            S'il est présent, cet élément se conformera au template "Comment Entry" (1.3.6.1.4.1.19376.1.5.3.1.4.2).
            Son attribut 'typeCode' prendra alors la valeur 'SUBJ' et 'inversionInd' la valeur 'true'.</assert>

        <assert test="cda:code">  
            [problemEntry] (Alerte): L'élément code -- cf. jeu de valeurs "PCC_ProblemCodes" (1.2.250.1.213.1.1.4.2.283.3) 
            d'une entrée Problem Entry permet d'établir à quel stade diagnostique se positionne un problème : par exemple un diagnostic 
            est un stade plus évolué qu'un symptôme dans la description d'un problème. Cette évaluation est importante pour les cliniciens. </assert>
        
        
        <report test="cda:uncertaintyCode"> 
            [problemEntry] (Alerte): CDA permet à la description d'un état clinique un certain degré d'incertitude avec 
            l'élément "uncertaintyCode". En l'absence actuelle de consensus clairement établi sur le bon usage de cet élément, 
            PCC déconseille de l'utiliser dans le cadre d'une entrée Problem Entry.</report>   
        
        <report test="cda:confidentialityCode"> 
            [problemEntry] (Alerte): CDA permet l'utilisation de l'élément "confidentialtyCode" pour une observation.
            PCC déconseille cependant pour des raisons pratiques de l'utiliser dans le cadre d'une entrée Problem Entry.
            Il y a en effet d'autres manières d'assurer la confidentialité des documents, qui pourront être résolus au sein
            du domaine d'affinité.</report>
        
        <assert test="not(cda:value[@codeSystem]) or cda:value[@codeSystemName]"> 
            [problemEntry] (Alerte): les attributs "codeSystem" et "codeSystemName" de l'élément "value" d'une 
            entrée Problem Entry devraient être présents pour une meilleure lisibilité, mais ne sont pas obligatoires. </assert>
        
        <assert test="not(cda:value[@code]) or cda:value[@displayName]"> 
            [problemEntry] (Alerte): l'attribut "displaySystemName" de l'élément "value" d'une 
            entrée Problem Entry devrait être présent pour une meilleure lisibilité, mais n'est pas obligatoire.</assert>
    </rule>
</pattern>
    <pattern id="procedureEntry-errors">

        <title>IHE PCC v3.0 Procedure Entry</title>
        <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.19&#34;]">
            
            <assert test="self::cda:procedure[@classCode=&#34;PROC&#34;]">
                [procedureEntry]: L'attribut "classCode" pour un élément "Procedure Entry" sera fixé à la valeur "PROC".</assert>
            
            <assert test="not(./@moodCode=&#34;EVN&#34;) or                 cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.29&#34;]">
                [procedureEntry]: Lorsque l'élément "Procedure Entry" est en mode événement (moodCode='EVN'), 
                cette entrée se conforme au template CCD 2.16.840.1.113883.10.20.1.29</assert>
            
            <assert test="not(./@moodCode=&#34;INT&#34;) or                 cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.25&#34;]">
                [procedureEntry]: Lorsque l'élément "Procedure Entry" est en mode intention (moodCode='INT'),
                cette entrée se conforme au template CCD 2.16.840.1.113883.10.20.1.25.</assert>
            
            <assert test="cda:id">
                [procedureEntry]: Un élément "Procedure Entry" comporte un identifiant "id".</assert>
            
            <assert test="cda:code">
            [procedureEntry]: Un élément "Procedure Entry" comporte un élément "code".</assert>
            
            
            <assert test="cda:statusCode[@code = &#34;completed&#34; or                 @code = &#34;active&#34; or                 @code = &#34;aborted&#34; or                 @code = &#34;cancelled&#34;]">
                [procedureEntry]: L'élément "statusCode" sera présent.
                Il prendra la valeur "completed" pour les procédures réalisées, ou "active" pour les procédures 
                toujours en cours. Il prendra la valeur "aborted" por les procédures ayant été stoppées avant la fin 
                et "cancelled" pour celles qui ont été annulées (avant d'avoir débuté).</assert>
            
            <assert test="not(./@moodCode=&#34;INT&#34;) or                  (cda:effectiveTime or cda:priorityCode)">
                [procedureEntry]: dans une entrée "Procedure Entry", l'élément "priorityCode" sera présent en mode "INT" 
                lorsque l'élément "effectiveTime" est omis.
                Il peut cependant exister dans d'autres modes, indiquant le degré de priorité de la procédure.</assert>
    
            <assert test="./@moodCode = &#34;INT&#34; or ./@moodCode = &#34;EVN&#34;">
                [procedureEntry] (Alerte): L'attribut "moodCode" d'une entrée "Procedure Entry" peut prendre la valeur "INT" 
                pour indiquer une procédure escomptée, ou "EVN" pour indiquer qu'elle a déjà été réalisée.</assert>
            
           
            <assert test="cda:effectiveTime">
                [procedureEntry] (Alerte): l'élément "effectiveTime" devrait être présent dans une entrée "Procedure Entry"
                pour horodater la procédure (en mode "EVN") ou la date escomptée pour la procédure (en mode "INT").</assert>
            
            
        </rule>
</pattern>
    <pattern id="pregnancyObservation-errors">
   <title>IHE PCC Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)</title>
   <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&#34;]">
      
    <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;]">
       [pregnancyObservation] Le templateId parent (1.3.6.1.4.1.19376.1.5.3.1.4.13) doit être présent.
    </assert>

      <report test="cda:repeatNumber">
         [pregnancyObservation] L'élément &lt;repeatNumber&gt; devrait être absent.
      </report>

      <report test="cda:interpretationCode or cda:methodCode or cda:targetSiteCode">
         [pregnancyObservation] Les éléments &lt;interpretationCode&gt;, 
         &lt;methodCode&gt;, and &lt;targetSiteCode&gt; devraient être absents.
      </report>
    </rule>


  </pattern>
    <pattern id="socialHistoryObservation-errors">
   <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.4&#34;]">

   <assert test="cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;">
      [socialHistoryObservation] Le templateId du parent (Simple Observation)doit être présent.
   </assert>

   <assert test="cda:templateId/@root=&#34;2.16.840.1.113883.10.20.1.33&#34;">
      [socialHistoryObservation] Le templateId du parent HL7 CCD Social History doit être présent.
   </assert>
       
   <assert test="not(cda:repeatNumber)">
      [socialHistoryObservation] (Warning) L'élément &lt;repeatNumber&gt; devrait être omis.
   </assert>

   <assert test="not(cda:interpretationCode)">
      [socialHistoryObservation] (Warning) L'élément &lt;interpretationCode&gt; devrait être omis.
   </assert>

   <assert test="not(cda:methodCode)">
      [socialHistoryObservation] (Warning) L'élément &lt;methodCode&gt; devrait être omis.
   </assert>

   <assert test="not(cda:targetSiteCode)">
      [socialHistoryObservation] (Warning) L'élément &lt;targetSiteCode&gt; devrait être omis.
   </assert>

    </rule>

  </pattern>
    <pattern id="OBP_codedSocialHistoryValues-errors">
   
    <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>   
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.4&#34;]"> 
        
        <assert test=".//cda:code[             @code = &#34;XX-MCH177&#34;              or @code=&#34;XX-MCH181&#34;             or @code=&#34;OBS_011&#34;             or @code=&#34;OBS_012&#34;             or @code=&#34;OBS_013&#34;             ]"> 
            [OBP_codedSocialHistoryValues] La section "Coded Social History"  doit uniquement contenir des éléments spécifiés dans le volet OBP.
        </assert> 
    </rule>
</pattern>
    <pattern id="familyHistoryObservation-errors">
    <title>IHE PCC Family History Observation - errors validation phase</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.3&#34;]">
        <assert test="cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;] and              cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.22&#34;]">
            [familyHistoryObservation] : L'élément "Family History Observations" spécialise "Simple Observation" 
            et hérite ses contraintes de CCD. Il incluera deux template IDs additionnels : 
            1.3.6.1.4.1.19376.1.5.3.1.4.13 et 2.16.840.1.113883.10.20.1.22.
        </assert>



        <assert test="cda:value[@codeSystem=&#34;2.16.840.1.113883.6.3&#34;]">
            [familyHistoryObservation] : La pathologie observée est l'une des valeurs de la classification CIM-10 (2.16.840.1.113883.6.3).
        </assert>
        
    </rule>
    
    
</pattern>
    <pattern id="pregnancyObservationValues-errors">
   <title>IHE PCC Pregnancy Observation" (1.3.6.1.4.1.19376.1.5.3.1.4.13.5)</title>
   <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5&#34;]">
      
      <assert test="not(cda:code[@code=&#34;11449-6&#34;]) or           (cda:code[@code=&#34;11449-6&#34;] and          cda:value[@xsi:type=&#34;CE&#34;])">
         [pregnancyObservationValues]  Un élément Pregnancy Observation codé 11449-6 (LOINC) utilise un type de données CE.
      </assert>
      <assert test="not(cda:code[@code=&#34;8678-5&#34;]) or          (cda:code[@code=&#34;8678-5&#34;] and          cda:value[@xsi:type=&#34;CE&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 8678-5 (LOINC) utilise un type de données CE.
      </assert>
      <assert test="not(cda:code[@code=&#34;8665-2&#34;]) or          (cda:code[@code=&#34;8665-2&#34;] and          cda:value[@xsi:type=&#34;TS&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 8665-2 (LOINC) utilise un type de données TS.
      </assert>
      <assert test="not(cda:code[@code=&#34;11636-8&#34;]) or          (cda:code[@code=&#34;11636-8&#34;] and          (cda:value[@xsi:type=&#34;QTY&#34;] or          cda:value[@xsi:type=&#34;INT&#34;] or          cda:value[@xsi:type=&#34;MO&#34;] or          cda:value[@xsi:type=&#34;TS&#34;] or          cda:value[@xsi:type=&#34;REAL&#34;] or          cda:value[@xsi:type=&#34;PQ&#34;] or          cda:value[@xsi:type=&#34;RTO&#34;]))">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11636-8 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test="not(cda:code[@code=&#34;11637-6&#34;]) or          (cda:code[@code=&#34;11637-6&#34;] and          (cda:value[@xsi:type=&#34;QTY&#34;] or          cda:value[@xsi:type=&#34;INT&#34;] or          cda:value[@xsi:type=&#34;MO&#34;] or          cda:value[@xsi:type=&#34;TS&#34;] or          cda:value[@xsi:type=&#34;REAL&#34;] or          cda:value[@xsi:type=&#34;PQ&#34;] or          cda:value[@xsi:type=&#34;RTO&#34;]))">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11637-6 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test="not(cda:code[@code=&#34;11638-4&#34;]) or          (cda:code[@code=&#34;11638-4&#34;] and          (cda:value[@xsi:type=&#34;QTY&#34;] or          cda:value[@xsi:type=&#34;INT&#34;] or          cda:value[@xsi:type=&#34;MO&#34;] or          cda:value[@xsi:type=&#34;TS&#34;] or          cda:value[@xsi:type=&#34;REAL&#34;] or          cda:value[@xsi:type=&#34;PQ&#34;] or          cda:value[@xsi:type=&#34;RTO&#34;]))">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11638-4 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test="not(cda:code[@code=&#34;11639-2&#34;]) or          (cda:code[@code=&#34;11639-2&#34;] and          (cda:value[@xsi:type=&#34;QTY&#34;] or          cda:value[@xsi:type=&#34;INT&#34;] or          cda:value[@xsi:type=&#34;MO&#34;] or          cda:value[@xsi:type=&#34;TS&#34;] or          cda:value[@xsi:type=&#34;REAL&#34;] or          cda:value[@xsi:type=&#34;PQ&#34;] or          cda:value[@xsi:type=&#34;RTO&#34;]))">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11639-2 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test="not(cda:code[@code=&#34;11640-0&#34;]) or          (cda:code[@code=&#34;11640-0&#34;] and          (cda:value[@xsi:type=&#34;QTY&#34;] or          cda:value[@xsi:type=&#34;INT&#34;] or          cda:value[@xsi:type=&#34;MO&#34;] or          cda:value[@xsi:type=&#34;TS&#34;] or          cda:value[@xsi:type=&#34;REAL&#34;] or          cda:value[@xsi:type=&#34;PQ&#34;] or          cda:value[@xsi:type=&#34;RTO&#34;]))">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11640-0 (LOINC) utilise un type de données QTY.
      </assert>
      <assert test="not(cda:code[@code=&#34;11778-8&#34;]) or          (cda:code[@code=&#34;11778-8&#34;] and          cda:value[@xsi:type=&#34;TS&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11778-8 (LOINC) utilise un type de données TS.
      </assert>
      <assert test="not(cda:code[@code=&#34;11779-6&#34;]) or          (cda:code[@code=&#34;11779-6&#34;] and          cda:value[@xsi:type=&#34;TS&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11779-6 (LOINC) utilise un type de données TS.
      </assert>
      <assert test="not(cda:code[@code=&#34;11780-4&#34;]) or          (cda:code[@code=&#34;11780-4&#34;] and          cda:value[@xsi:type=&#34;TS&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11780-4 (LOINC) utilise un type de données TS.
      </assert>
      <assert test="not(cda:code[@code=&#34;11884-4&#34;]) or          (cda:code[@code=&#34;11884-4&#34;] and          cda:value[@xsi:type=&#34;PQ&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11780-4 (LOINC) utilise un type de données PQ.
      </assert>
      <assert test="not(cda:code[@code=&#34;11885-1&#34;]) or          (cda:code[@code=&#34;11885-1&#34;] and          cda:value[@xsi:type=&#34;PQ&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11884-4 (LOINC) utilise un type de données PQ.
      </assert>
      <assert test="not(cda:code[@code=&#34;11886-9&#34;]) or          (cda:code[@code=&#34;11886-9&#34;] and          cda:value[@xsi:type=&#34;PQ&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11886-9 (LOINC) utilise un type de données PQ.
      </assert>
      <assert test="not(cda:code[@code=&#34;11887-7&#34;]) or          (cda:code[@code=&#34;11887-7&#34;] and          cda:value[@xsi:type=&#34;PQ&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11887-7 (LOINC) utilise un type de données PQ.        
      </assert>
      <assert test="not(cda:code[@code=&#34;11977-6&#34;]) or          (cda:code[@code=&#34;11977-6&#34;] and          cda:value[@xsi:type=&#34;INT&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 11977-6 (LOINC) utilise un type de données INT.        
      </assert>
      <assert test="not(cda:code[@code=&#34;OBS_041&#34;]) or          (cda:code[@code=&#34;OBS_041&#34;] and          cda:value[@xsi:type=&#34;INT&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_041 (TA_OBP) utilise un type de données INT.        
      </assert>
      <assert test="not(cda:code[@code=&#34;OBS_001&#34;]) or          (cda:code[@code=&#34;OBS_001&#34;] and          cda:value[@xsi:type=&#34;CD&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_001 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test="not(cda:code[@code=&#34;XX-MCH184&#34;]) or          (cda:code[@code=&#34;XX-MCH184&#34;] and          cda:value[@xsi:type=&#34;CD&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé XX-MCH184 (TA_CS) utilise un type de données CD.        
      </assert>
      <assert test="not(cda:code[@code=&#34;OBS_003&#34;]) or          (cda:code[@code=&#34;OBS_003&#34;] and          cda:value[@xsi:type=&#34;CD&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_003 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test="not(cda:code[@code=&#34;D8-34000&#34;]) or          (cda:code[@code=&#34;D8-34000&#34;] and          cda:value[@xsi:type=&#34;BL&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé D8-34000 (SNOMED 3.5) utilise un type de données BL.        
      </assert>
      <assert test="not(cda:code[@code=&#34;XX-MCH219&#34;]) or          (cda:code[@code=&#34;XX-MCH219&#34;] and          cda:value[@xsi:type=&#34;CD&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé XX-MCH219 (TA_CS) utilise un type de données CD.        
      </assert>
      <assert test="not(cda:code[@code=&#34;8339-4&#34;]) or          (cda:code[@code=&#34;8339-4&#34;] and          cda:value[@xsi:type=&#34;PQ&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 8339-4 (TA_CS) utilise un type de données PQ.        
      </assert>
      <assert test="not(cda:code[@code=&#34;OBS_004&#34;]) or          (cda:code[@code=&#34;OBS_004&#34;] and          cda:value[@xsi:type=&#34;CD&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_004 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test="not(cda:code[@code=&#34;OBS_005&#34;]) or          (cda:code[@code=&#34;OBS_005&#34;] and          cda:value[@xsi:type=&#34;CD&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé OBS_005 (TA_OBP) utilise un type de données CD.        
      </assert>
      <assert test="not(cda:code[@code=&#34;3141-9&#34;]) or          (cda:code[@code=&#34;3141-9&#34;] and          cda:value[@xsi:type=&#34;PQ&#34;])">
         [pregnancyObservationValues] Un élément Pregnancy Observation codé 3141-9 (LOINC) utilise un type de données CD.        
      </assert>
      
      <assert test="cda:code[@code = &#34;11449-6&#34; or          @code = &#34;8678-5&#34; or          @code = &#34;8665-2&#34; or          @code = &#34;11636-8&#34; or          @code = &#34;11637-6&#34; or          @code = &#34;11638-4&#34; or          @code = &#34;11639-2&#34; or          @code = &#34;11640-0&#34; or          @code = &#34;11778-8&#34; or          @code = &#34;11779-6&#34; or          @code = &#34;11780-4&#34; or          @code = &#34;11884-4&#34; or          @code = &#34;11885-1&#34; or          @code = &#34;11886-9&#34; or          @code = &#34;11887-7&#34; or          @code = &#34;11977-6&#34; or          @code = &#34;OBS_041&#34; or          @code = &#34;OBS_001&#34; or          @code = &#34;XX-MCH184&#34; or          @code = &#34;OBS_003&#34; or          @code = &#34;D8-34000&#34; or          @code = &#34;XX-MCH219&#34; or          @code = &#34;8339-4&#34; or          @code = &#34;OBS_004&#34; or          @code = &#34;OBS_005&#34; or          @code = &#34;3141-9&#34;           ]">
         [pregnancyObservationValues] Un élément Pregnancy Observation est codé à partir d'une liste de valeurs spécifique.
      </assert>
    </rule>


  </pattern>
    <pattern id="codedVitalSignsOrg-errors">
    <title>IHE PCC v3.0 Vital Signs Organizer</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.1&#34;]">
        <assert test="../cda:organizer"> 
            Erreur de Conformité PCC: 'Coded physical Exam' ne peut être utilisé que comme section.
        </assert> 
        
        <assert test="cda:code[@code =&#34;F-03400&#34;]">
            Erreur de Conformité PCC: Le codage de l'élément 'Vital Signs Organizer' doit être 'F-03400'.           
        </assert>
        
        <assert test="cda:code[@codeSystem =&#34;1.2.250.1.213.2.12&#34;]"> 
            Erreur de Conformité PCC: L'attribut 'codeSystem' de l'élément 'Vital Signs Organizer' a pour valeur '1.2.250.1.213.2.12' (SNOMED 3.5)           
        </assert>
         
        <assert test="cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.32&#34;]"> 
            Erreur de Conformité PCC: L'identifiant du template parent (2.16.840.1.113883.10.20.1.32) doit être présent. 
        </assert>
         
        <assert test="cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.35&#34;]"> 
            Erreur de Conformité PCC: L'identifiant du template parent (2.16.840.1.113883.10.20.1.35) doit être présent. 
        </assert>        
        
        <assert test=".//cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.2&#34;]"> 
            Erreur de Conformité PCC: L'élément 'Vital Sign Organizer' doit au moins contenir une entrée 'Vital Sign Observation'
        </assert> 

    </rule>
    

</pattern>
    <pattern id="VitalSignsObservation-errors">
    <title>IHE PCC v3.0 Vital Signs Observation</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.2&#34;]">

         
        <assert test="cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.31&#34;]"> 
            [VitalSignsObservation] L'identifiant du template parent (2.16.840.1.113883.10.20.1.31) doit être présent. 
        </assert>
         
        <assert test="cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;]"> 
            [VitalSignsObservation] L'identifiant du template parent (1.3.6.1.4.1.19376.1.5.3.1.4.13) doit être présent. 
        </assert>
    
        
    </rule>
    

</pattern>
    <pattern id="VitalSignsObservationValues-errors">
    <title>IHE PCC v3.0 Vital Signs Observation</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.2&#34;]">
       

        
        <assert test="cda:code[@code =&#34;3141-9&#34; or             @code =&#34;8302-2&#34; or             @code =&#34;9279-1&#34; or             @code =&#34;8867-4&#34; or             @code =&#34;2710-2&#34; or             @code =&#34;8480-6&#34; or             @code =&#34;8462-4&#34; or             @code =&#34;8310-5&#34; or             @code =&#34;8306-3&#34; or             @code =&#34;8287-5&#34; or             @code =&#34;41909-3&#34;              ]">
            [VitalSignsObservationValues] Le codage de l'élément 'Vital Signs Organizer' doit être 'F-03400'.           
        </assert>
        
        
        <assert test="cda:value[@xsi:type=&#34;PQ&#34;]">
            [VitalSignsObservationValues] La mesure d'un signe vital utilise le type de données PQ.
        </assert>
        
        <assert test="not(cda:code[@code=&#34;3141-9&#34;]) or             (cda:code[@code=&#34;3141-9&#34;] and             cda:value[@unit=&#34;kg&#34; or @unit=&#34;g&#34;])">
            [VitalSignsObservationValues] La mesure du poids (3141-9) 
            est un nombre indénombrable s'exprimant en grammes (g) ou en kilogrammes (kg).
        </assert>        
        
        <assert test="not(cda:code[@code=&#34;9279-1&#34;]) or             (cda:code[@code=&#34;9279-1&#34;] and             cda:value[@unit=&#34;/min&#34;])">
            [VitalSignsObservationValues] La mesure de la fréquence respiratoire (9279-1) 
            est un nombre indénombrable s'exprimant en min-1 (/min).
        </assert>
        
        <assert test="not(cda:code[@code=&#34;8867-4&#34;]) or             (cda:code[@code=&#34;8867-4&#34;] and             cda:value[@unit=&#34;/min&#34;])">
            [VitalSignsObservationValues] La mesure de la fréquence cardiaque (8867-4) 
            est un nombre indénombrable s'exprimant en min-1 (/min).
        </assert>
        
        <assert test="not(cda:code[@code=&#34;2710-2&#34;]) or             (cda:code[@code=&#34;2710-2&#34;] and             cda:value[@unit=&#34;%&#34;])">
            [VitalSignsObservationValues] La mesure de la saturation en oxygène (2710-2)
            est un nombre indénombrable s'exprimant en pourçentage (%).
        </assert>
        
        <assert test="not(cda:code[@code=&#34;8480-6&#34;]) or             (cda:code[@code=&#34;8480-6&#34;] and             cda:value[@unit=&#34;mm[Hg]&#34;])">
            [VitalSignsObservationValues] La mesure de la pression artérielle systolique (8480-6)
            est un nombre indénombrable s'exprimant en millimètres de mercure (mm[Hg]).
        </assert>
        
        <assert test="not(cda:code[@code=&#34;8462-4&#34;]) or             (cda:code[@code=&#34;8462-4&#34;] and             cda:value[@unit=&#34;mm[Hg]&#34;])">
            [VitalSignsObservationValues] La mesure de la pression artérielle diastolique (8462-4)
            est un nombre indénombrable s'exprimant en millimètres de mercure (mm[Hg]).
        </assert>
        
        <assert test="not(cda:code[@code=&#34;8310-5&#34;]) or             (cda:code[@code=&#34;8310-5&#34;] and             cda:value[@unit=&#34;Cel&#34; or @unit=&#34;[degF]&#34;])">
            [VitalSignsObservationValues] La mesure de la Température corporelle (8310-5)
            est un nombre indénombrable s'exprimant en degrés Celsius (Cel) ou en degré Fahrenheit ([degF]).
        </assert>
        
        <assert test="not(cda:code[@code=&#34;8302-2&#34;]) or             (cda:code[@code=&#34;8302-2&#34;] and             cda:value[@unit=&#34;m&#34; or              @unit=&#34;cm&#34; or             @unit=&#34;[in_us]&#34; or             @unit=&#34;[in_uk]&#34;             ])">
            [VitalSignsObservationValues] La mesure de la Taille (8302-2)
            est un nombre indénombrable s'exprimant en degrés mètres (m), en centimètres (cm),
            en inches US ([in_us]) ou en inches UK [in_uk].
        </assert>
        
        <assert test="not(cda:code[@code=&#34;8287-5&#34;]) or             (cda:code[@code=&#34;8287-5&#34;] and             cda:value[@unit=&#34;m&#34; or              @unit=&#34;cm&#34; or             @unit=&#34;[in_us]&#34; or             @unit=&#34;[in_uk]&#34;             ])">
            [VitalSignsObservationValues] La mesure du Périmètre crânien (8287-5)
            est un nombre indénombrable s'exprimant en degrés mètres (m), en centimètres (cm),
            en inches US ([in_us]) ou en inches UK [in_uk].
        </assert>
        
        <assert test="not(cda:code[@code=&#34;3141-9&#34;]) or             (cda:code[@code=&#34;3141-9&#34;] and             cda:value[@unit=&#34;kg&#34; or              @unit=&#34;g&#34; or             @unit=&#34;[lb_av]&#34; or             @unit=&#34;[oz_av]&#34;             ])">
            [VitalSignsObservationValues] La mesure du Poids corporel (3141-9)
            est un nombre indénombrable s'exprimant en kilogrammes (kg), en grammes (g),
            en livres avoirdupois ([lb_av]) ou en onces avoirdupois [oz_av].
        </assert>
    </rule>
    

</pattern>
    <pattern id="comments-errors">
    
        <title>IHE PCC v3.0 Comments - errors validation phase</title>
        <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.2&#34;]">
            
            <assert test="cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.40&#34;]">
                Erreur de Conformité PCC: Le templateId CCD (2.16.840.1.113883.10.20.1.40) de l'entrée
                Comments doit être déclaré.</assert>
            
            <assert test="cda:code[@code=&#34;48767-8&#34; and                 @codeSystem=&#34;2.16.840.1.113883.6.1&#34;]">
                Erreur de Conformité PCC: L'élément "code" pour l'entrée "Comments" est requis. Ses attributs "code" et "codeSystem"
                sont obligatoires (cf. CI-SIS Volet de contenu CDA)</assert>
            
            <assert test="cda:statusCode[@code = &#34;completed&#34;]">
            Erreur de Conformité PCC: La valeur de l'élément "code" de "statusCode" est toujours fixée à "completed". </assert>
            
            <assert test="not(cda:author) or (                 cda:author/cda:time and                 cda:author/cda:assignedAuthor/cda:id and                 cda:author/cda:assignedAuthor/cda:addr and                 cda:author/cda:assignedAuthor/cda:telecom and                 cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name and                 cda:author/cda:assignedAuthor/cda:representedOrganization/cda:name)">
                Erreur de Conformité PCC: Un élément "Comment" peut avoir un auteur.
                L'horodatage de la création de l'élément "Comment" est réalisé à partir de l'élément "time" lorsque l'élément "author" est présent.
                L'identifiant de l'auteur (id), son adresse (addr) et son numéro de téléphone (telecom) sont dans ce cas obligatoires. 
                Le nom de l'auteur et/ou celui de l'organisation qu'il représente doit être présent.</assert>
            
            
        </rule>
</pattern>
    <pattern id="concernEntry-errors">
    <title>IHE PCC v3.0 Concern Entry</title>
        <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5.1&#34;]">
            <assert test="../cda:act">
                [concernEntry]  L'entrée "Concern Entry" ne peut être utilisée que comme un élément "act".</assert>
            
            <assert test="../cda:act[@classCode=&#34;ACT&#34;] and ../cda:act[@moodCode=&#34;EVN&#34;]">
                [concernEntry] une entrée "Concern Entry" est l'acte ("act classCode='ACT'") qui consiste 
                à enregistrer un événement (moodCode='EVN') relatif à un problème, une allergie ou tout autre élément se rapportant
                à l'état clinique d'un patient.</assert>
            
            <assert test="cda:templateId[@root=&#34;2.16.840.1.113883.10.20.1.27&#34;]">
                [concernEntry] Ces élément templateId indiquent que l'entrée "Concern Entry" se conforme 
                au module de contenu Concern. Celui-ci hérite des contraintes du template HL7 CCD pour les "problem acts", 
                et déclarera sa conformité à patir du templateId 2.16.840.1.113883.10.20.1.27.</assert>
            
            <assert test="cda:id">
                [concernEntry] L'entrée "Concern Entry" requiert un élément "id".</assert>
            
            <assert test="cda:code[@nullFlavor=&#34;NA&#34;]">
                [concernEntry] l'élément "code" n'est pas applicable à un élément "Concern Entry", et prendra la valeur nullFlavor='NA'.</assert>
            
            <assert test="cda:statusCode[@code=&#34;active&#34; or                  @code=&#34;suspended&#34; or                 @code=&#34;aborted&#34; or                 @code=&#34;completed&#34;]">
                [concernEntry] L'élément "statusCode" associé à tout élément concern doit prendre l'une des valeurs suivantes: 
                "active", "suspended", "aborted" ou "completed".</assert>
            
            <assert test="(cda:effectiveTime[@nullFlavor])or(cda:effectiveTime/cda:low)">
                [concernEntry] l'élément "effectiveTime" indique le début et la fin de la période durant laquelle l'élément "Concern Entry" était actif. 
                Son composant "low" ou un élément nullFlavor sera au moins présent.</assert>
            
            <assert test="(cda:effectiveTime[@nullFlavor]) or ((cda:statusCode[@code=&#34;completed&#34; or @code=&#34;aborted&#34;] and cda:effectiveTime/cda:high) or                 (cda:statusCode[@code=&#34;active&#34; or @code=&#34;suspended&#34;] and not(cda:effectiveTime/cda:high)))">
                [concernEntry] l'élément "effectiveTime" indique le début et la fin de la période durant laquelle l'élément 
                "Concern Entry" était actif. 
                Son composant "high" (ou un élément nullFlavor ) sera présent pour les éléments "Concern entry" ayant un statut "completed" ou "aborted" 
                et sera absent dans tous les autres cas</assert>
            
            <assert test="(cda:entryRelationship[@typeCode=&#34;SUBJ&#34;] and cda:entryRelationship/*/cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5&#34; or @root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]) or                   (cda:sourceOf[@typeCode=&#34;SUBJ&#34; and @inversionInd=&#34;false&#34;] and cda:sourceOf/*/cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.5&#34; or @root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]) ">
                [concernEntry] Tout élément "Concern Entry" concerne un ou plusieurs problèmes ou allergies. 
                Cette entrée contient une ou plusieurs entrées qui se conforment aux spécifications de "Problem Entry" ou "Allergies and Intolerance Entry" 
                permettant à une série d'observations d'être regroupées en un unique élément "Concern Entry", ce à partir de liens de type entryRelationship 
                d'attribut typeCode='SUBJ' et inversionInd='false'</assert>
        </rule>
    </pattern>
    <pattern id="simpleObservation-errors">
    <title>IHE PCC v3.0 Simple Observation</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']">
        
        <assert test="cda:id">
            Erreur de Conformité PCC: "Simple Observation" requiert un élément identifiant &lt;id&gt;.</assert>
        
        <assert test="cda:code">
            Erreur de Conformité PCC: "Simple Observation" requiert un élément "code" décrivant ce qui est observé.</assert>
        
        <assert test="cda:statusCode[@code = &#34;completed&#34;]">
            Erreur de Conformité PCC: L'élément "statusCode" est requis dans "Simple Observations" 
            sont fixés à la valeur "completed".</assert>
        
        <assert test="cda:effectiveTime[@value or @nullFlavor] or cda:effectiveTime/cda:low[@value or @nullFlavor]">
            Erreur de Conformité PCC: L'élément &lt;effectiveTime&gt; est requis dans "Simple Observations",
            et représentera la date et l'heure de la mesure effectuée. Cet élément devrait être précis au jour. 
            Si la date et l'heure sont inconnues, l'attribut nullFlavor sera utilisé.</assert>
        
        <assert test="cda:value">
            Erreur de Conformité PCC: L'élément "value" d'un élément "Simple Observation" utilisera un 
            type de donnée approprié à l'observation.</assert>        
        
    </rule>
    
    
</pattern> 
    <pattern id="socialHistoryObservationValues-errors">
   <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.4&#34;]">

   <assert test="cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;">
      [socialHistoryObservation] Le templateId du parent (Simple Observation)doit être présent.
   </assert>

       <assert test="cda:code[@code = &#34;XX-MCH177&#34; or           @code = &#34;XX-MCH181&#34; or           @code = &#34;OBS_011&#34; or           @code = &#34;OBS_013&#34; or           @code = &#34;OBS_012&#34;            ]">
          [socialHistoryObservation] Un élément Social History Observation est codé à partir d'une liste de valeurs spécifique.
       </assert>
       <assert test="not(cda:code[@code=&#34;XX-MCH177&#34;]) or           (cda:code[@code=&#34;XX-MCH177&#34;] and           cda:value[@xsi:type=&#34;BL&#34;])">
          [socialHistoryObservation] Un élément Pregnancy Observation codé XX-MCH177 (TA_CS) utilise un type de données BL.        
       </assert>
       <assert test="not(cda:code[@code=&#34;XX-MCH181&#34;]) or           (cda:code[@code=&#34;XX-MCH181&#34;] and           cda:value[@xsi:type=&#34;BL&#34;])">
          [socialHistoryObservation] Un élément Pregnancy Observation codé XX-MCH181 (TA_CS) utilise un type de données BL.        
       </assert>
       <assert test="not(cda:code[@code=&#34;OBS_011&#34;]) or           (cda:code[@code=&#34;OBS_011&#34;] and           cda:value[@xsi:type=&#34;BL&#34;])">
          [socialHistoryObservation] Un élément Pregnancy Observation codé OBS_011 (TA_OBP) utilise un type de données BL.        
       </assert>
       <assert test="not(cda:code[@code=&#34;OBS_012&#34;]) or           (cda:code[@code=&#34;OBS_012&#34;] and           cda:value[@xsi:type=&#34;BL&#34;])">
          [socialHistoryObservation] Un élément Pregnancy Observation codé OBS_012 (TA_OBP) utilise un type de données BL.        
       </assert>
       <assert test="not(cda:code[@code=&#34;OBS_013&#34;]) or           (cda:code[@code=&#34;OBS_013&#34;] and           cda:value[@xsi:type=&#34;BL&#34;])">
          [socialHistoryObservation] Un élément Pregnancy Observation codé OBS_013 (TA_OBP) utilise un type de données BL.        
       </assert>
    </rule>

  </pattern>
    <pattern id="codedAntenatalTestingAndSurveillanceOrg-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing and Surveillance Organizer</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10&#34;]">
        <assert test="../cda:organizer"> 
            Erreur de Conformité PCC: 'Conformité PCC v3.0 (Erreur):' ne peut être utilisé que comme organizer.
        </assert> 
        
        <assert test="cda:code[@code=&#34;XX-ANTENATALTESTINGBATTERY&#34; and              @displayName=&#34;ANTENATAL TESTING AND SURVEILLANCE BATTERY&#34; and             @codeSystem=&#34;2.16.840.1.113883.6.1&#34; and             @codeSystemName=&#34;LOINC&#34;]">
            [codedAntenatalTestingAndSurveillanceOrg] L'élément &lt;code&gt; de l'organizer "Antenatal Testing and Surveillance"est requis, et 
            identifie celui-ci comme un organizer contenant des données de test et de surveillance: &lt;code code='XX-ANTENATALTESTINGBATTERY'
            displayName='ANTENATAL TESTING AND SURVEILLANCE BATTERY' codeSystem='2.16.840.1.113883.6.1' codeSystemName="LOINC"</assert>
         
        
        <assert test="cda:component/cda:observation/cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13&#34;]"> 
            [codedAntenatalTestingAndSurveillanceOrg] L'élément 'Coded Antenatal Testing and Surveillance Organizer' doit 
            au moins contenir une entrée 'Simple Observation' (1.3.6.1.4.1.19376.1.5.3.1.4.13)
        </assert> 
        

        <assert test="cda:id">
            [codedAntenatalTestingAndSurveillanceOrg] "Coded Antenatal Testing and Surveillance Organizer" aura nécessairement un identifiant &lt;id&gt;.
        </assert>

        <assert test="cda:statusCode[@code=&#34;completed&#34;]">
            [codedAntenatalTestingAndSurveillanceOrg] La valeur de l'élément "statusCode" de "Coded Antenatal Testing and Surveillance Organizer" est fixée à "completed".
        </assert>
        <assert test="cda:effectiveTime">
            [codedAntenatalTestingAndSurveillanceOrg] l'élément effectiveTime est requis. Il indique quand l'observation a été faite.
        </assert>

    </rule>
</pattern>
    <pattern id="codedAntenatalTestingAndSurveillanceOrgValues-errors">
    <title>IHE PCC v3.0 Coded Antenatal Testing and Surveillance Organizer</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10&#34;]">
        <assert test="(.//cda:component/cda:observation/cda:code[@code=&#34;OBS_020&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit comporter un élément 'Anomalie de croissance intra-utérine (OBS_020)'.        
        </assert>
        <assert test="(.//cda:component/cda:observation/cda:code[@code=&#34;OBS_021&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit comporter un élément 'Anomalie constitutionnelle' (OBS_021).        
        </assert>
        <assert test="(.//cda:component/cda:observation/cda:code[@code=&#34;OBS_023&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues]L'organizer coded Antenatal 
            Testing and Surveillance doit comporter un élément 'Autres Foetopathie acquises' (OBS_023).        
        </assert>
        <assert test="(.//cda:component/cda:observation/cda:code[@code=&#34;OBS_024&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit compporter un élément 'Pathologie fœtale spécifique des grossesses multiples' (OBS_024).        
        </assert>
        <assert test="(.//cda:component/cda:observation/cda:code[@code=&#34;OBS_274&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit compporter un élément 'Nombre de Foetus' (OBS_274).        
        </assert>
        <assert test="(.//cda:component/cda:observation/cda:code[@code=&#34;OBS_275&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] L'organizer coded Antenatal 
            Testing and Surveillance doit compporter un élément 'Metrorragies du premier trimestre' (OBS_275).        
        </assert>
        
    </rule>
</pattern>
    <pattern id="OBP_patientEducationAndConsentsValues-errors">
    <title>IHE PCC v3.0 patient Education And Consents</title>
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.1.9.39&#34;]">
        <assert test="(.//cda:entry/cda:procedure/cda:code[@code=&#34;XX-MCH035&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] La section doit comporter un élément 'Préparation à la naissance' (XX-MCH035).        
        </assert>
        <assert test="(.//cda:entry/cda:procedure/cda:code[@code=&#34;OBS_009&#34;])">
            [codedAntenatalTestingAndSurveillanceOrgValues] La section doit comporter un élément 
            'Consultation auprès d'un centre de diagnostic prénatal' (OBS_009).        
        </assert>
        
    </rule>
</pattern>
    <pattern id="medications-errors">
    <title>IHE PCC v3.0 Medications</title>
       
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7&#34;]">
        
        
        
        <assert test="cda:templateId[@root = &#34;2.16.840.1.113883.10.20.1.24&#34;]">
            [medications] Toute entrée 'Medications' doit se conformer au template 
            'CCD Medication activity' (2.16.840.1.113883.10.20.1.24). Cette identification est obligatoire</assert>
        
        <assert test="count(cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.7.1&#34;] |              cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.8&#34;] |             cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.9&#34;] |             cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.10&#34;] |             cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.11&#34;])  = 1">
            
            [medications] Toute entrée 'Medications' doit se conformer à l'un des templates suivant,
            identifiant le type de dosage utilisé pour la prescription/administration du médicament : 
            normal dosing (1.3.6.1.4.1.19376.1.5.3.1.4.7.1), tapered dosing (1.3.6.1.4.1.19376.1.5.3.1.4.8), 
            split dosing (1.3.6.1.4.1.19376.1.5.3.1.4.9), conditional dosing (1.3.6.1.4.1.19376.1.5.3.1.4.10), 
            combination dosing (1.3.6.1.4.1.19376.1.5.3.1.4.11) 
            Cette identification est obligatoire.</assert>
        
        <assert test="not(cda:templateId[@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.7.1&#34;]) or              count(.//cda:substanceAdministration) = 0">
            [medications] L'utilisation du template normal dosing (1.3.6.1.4.1.19376.1.5.3.1.4.7.1) 
            dans une entrée 'Medications' implique que l'élément 'substanceAdministration' ne comporte pas d'éléments 
            'substanceAdministration' subordonné.</assert>
        
        <assert test="count(cda:id) = 1">
            [medications] un élément 'substanceAdministration' doit avoir un identifiant unique. Si l'éditeur de
            la source (LPS, SIH,...) n'a pas prévu celle-ci, on pourra lui substituer un GUID, utilisé pour l'attribut 'root',
            l'attribut 'extension' pouvant alors être omis.
            Note: même si HL7 admet qu'un élément puisse avoir plusieurs identifiants, cette entrée n'en utilisera qu'un, et un seul.</assert>
        
        <assert test="cda:statusCode[@code = &#34;completed&#34;]">
            [medications] l'élément 'statusCode' de tout élément 'substanceAdministration' d'une entrée 'Medications' 
            est obligatoirement fixé à la valeur 'completed': soit l'acte a été réalisé, soit la prescription a été faite.</assert>
        
        <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[@codeSystem=&#34;1.2.250.1.213.2.3.1&#34; or @nullFlavor=&#34;UNK&#34;]">
            [medications] Le médicament doit obligatoirement être codé en utilisant la terminologie CIS (1.2.250.1.213.2.3.1) ou utiliser l'attribut NullFlavor='UNK'</assert>   
        
        <assert test="cda:consumable/cda:manufacturedProduct/cda:templateId[@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.7.2&#34;]">
            [medications] L'élément 'consumable' doit obligatoirement être présent dans une entrée 'Medications'.
            Il comportera une entrée 'manufacturedProduct' se conformant au template 'Product Entry' (1.3.6.1.4.1.19376.1.5.3.1.4.7.2).</assert>   
        


        
    </rule>
</pattern>
    
    
    
    <pattern id="OBP_activeProblemSectionEntries-errors">


    <title>IHE PCC v3.0 Active Problems Section Entries</title>

    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.3.6&#34;]">

        

        <assert test=".//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='OBS_016'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée"Metrorragies du 2ème- 3ème trimestre"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='D8-12000'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "MAP"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='OBS_017'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Rupture prématurée des membranes"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='D8-11000'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Hypertension artérielle"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='E14'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Diabète"
        </assert>
        <assert test="//cda:act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='D7-10030'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Infection urinaire"
        </assert>
        <assert test="//cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value/@code='OBS_132'">
            [OBP_activeProblemSectionEntries] : Une section "Active Problems" 
            dans le contexte SAP doit contenir une entrée "Infection cervico-vaginale"
        </assert>
    </rule>
</pattern>
    <pattern id="OBP_pregnancyHistoryOrganizerEntries-errors">
    <title>IHE PCC v3.0 Pregnancy History Section</title>
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1&#34;]">  
        
        
        
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_041']             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Numéro de la grossesse antérieure"
        </assert>

        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='OBS_001'             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Issue de la grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='11884-4'             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Durée de la grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='XX-MCH184'             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pathologie en cours de grossesse" 
            dans le contexte SAP doit contenir une entrée "Pathologie en cours de grossesse"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='OBS_003'             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Etat du périnée"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='11638-4'             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Nombre d'enfants"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code/@code='D8-34000'             or cda:component/cda:organizer/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Pregnancy History" 
            dans le contexte SAP doit contenir une entrée "Hémorragie du post-partum"
        </assert>
        
        

        
        

        
       
        
    </rule>
</pattern>
    <pattern id="OBP_BirthOrganizerEntries-errors">
  
    
    <rule context="*[cda:templateId/@root=&#34;1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2&#34;]">  
        
        
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='XX-MCH219']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Méthode d'accouchement"
        </assert>

        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='8339-4']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Poids à la naissance"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_004']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Etat de l'enfant"
        </assert>
        <assert test="cda:component/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5']/cda:code[@code='OBS_005']">
            [OBP_pregnancyHistoryOrganizerEntries] : Un organizer "Birth Organizer" 
            dans le contexte SAP doit contenir une entrée "Transfert ou mutation"
        </assert>

        
    </rule>
</pattern>


                       

    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="HealthStatusCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.2']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_HealthStatusCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_HealthStatusCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="ClinicalStatusCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1.1']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_ClinicalStatusCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_ClinicalStatusCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="ProblemCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.5' and not (cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6')]/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_ProblemCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_ProblemCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="AllergyAndIntoleranceCodes">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.6']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_AllergyAndIntoleranceCodes)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/component/section/entry/observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_AllergyAndIntoleranceCodes"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_IssueGrossesse">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:code/@code='OBS_001']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_IssueGrossesse)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_IssueGrossesse"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_StaticSAPActiveProblem">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.6']/cda:entry/cda:act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_StaticSAPActiveProblem)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_StaticSAPActiveProblem"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_EtatPérinée">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:code/@code='OBS_003']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_EtatPérinée)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_EtatPérinée"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_IssueAccouchement">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation[cda:code/@code='XX-MCH219']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_IssueAccouchement)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_IssueAccouchement"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_EtatNaissance">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation[cda:code/@code='OBS_004']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_EtatNaissance)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_EtatNaissance"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_TranfertMutation">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:organizer/cda:component/cda:observation[cda:code/@code='OBS_005']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_TranfertMutation)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_TranfertMutation"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="GroupeRhesus">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:code/@code='34530-6']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_GroupeRhesus)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_GroupeRhesus"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_AnomalieCroissance">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:code/@code='OBS_020']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_AnomalieCroissance)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_AnomalieCroissance"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_AnomalieConstitutionnelle">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:code/@code='OBS_021']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_AnomalieConstitutionnelle)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_AnomalieConstitutionnelle"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_HTAGravidique">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='D8-11000']/cda:entryRelationship/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_HTAGravidique)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_HTAGravidique"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_DiabeteGrossesse">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='E14']/cda:entryRelationship/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_DiabeteGrossesse)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_DiabeteGrossesse"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_InfectUrinaire">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='D7-10030']/cda:entryRelationship/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_InfectUrinaire)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_InfectUrinaire"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_InfectCervicoVaginale">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:value/@code='OBS_132']/cda:entryRelationship/cda:observation/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 0)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (0 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_InfectCervicoVaginale)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/act/entryRelationship/observation/entryRelationship/observation/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_InfectCervicoVaginale"/>.
        </assert>
    </rule>
</pattern>
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="OBP_TrimestreGrossesse">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation/cda:entryRelationship/cda:observation/cda:value/cda:qualifier[cda:name/@code='OBP_278']/cda:value">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/value/qualifier/value"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem and @displayName) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/value/qualifier/value"/>" doit avoir ses attributs 
            @code, @codeSystem et @displayName renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($jdv_OBP_TrimestreGrossesse)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/value/qualifier/value"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$jdv_OBP_TrimestreGrossesse"/>.
        </assert>
    </rule>
</pattern>
    
    
    
        
    
    
    <phase id="SAP-20131017">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        <active pattern="addr"/>
        <active pattern="administrativeGenderCode"/>    
        <active pattern="assignedEntity"/>
        <active pattern="authenticatorName"/>
        <active pattern="authorPersonName"/>
        <active pattern="authorSpecialty"/>
        <active pattern="authorTime"/>
        <active pattern="documentCode"/>
        <active pattern="documentEffectiveTime"/>
        <active pattern="healthcareFacilityTypeCode"/>
        <active pattern="informantAssignedPersonName"/>
        <active pattern="informantRelatedEntity"/>
        <active pattern="legalAuthenticatorName"/>
        <active pattern="legalAuthenticatorTime"/>
        <active pattern="modeleCommunEnTete"/>
        <active pattern="nonXMLBody"/>
        <active pattern="patient"/>
        <active pattern="patientBirthTime"/>
        <active pattern="patientId"/>
        <active pattern="patientName"/>
        <active pattern="practiceSettingCode"/>
        <active pattern="relatedDocument"/>
        <active pattern="relatedPersonName"/>
        <active pattern="serviceEventEffectiveTime"/>
        <active pattern="serviceEventPerformer"/>
        <active pattern="telecom"/>
        <active pattern="SAP_ModeleEnTete"/> 
        
        
        
        <active pattern="allergiesAndIntolerance-errors"/>
        <active pattern="allergiesAndIntoleranceConcern-errors"/>
        <active pattern="activeProblemSection-errors"/>
        <active pattern="historyOfPastIllness-errors"/>
        <active pattern="codedListOfSurgeries-errors"/>
        <active pattern="pregnancyHistorySection-errors"/>
        <active pattern="transfusionHistory-errors"/>
        <active pattern="codedSocialHistory-errors"/>
        <active pattern="codedFamilyMedicalHistory-errors"/>
        <active pattern="codedResults-errors"/>
        <active pattern="CodedAntenatalTestingAndSurveillance-errors"/>
        <active pattern="patientEducationAndConsents-errors"/>
        <active pattern="codedVitalSigns-errors"/>
        <active pattern="medicationsAdministered-errors"/>
        <active pattern="statutDocSection-errors"/>
        
        
        
        <active pattern="AllergiesAndIntolerances-errors"/>
        <active pattern="problemEntry-errors"/>
        <active pattern="problemConcernEntry-errors"/>
        <active pattern="procedureEntry-errors"/>
        <active pattern="pregnancyObservation-errors"/>
        <active pattern="socialHistoryObservation-errors"/>
        <active pattern="OBP_codedSocialHistoryValues-errors"/>
        <active pattern="familyHistoryObservation-errors"/>
        <active pattern="laboratorySpecialtySection-errors"/>
        <active pattern="pregnancyObservationValues-errors"/>
        <active pattern="socialHistoryObservationValues-errors"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrg-errors"/>
        <active pattern="codedAntenatalTestingAndSurveillanceOrgValues-errors"/>
        <active pattern="OBP_patientEducationAndConsentsValues-errors"/>
        <active pattern="codedVitalSignsOrg-errors"/>
        <active pattern="VitalSignsObservation-errors"/>
        <active pattern="VitalSignsObservationValues-errors"/>
        <active pattern="comments-errors"/>
        <active pattern="concernEntry-errors"/>
        <active pattern="simpleObservation-errors"/>  
        <active pattern="medications-errors"/>       
        
        
        
        <active pattern="OBP_activeProblemSectionEntries-errors"/>
        <active pattern="OBP_pregnancyHistoryOrganizerEntries-errors"/>
        <active pattern="OBP_BirthOrganizerEntries-errors"/>
        
        
        
        
        <active pattern="HealthStatusCodes"/>
        <active pattern="ClinicalStatusCodes"/>
        <active pattern="ProblemCodes"/>
        <active pattern="AllergyAndIntoleranceCodes"/>
        <active pattern="OBP_IssueGrossesse"/>
        <active pattern="OBP_StaticSAPActiveProblem"/>
        <active pattern="OBP_EtatPérinée"/>
        <active pattern="OBP_IssueAccouchement"/>
        <active pattern="OBP_EtatNaissance"/>
        <active pattern="OBP_TranfertMutation"/>
        <active pattern="GroupeRhesus"/>
        <active pattern="OBP_AnomalieCroissance"/>
        <active pattern="OBP_AnomalieConstitutionnelle"/>
        <active pattern="OBP_HTAGravidique"/>
        <active pattern="OBP_DiabeteGrossesse"/>
        <active pattern="OBP_InfectUrinaire"/>
        <active pattern="OBP_InfectCervicoVaginale"/>
        <active pattern="OBP_TrimestreGrossesse"/>
        
        
    </phase>

    
       


    <pattern id="variables">
        <let name="enteteHL7France" value="'2.16.840.1.113883.2.8.2.1'"/>
        
        <let name="commonTemplate" value="'1.2.250.1.213.1.1.1.1'"/>
        
        <let name="XDS-SD" value="'1.3.6.1.4.1.19376.1.2.20'"/>
        
        <let name="OIDphysique" value="'1.2.250.1.71.4.2.1'"/>
        
        <let name="OIDmorale" value="'1.2.250.1.71.4.2.2'"/>
        
        <let name="OIDINS-c" value="'1.2.250.1.213.1.4.2'"/>
        
        
        
        <let name="jdv_typeCode" value="'../jeuxDeValeurs/CI-SIS_jdv_typeCode.xml'"/>   
        <let name="jdv_practiceSettingCode" value="'../jeuxDeValeurs/CI-SIS_jdv_practiceSettingCode.xml'"/>  
        <let name="jdv_healthcareFacilityTypeCode" value="'../jeuxDeValeurs/CI-SIS_jdv_healthcareFacilityTypeCode.xml'"/>  
        <let name="jdv_authorSpecialty" value="'../jeuxDeValeurs/CI-SIS_jdv_authorSpecialty.xml'"/>  
        <let name="jdv_observationInterpretation" value="'../jeuxDeValeurs/CI-SIS_jdv_observationInterpretation.xml'"/>
        <let name="jdv_HealthStatusCodes" value="'../jeuxDeValeurs/CI-SIS_jdv_HealthStatusCodes.xml'"/>
        <let name="jdv_ClinicalStatusCodes" value="'../jeuxDeValeurs/CI-SIS_jdv_ClinicalStatusCodes.xml'"/>
        <let name="jdv_ProblemCodes" value="'../jeuxDeValeurs/CI-SIS_jdv_ProblemCodes.xml'"/>
        <let name="jdv_AllergyAndIntoleranceCodes" value="'../jeuxDeValeurs/CI-SIS_jdv_AllergyAndIntoleranceCodes.xml'"/>
        <let name="jdv_OBP_IssueGrossesse" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_IssueGrossesse.xml'"/>
        <let name="jdv_OBP_StaticSAPActiveProblem" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_StaticSAPActiveProblem.xml'"/>
        <let name="jdv_OBP_EtatPérinée" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_EtatPérinée.xml'"/>
        <let name="jdv_OBP_IssueAccouchement" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_IssueAccouchement.xml'"/>
        <let name="jdv_OBP_EtatNaissance" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_EtatNaissance.xml'"/>
        <let name="jdv_OBP_TranfertMutation" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TranfertMutation.xml'"/>
        <let name="jdv_GroupeRhesus" value="'../jeuxDeValeurs/CI-SIS_jdv_GroupeRhesus.xml'"/>
        <let name="jdv_OBP_AnomalieCroissance" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_AnomalieCroissance.xml'"/>
        <let name="jdv_OBP_AnomalieConstitutionnelle" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_AnomalieConstitutionnelle.xml'"/>
        <let name="jdv_OBP_HTAGravidique" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_HTAGravidique.xml'"/>
        <let name="jdv_OBP_DiabeteGrossesse" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_DiabeteGrossesse.xml'"/>
        <let name="jdv_OBP_InfectUrinaire" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_InfectUrinaire.xml'"/>
        <let name="jdv_OBP_InfectCervicoVaginale" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_InfectCervicoVaginale.xml'"/>
        <let name="jdv_OBP_TrimestreGrossesse" value="'../jeuxDeValeurs/CI-SIS_jdv_OBP_TrimestreGrossesse.xml'"/>

    </pattern>
</schema>