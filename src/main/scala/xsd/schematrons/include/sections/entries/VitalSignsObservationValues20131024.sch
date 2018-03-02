<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ VitalSignsObservationValues20131024.sch ]O@%#o>>=-
    
    Teste la conformité des valeurs portées par l'élément "Vital Signs Observation" 1.3.6.1.4.1.19376.1.5.3.1.4.13.2)
    aux spécifications d'IHE PCC v3.0

    
    Historique :
    24/10/2013 : CRI : Création    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="VitalSignsObservationValues-errors">
    <title>IHE PCC v3.0 Vital Signs Observation</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.2"]'>
       

        <!-- vérifier le codage correct de l'organizer -->
        <assert test='cda:code[@code ="3141-9" or
            @code ="8302-2" or
            @code ="9279-1" or
            @code ="8867-4" or
            @code ="2710-2" or
            @code ="8480-6" or
            @code ="8462-4" or
            @code ="8310-5" or
            @code ="8306-3" or
            @code ="8287-5" or
            @code ="41909-3" 
            ]'>
            [VitalSignsObservationValues] Le codage de l'élément 'Vital Signs Organizer' doit être 'F-03400'.           
        </assert>
        
        <!-- Type PQ des données Vital Signs -->
        <assert test='cda:value[@xsi:type="PQ"]'>
            [VitalSignsObservationValues] La mesure d'un signe vital utilise le type de données PQ.
        </assert>
        <!-- Poids (Mesuré) -->
        <assert test='not(cda:code[@code="3141-9"]) or
            (cda:code[@code="3141-9"] and
            cda:value[@unit="kg" or @unit="g"])'>
            [VitalSignsObservationValues] La mesure du poids (3141-9) 
            est un nombre indénombrable s'exprimant en grammes (g) ou en kilogrammes (kg).
        </assert>        
        <!-- Fréquence respiratoire -->
        <assert test='not(cda:code[@code="9279-1"]) or
            (cda:code[@code="9279-1"] and
            cda:value[@unit="/min"])'>
            [VitalSignsObservationValues] La mesure de la fréquence respiratoire (9279-1) 
            est un nombre indénombrable s'exprimant en min-1 (/min).
        </assert>
        <!-- Fréquence cardiaque -->
        <assert test='not(cda:code[@code="8867-4"]) or
            (cda:code[@code="8867-4"] and
            cda:value[@unit="/min"])'>
            [VitalSignsObservationValues] La mesure de la fréquence cardiaque (8867-4) 
            est un nombre indénombrable s'exprimant en min-1 (/min).
        </assert>
        <!-- Saturation en oxygène -->
        <assert test='not(cda:code[@code="2710-2"]) or
            (cda:code[@code="2710-2"] and
            cda:value[@unit="%"])'>
            [VitalSignsObservationValues] La mesure de la saturation en oxygène (2710-2)
            est un nombre indénombrable s'exprimant en pourçentage (%).
        </assert>
        <!-- Pression artérielle systolique -->
        <assert test='not(cda:code[@code="8480-6"]) or
            (cda:code[@code="8480-6"] and
            cda:value[@unit="mm[Hg]"])'>
            [VitalSignsObservationValues] La mesure de la pression artérielle systolique (8480-6)
            est un nombre indénombrable s'exprimant en millimètres de mercure (mm[Hg]).
        </assert>
        <!-- Pression artérielle diastolique -->
        <assert test='not(cda:code[@code="8462-4"]) or
            (cda:code[@code="8462-4"] and
            cda:value[@unit="mm[Hg]"])'>
            [VitalSignsObservationValues] La mesure de la pression artérielle diastolique (8462-4)
            est un nombre indénombrable s'exprimant en millimètres de mercure (mm[Hg]).
        </assert>
        <!-- Température corporelle -->
        <assert test='not(cda:code[@code="8310-5"]) or
            (cda:code[@code="8310-5"] and
            cda:value[@unit="Cel" or @unit="[degF]"])'>
            [VitalSignsObservationValues] La mesure de la Température corporelle (8310-5)
            est un nombre indénombrable s'exprimant en degrés Celsius (Cel) ou en degré Fahrenheit ([degF]).
        </assert>
        <!-- Taille (Mesurée) -->
        <assert test='not(cda:code[@code="8302-2"]) or
            (cda:code[@code="8302-2"] and
            cda:value[@unit="m" or 
            @unit="cm" or
            @unit="[in_us]" or
            @unit="[in_uk]"
            ])'>
            [VitalSignsObservationValues] La mesure de la Taille (8302-2)
            est un nombre indénombrable s'exprimant en degrés mètres (m), en centimètres (cm),
            en inches US ([in_us]) ou en inches UK [in_uk].
        </assert>
        <!-- Périmètre crânien (Mesuré) -->
        <assert test='not(cda:code[@code="8287-5"]) or
            (cda:code[@code="8287-5"] and
            cda:value[@unit="m" or 
            @unit="cm" or
            @unit="[in_us]" or
            @unit="[in_uk]"
            ])'>
            [VitalSignsObservationValues] La mesure du Périmètre crânien (8287-5)
            est un nombre indénombrable s'exprimant en degrés mètres (m), en centimètres (cm),
            en inches US ([in_us]) ou en inches UK [in_uk].
        </assert>
        <!-- Poids corporel (Mesuré) -->
        <assert test='not(cda:code[@code="3141-9"]) or
            (cda:code[@code="3141-9"] and
            cda:value[@unit="kg" or 
            @unit="g" or
            @unit="[lb_av]" or
            @unit="[oz_av]"
            ])'>
            [VitalSignsObservationValues] La mesure du Poids corporel (3141-9)
            est un nombre indénombrable s'exprimant en kilogrammes (kg), en grammes (g),
            en livres avoirdupois ([lb_av]) ou en onces avoirdupois [oz_av].
        </assert>
    </rule>
    

</pattern>
