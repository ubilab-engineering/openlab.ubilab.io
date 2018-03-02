<?xml version="1.0" encoding="UTF-8"?>



<!--                  -=<<o#%@O[ CS8codedPhysicalExam.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Coded Physical Exam" (1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1)
    aux spécifications du volet CS8 (Certificat de santé du 8ème jour) du CI-SIS de l'ASIP Santé 
    concernant le contenu de la section.    
    Sont rendues obligatoires les sous-sections suivantes:
    - Coded Vital Signs (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2)
    - General Appearance (1.3.6.1.4.1.19376.1.5.3.1.1.9.16)
    - Ears (1.3.6.1.4.1.19376.1.5.3.1.1.9.21)-
    - Heart (1.3.6.1.4.1.19376.1.5.3.1.1.9.29)-
    - Abdomen (1.3.6.1.4.1.19376.1.5.3.1.1.9.31)-
    - Musculoskeletal System (1.3.6.1.4.1.19376.1.5.3.1.1.9.34)-
    - Neurologic System (1.3.6.1.4.1.19376.1.5.3.1.1.9.35)-
    - Genitalia (1.3.6.1.4.1.19376.1.5.3.1.1.9.36)-
    - Integumentary System (1.3.6.1.4.1.19376.1.5.3.1.1.9.17)-
    - Eyes (1.3.6.1.4.1.19376.1.5.3.1.1.9.19)-
    - Endocrine System (1.3.6.1.4.1.19376.1.5.3.1.1.9.25)-
    - Respiratory System (1.3.6.1.4.1.19376.1.5.3.1.1.9.30)-
    - Lymphatic System (1.3.6.1.4.1.19376.1.5.3.1.1.9.32)-
    - Mouth, Throat, and Teeth (1.3.6.1.4.1.19376.1.5.3.1.1.9.23)
    
    Historique :
    25/07/11 : CRI : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="CS24codedPhysicalExam-errors">
    <title>ASIP CI-SIS CS24 Physical Exam Section</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'> 
       
        <!-- Coded Vital Signs -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section'Coded Vital Signs'.
        </assert>
        <!-- General Appearance -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.16"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section'General Appearance'.
        </assert>
        <!-- Ears -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.21"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Ears'.
        </assert> 
        <!-- Heart -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.29"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Heart'.
        </assert> 
        <!-- Abdomen -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.31"]'> 
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Abdomen'.
        </assert> 
        <!-- Musculoskeletal System -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.34"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Musculoskeletal System'.
        </assert> 
        <!-- Neurologic System -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.35"]'> 
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Neurologic System'.
        </assert>
        <!-- Genitalia -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.36"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Genitalia'.
        </assert>
        <!-- Integumentary System -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.17"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Integumentary System'.
        </assert>
        <!-- Eyes -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.19"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Eyes'.
        </assert>
        <!-- Endocrine System -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.25"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Endocrine System'.
        </assert>
        <!-- Respiratory System -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.30"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Respiratory System'.
        </assert>
        <!-- Lymphatic System -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.32"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Lymphatic System'.
        </assert>
        <!-- Teeth -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.9.23"]'>
            Erreur de Conformité au volet CSE: La section 'Coded physical exam' ne contient pas de sous-section 'Mouth, Throat, and Teeth'.
        </assert> 
    </rule>
</pattern>