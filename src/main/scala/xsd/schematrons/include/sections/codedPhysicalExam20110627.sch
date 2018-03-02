<?xml version="1.0" encoding="UTF-8"?>



<!--                  -=<<o#%@O[ codedPhysicalExam.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Coded Physical Exam" (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1)
    aux spécifications d'IHE PCC v3.0
    Aucune des sous-sections décrites dans PCC ne sont obligatoires pour cette section.
    
    La présence obligatoire d'une sous-section doit être exprimée au niveau d'un schematron
    dédié à un volet spécifique (par exemple CS8codedPhysicalExam.sch) qui sera appelé et activé
    dans le schematron général du projet.
    Les sous-sections pouvant être rendues obligatoires sont indiqués ici sous formes de commentaires
    
    Historique :
    25/07/11 : CRI : Création
    14/11/16 : NMA : Suppression du test de conformité CSE et changement du message d'erreur de ' Erreur de Conformité au volet CSE' à ' Erreur de Conformité PCC'
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="codedPhysicalExam-errors">
    <title>IHE PCC v3.0 Physical Exam Section - errors validation phase</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'> 
        <!-- Verifier que le templateId est utilisé à bon escient -->        
        <assert test='../cda:section'> 
            Erreur de Conformité PCC: 'Coded physical Exam' ne peut être utilisé que comme section.
        </assert> 
        <!-- Vérifier que le templateId parent est bien présent. --> 
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15"]'> 
            Erreur de Conformité PCC: L'OID du template parent de la section 'Coded physical Exam' est absent. 
        </assert> 
       <!-- <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.3.24"]'> 
            Erreur de Conformité au volet CSE: L'OID du template parent de la section 'Coded physical Exam' est absent. 
        </assert>-->
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "29545-1"]'> 
            Erreur de Conformité PCC: Le code de la section 'Coded physical Exam' doit être '29545-1'
        </assert> 
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            Erreur de Conformité PCC: L'élément 'codeSystem' de la section 'Coded physical exam' doit être codé dans la nomenclature LOINC 
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <!-- Coded Vital Signs -->
        <!-- 
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section'Coded Vital Signs'.
        </assert>
        -->
        
        <!-- General Appearance -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.16"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'General Appearance'.
        </assert> 
        -->
        
        <!-- Visible Implanted Medical Devices -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.48"]'>
        Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section'Visible Implanted Medical Devices'.        
        </assert> 
        -->
        
        <!-- Integumentary System -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.17"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Integumentary System'.
        </assert> 
        -->
        
        <!-- Head -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.18"]'>
        Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Head'.
        </assert> 
        -->
        
        <!-- Eyes -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.19"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Eyes'.
        </assert> 
        -->
        
        <!-- Ears, Nose, Mouth and Throat -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.20"]'>
        Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Ears, Nose, Mouth and Throat'.
        </assert> 
        -->
        
        <!-- Ears -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.21"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Ears'.
        </assert> 
        -->
        
        <!-- Nose -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.22"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Nose'.
            </assert> 
        -->
        
        <!-- Mouth, Throat, and Teeth -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.23"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Mouth, Throat, and Teeth'.
        </assert> 
        -->
        
        <!-- Neck -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.24"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Neck'.
            </assert> 
        -->
        
        <!-- Endocrine System -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.25"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Endocrine System'.
            </assert> 
        -->
        
        <!-- Thorax and Lungs -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.26"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Thorax and Lungs'.
            </assert> 
        -->
        
        <!-- Chest Wall -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.27"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Chest Wall'.
            </assert> 
        -->
        
        <!-- Breasts -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.28"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Breasts'.
            </assert> 
        -->
        
        <!-- Heart -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.29"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Heart'.
        </assert> 
        -->
        
        <!-- Respiratory System -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.30"]'>
             Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Respiratory System'.
            </assert> 
        -->
        
        <!-- Abdomen -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.31"]'> 
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Abdomen'.
        </assert> 
        -->
        
        <!-- Lymphatic System -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.32"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Lymphatic System'.
        </assert> 
        -->
        
        <!-- Vessels -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.33"]'> 
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Vessels.
            </assert> 
        -->
        
        <!-- Musculoskeletal System -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.34"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Musculoskeletal System'.
        </assert> 
        -->
        
        <!-- Neurologic System -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.35"]'> 
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Neurologic System'.
        </assert>
        -->
        
        <!-- Genitalia -->
        <!--
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.36"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Genitalia'.
        </assert>
        -->
        
        <!-- Rectum -->
        <!-- 
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.37"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Rectum'.
            </assert> 
        -->
        
        <!-- Extremeties -->
        <!--
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1"]'>
        Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Extremeties'.
        </assert> 
        -->
        
    </rule>
</pattern>