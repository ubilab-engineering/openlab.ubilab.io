<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ laboratorySpecialtySection.sch ]O@%#o>>=-
    
    Teste la conformité de la section "Laboratory Specialty Section" aux spécifications d'IHE PCC v3.0
    
    Historique :
    22/10/13 : CRI : Création
    
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="laboratorySpecialtySection-errors">
    <title>Laboratory Specialty Section</title>

        
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.3.2.1"]'> 
            <!-- Verifier que le templateId est utilisé correctement --> 
            <assert test='../cda:section'> 
                [laboratorySpecialtySection] 'Laboratory Specialty Section' ne peut être utilisé que comme section
            </assert> 
            <!-- Vérifier le code de la section --> 
        <assert test='cda:code[
            @code="18716-1" or
            @code="18717-9" or
            @code="18718-7" or
            @code="18719-5" or
            @code="18720-3" or
            @code="18721-1" or
            @code="18722-9" or
            @code="18723-7" or
            @code="18724-5" or
            @code="18725-2" or
            @code="18727-8" or
            @code="18728-6" or
            @code="18767-4" or
            @code="26435-8" or
            @code="26436-6"
            
             
            ]'> 
            [laboratorySpecialtySection] Le code de la section doit faire partie des valeurs prévues pour les examens de biologie             
        </assert> 
        
            <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
                [laboratorySpecialtySection] L'élément 'codeSystem' de la section 
                'immunohématologie' doit être codé dans la nomenclature LOINC (2.16.840.1.113883.6.1)
            </assert> 
            
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.3.1"]'> 
            <!-- Vérifier que la section contient des éléments Laboratory Report Data Processing Entry -->
            [laboratorySpecialtySection] Une section "Laboratory Specialty" doit contenir des entrée de type "Laboratory Report Data Processing Entry"
            </assert> 
        </rule> 
        
    </pattern>