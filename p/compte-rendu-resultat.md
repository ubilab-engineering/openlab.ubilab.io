# Compte rendu de résultat

Ce que dit la norme sur un compte rendu : 

```
5.8.3 Les résultats doivent être lisibles, ne présenter aucune erreur de transcription et être diffusés aux personnes habilitées à recevoir et à utiliser les informations médicales. Le compte rendu doit comprendre, sans y être limité, les renseignements suivants:
* a) l’identification univoque et claire de l’analyse, y compris, le cas échéant, la méthode de mesure;
* b) l’identification du laboratoire ayant édité le compte rendu;
* c) l’identification unique du patient et, si possible, du lieu où il se trouve et la destination du compte rendu;
* d) le nom ou tout autre moyen d’identification unique du prescripteur ainsi que son adresse;
* e) la date et l’heure du prélèvement de l’échantillon primaire, si elles sont disponibles et pertinentes pour les soins prodigués au patient, et l’heure de réception par le laboratoire;
* f) la date et l’heure de la diffusion du compte rendu; si celles-ci ne figurent pas sur le compte rendu, elles doivent pouvoir être obtenues facilement en cas ce besoin;
* g) l’origine ou le type de l’échantillon primaire;
* h) les résultats de l’analyse, consignés en unités SI ou en unités traçables par rapport aux unités SI (voir l’ISO 31), si nécessaire;
* i) les intervalles de référence biologiques, le cas échéant;
* j) l’interprétation des résultats, le cas échéant;
* k) tout autre commentaire (par exemple la qualité ou l’adéquation du spécimen susceptible d’avoir compromis le résultat, les résultats ou interprétations des laboratoires sous-traitants, l’utilisation d’une procédure en cours d’élaboration); il convient que le compte rendu indique les analyses effectuées dans le cadre d’un programme de développement et n’ayant fait l’objet d’aucune exigence spécifique concernant la performance des mesures et, s’il y a lieu, il convient de fournir sur demande des informations sur la limite de détection et l’incertitude de mesure;
* l) l’identification de la personne autorisant la diffusion du compte rendu;
* m) le cas échéant, les résultats initiaux et les résultats corrigés;
n) si possible, la signature ou l’autorisation de la personne vérifiant ou transmettant le compte rendu.
NOTE 1 En se référant à i) et dans certaines circonstances, il peut être approprié de diffuser des listes ou des tableaux spécifiant les intervalles de référence biologiques à tous les utilisateurs des services du laboratoire et sur les sites auxquels les comptes rendus sont adressés.
NOTE 2 Il est possible que des réglementations nationales, régionales et locales exigent que le nom et l’adresse du laboratoire effectuant l’analyse (ou du laboratoire sous-traitant) figurent dans le compte rendu final.
```


NF EN ISO 15189 (SH REF 02), § 5.8
[source](https://github.com/ubilab-engineering/openlab.ubilab.io/blob/master/doc/SH-REF-02.pdf)



## Liste de toutes les informations obligatoires
* Compte Rendu de Resultat (ID Unique)
 * [ ] Laboratoire
   * [ ]  Identifiant laboratoire émetteur 
 * [ ] Patient 
   * [ ] ID SIL
   * [ ] Nom
   * [ ] Nom jeune fille
   * [ ] Prénom 
   * [ ] Date de naissance
   * [ ] ISN
   * [ ] CODE_SECURITE_SOCIALE
 * [ ] Prescripteur
   * [ ] ID SIL
   * [ ] RPPS
   * [ ] ADELI
   * [ ] Nom
   * [ ] Prénom
   * [ ] Adresse
 * [ ] Préleveur
    * [ ] ID SIL
    * [ ] Nom
    * [ ] Prénom
 * [ ] Resultat
    * [ ] Lieu de prise en charge du patient
    * [ ] Destination du compte rendu de résultats
    * [ ] Ligne resultat
        * [ ] intervalle de référence biologique (plusieurs lignes possible)
        * [ ] Interpretation des résultats
        * [ ] Autre commentaire
        * [ ] Date d'obtention du résultat
        * [ ] Validateur
          * [ ] ID SIL
          * [ ] Nom
          * [ ] Prénom
    * [ ] Technique
    * [ ] Automate
    * [ ] Dernier traitement
    * [ ] Indication thérapeutique

 * [ ] Echantillon primaire
    * [ ] Origine de l'echantillon / type
    * [ ] date et heure de prélèvement
    * [ ] date et heure de fin de prélèvement
    * [ ] date et heure d'arrivé au laboratoire

# Integration du format obligatoire avec Ubilab
## Netika (Hprim Santé 2.4)
ne souhaite pas communiquer

## DL Santé (Hprim Santé 2.4)

* [ ] Compte Rendu de Resultat (ID Unique)
 * [ ] Laboratoire
   * [ ]  Identifiant laboratoire émetteur 
 * [ ] Patient 
   * [ ] ID SIL
   * [ ] Nom
   * [ ] Nom jeune fille
   * [ ] Prénom 
   * [ ] Date de naissance
   * [ ] ISN
   * [ ] CODE_SECURITE_SOCIALE
 * [ ] Prescripteur
   * [ ] ID SIL
   * [ ] RPPS
   * [ ] ADELI
   * [ ] Nom
   * [ ] Prénom
   * [ ] Adresse
 * [ ] Préleveur
    * [ ] ID SIL
    * [ ] Nom
    * [ ] Prénom
 * [ ] Resultat
    * [ ] Lieu de prise en charge du patient
    * [x] Destination du compte rendu de résultats
    * [x] Ligne resultat
        * [x] intervalle de référence biologique (plusieurs lignes possible)
        * [ ] Interpretation des résultats
        * [x] Autre commentaire
        * [x] Date d'obtention du résultat
        * [x] Validateur
          * [x] ID SIL
          * [x] Nom
          * [x] Prénom
    * [ ] Technique
    * [ ] Automate
    * [ ] Dernier traitement
    * [ ] Indication thérapeutique

 * [ ] Echantillon primaire
    * [ ] Origine de l'echantillon / type
    * [x] date et heure de prélèvement
    * [x] date et heure de fin de prélèvement
    * [x] date et heure d'arrivé au laboratoire
  
 ## AGFA (Hprim Santé 2.4)
 
 * [ ] Compte Rendu de Resultat (ID Unique)
  * [ ] Laboratoire
    * [ ]  Identifiant laboratoire émetteur 
  * [ ] Patient 
    * [ ] ID SIL
    * [ ] Nom
    * [ ] Nom jeune fille
    * [ ] Prénom 
    * [ ] Date de naissance
    * [ ] ISN
    * [ ] CODE_SECURITE_SOCIALE
  * [ ] Prescripteur
    * [ ] ID SIL
    * [ ] RPPS
    * [ ] ADELI
    * [ ] Nom
    * [ ] Prénom
    * [ ] Adresse
  * [ ] Préleveur
     * [ ] ID SIL
     * [ ] Nom
     * [ ] Prénom
  * [ ] Resultat
     * [ ] Lieu de prise en charge du patient
     * [x] Destination du compte rendu de résultats
     * [x] Ligne resultat
         * [x] intervalle de référence biologique (plusieurs lignes possible)
         * [ ] Interpretation des résultats
         * [x] Autre commentaire
         * [x] Date d'obtention du résultat
         * [x] Validateur
           * [x] ID SIL
           * [x] Nom
           * [x] Prénom
     * [ ] Technique
     * [ ] Automate
     * [ ] Dernier traitement
     * [ ] Indication thérapeutique
 
  * [ ] Echantillon primaire
     * [ ] Origine de l'echantillon / type
     * [x] date et heure de prélèvement
     * [x] date et heure de fin de prélèvement
     * [x] date et heure d'arrivé au laboratoire

# Concerto Online
A Venir

# Histone
A Venir

 
# Documents de références
 
* [Norme CDA R2 niveau 3](http://esante.gouv.fr/sites/default/files/asset/document/ci-sis_contenus_cr-biologie_v1.4.0_20171003.pdf)
* [La norme HL7 2.5](/p/norme/hl7.html)
* [HPRIM Santé 2.4](https://github.com/ubilab-engineering/openlab.ubilab.io/blob/master/doc/HPsante24-modif.pdf)



