<?xml version="1.0" encoding="UTF-8"?>
<!--
  Title : cda_asip.xsl / headers.xsl
  Version : 1.1.1
  Date de mise à jour 16/06/2015
  This StyleSheet is based on the StyleSheet "Modular CDA XSL StyleSheet (cda_modular.xsl)" made by Alchuler Associates LCC.
  The original StyleSheet has been modified by ASIP Santé (http://www.asipsante.fr) in order to :
  - Translate the labels from english to french
  - Edit supplementary informations
  - Detect a Xades envelopping signature of a Clinical Document
  - add comments in case of impossibility to edit pdf files in nonXMLBody and within structuredBody with IE/EDGE and Firefox 3.x
  
  
  Below is the original declaration of Alschuler Associates LCC
  Title: Modular CDA XSL StyleSheet
  Original Filename: headers.xsl 
  Version: 3.0
  Revision History: 8/12/09 Jingdong Li updated 
  Specification: ANSI/HL7 CDA, R2-2005  
  The current version and documentation are available at www.alschulerassociates.com/cda/?topic=cda-xsl. 
  We welcome feedback to tools@alschulerassociates.com
  The stylesheet is the cumulative work of several developers; the most significant prior milestones were the foundation work from HL7 
  Germany and Finland (Tyylitiedosto) and HL7 US (Calvin Beebe), and the presentation approach from Tony Schaller, medshare GmbH provided at IHIC 2009. 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:n1="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:include href="utility.xsl"/>
  <!-- header elements -->
  <xsl:template name="documentGeneral">
    <br/>
    <table class="header_table">
      <tbody>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Identifiant du document</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-id">
              <xsl:with-param name="id" select="n1:id"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Type de document</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-code">
              <xsl:with-param name="code" select="n1:code"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Date de création</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-time">
              <xsl:with-param name="datetime" select="n1:effectiveTime"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Domaine</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-realmCode">
              <xsl:with-param name="realmCode" select="n1:realmCode"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Référence au modèle CDA</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-typeId">
              <xsl:with-param name="typeId" select="n1:typeId"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Conformité</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:for-each select="n1:templateId">
              <xsl:call-template name="show-templateId"> </xsl:call-template>
              <br/>
            </xsl:for-each>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Langue principale</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-languageCode">
              <xsl:with-param name="languageCode" select="n1:languageCode"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Identifiant du lot de versions</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:call-template name="show-id">
              <xsl:with-param name="id" select="n1:setId"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <td width="20%" bgcolor="#3399ff">
            <span class="td_label">
              <xsl:text>Numéro de version</xsl:text>
            </span>
          </td>
          <td width="80%">
            <xsl:value-of select="n1:versionNumber/@value"/>
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:template>
  <!-- confidentiality -->
  <xsl:template name="confidentiality">
    <xsl:if test="n1:confidentialityCode">
      <br/>
      <table class="header_table">
        <tbody>
          <tr>
            <td width="20%" bgcolor="#3399ff">
              <span class="td_label">
                <xsl:text>Niveau de confidentialité</xsl:text>
              </span>
            </td>
            <td width="80%">
              <xsl:choose>
                <xsl:when test="n1:confidentialityCode/@code  = &apos;N&apos;">
                  <xsl:text>Normal</xsl:text>
                </xsl:when>
                <xsl:when test="n1:confidentialityCode/@code  = &apos;R&apos;">
                  <xsl:text>Restreint</xsl:text>
                </xsl:when>
                <xsl:when test="n1:confidentialityCode/@code  = &apos;V&apos;">
                  <xsl:text>Très restreint</xsl:text>
                </xsl:when>
              </xsl:choose>
              <xsl:if test="n1:confidentialityCode/n1:originalText">
                <xsl:text> </xsl:text>
                <xsl:value-of select="n1:confidentialityCode/n1:originalText"/>
              </xsl:if>
            </td>
          </tr>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- author -->
  <xsl:template name="author">
    <xsl:if test="n1:author">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:author/n1:assignedAuthor">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Auteur</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:choose>
                  <xsl:when test="n1:assignedPerson/n1:name">
                    <xsl:call-template name="show-name">
                      <xsl:with-param name="name" select="n1:assignedPerson/n1:name"/>
                    </xsl:call-template>
                    <xsl:if test="n1:representedOrganization">
                      <xsl:text>, </xsl:text>
                      <xsl:call-template name="show-name">
                        <xsl:with-param name="name" select="n1:representedOrganization/n1:name"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:when test="n1:assignedAuthoringDevice/n1:softwareName">
                    <xsl:value-of select="n1:assignedAuthoringDevice/n1:softwareName"/>
                  </xsl:when>
                  <xsl:when test="n1:representedOrganization">
                    <xsl:call-template name="show-name">
                      <xsl:with-param name="name" select="n1:representedOrganization/n1:name"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="n1:representedOrganization/n1:id">
                      <xsl:call-template name="show-id"/>
                      <br/>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="n1:representedOrganization/n1:id">
                  <br/>
                  <xsl:call-template name="show-idName"/>
                </xsl:for-each>
              </td>
            </tr>
            <xsl:for-each select="n1:code">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Profession/spécialité</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="show-code">
                    <xsl:with-param name="code" select="."/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:for-each>
            <!--  <xsl:if test="n1:representedOrganization/n1:addr | n1:representedOrganization/n1:telecom"> -->
            <xsl:if test="n1:addr | n1:telecom">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Coordonnées</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="show-contactInfo">
                    <!--  <xsl:with-param name="contact" select="n1:representedOrganization"/> -->
                    <xsl:with-param name="contact" select="."/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!--  authenticator -->
  <xsl:template name="authenticator">
    <xsl:if test="n1:authenticator">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:authenticator">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Approbateur</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:call-template name="show-name">
                  <xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
                </xsl:call-template>
                <xsl:if test="n1:assignedEntity/n1:representedOrganization">
                  <xsl:text>, </xsl:text>
                  <xsl:call-template name="show-name">
                    <xsl:with-param name="name"
                      select="n1:assignedEntity/n1:representedOrganization/n1:name"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:for-each select="n1:assignedEntity/n1:id">
                  <br/>
                  <xsl:call-template name="show-idName"/>
                </xsl:for-each>
                <br/>
                <xsl:text>Approuvé le : </xsl:text>
                <xsl:call-template name="show-time">
                  <xsl:with-param name="datetime" select="n1:time"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  <xsl:if test="n1:assignedEntity/n1:representedOrganization/n1:addr | n1:assignedEntity/n1:representedOrganization/n1:telecom"> -->
            <xsl:if test="n1:assignedEntity/n1:addr | n1:assignedEntity/n1:telecom">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Coordonnées</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="show-contactInfo">
                    <!-- <xsl:with-param name="contact" select="n1:assignedEntity/n1:representedOrganization"/> -->
                    <xsl:with-param name="contact" select="n1:assignedEntity"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- legalAuthenticator -->
  <xsl:template name="legalAuthenticator">
    <xsl:if test="n1:legalAuthenticator">
      <br/>
      <table class="header_table">
        <tbody>
          <tr>
            <td width="20%" bgcolor="#3399ff">
              <span class="td_label">
                <xsl:text>Signataire légal</xsl:text>
              </span>
            </td>
            <td width="80%">
              <xsl:call-template name="show-assignedEntity">
                <xsl:with-param name="asgnEntity" select="n1:legalAuthenticator/n1:assignedEntity"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="show-sig">
                <xsl:with-param name="sig" select="n1:legalAuthenticator/n1:signatureCode"/>
              </xsl:call-template>
              <xsl:if test="n1:legalAuthenticator/n1:time/@value">
                <xsl:text> le </xsl:text>
                <xsl:call-template name="show-time">
                  <xsl:with-param name="datetime" select="n1:legalAuthenticator/n1:time"/>
                </xsl:call-template>
              </xsl:if>
            </td>
          </tr>
          <!-- <xsl:if test="n1:legalAuthenticator/n1:assignedEntity/n1:representedOrganization/n1:addr | n1:legalAuthenticator/n1:representedOrganization/n1:assignedEntity/n1:telecom"> -->
          <xsl:if
            test="n1:legalAuthenticator/n1:assignedEntity/n1:addr | n1:legalAuthenticator/n1:assignedEntity/n1:telecom">
            <tr>
              <td bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Coordonnées</xsl:text>
                </span>
              </td>
              <td>
                <xsl:call-template name="show-contactInfo">
                  <!-- <xsl:with-param name="contact" select="n1:legalAuthenticator/n1:assignedEntity/n1:representedOrganization"/> -->
                  <xsl:with-param name="contact" select="n1:legalAuthenticator/n1:assignedEntity"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- dataEnterer -->
  <xsl:template name="dataEnterer">
    <xsl:if test="n1:dataEnterer">
      <br/>
      <table class="header_table">
        <tbody>
          <tr>
            <td width="20%" bgcolor="#3399ff">
              <span class="td_label">
                <xsl:text>Rédacteur</xsl:text>
              </span>
            </td>
            <td width="80%">
              <xsl:call-template name="show-assignedEntity">
                <xsl:with-param name="asgnEntity" select="n1:dataEnterer/n1:assignedEntity"/>
              </xsl:call-template>
              <xsl:for-each select="n1:dataEnterer/n1:assignedEntity/n1:id">
                <br/>
                <xsl:call-template name="show-idName"/>
              </xsl:for-each>
              <br/>
              <xsl:text>Rédigé le : </xsl:text>
              <xsl:call-template name="show-time">
                <xsl:with-param name="datetime" select="n1:dataEnterer/n1:time"/>
              </xsl:call-template>
            </td>
          </tr>
          <!-- <xsl:if test="n1:dataEnterer/n1:assignedEntity/n1:representedOrganization/n1:addr | n1:dataEnterer/n1:assignedEntity/n1:representedOrganization/n1:telecom"> -->
          <xsl:if
            test="n1:dataEnterer/n1:assignedEntity/n1:addr | n1:dataEnterer/n1:assignedEntity/n1:telecom">
            <tr>
              <td bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Coordonnées</xsl:text>
                </span>
              </td>
              <td>
                <xsl:call-template name="show-contactInfo">
                  <!-- <xsl:with-param name="contact" select="n1:dataEnterer/n1:assignedEntity/n1:representedOrganization"/> -->
                  <xsl:with-param name="contact" select="n1:dataEnterer/n1:assignedEntity"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- componentOf -->
  <xsl:template name="componentof">
    <xsl:if test="n1:componentOf">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:componentOf/n1:encompassingEncounter">
            <xsl:if test="n1:id">
              <tr>
                <td width="20%" bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Identifiant de la rencontre</xsl:text>
                  </span>
                </td>
                <td width="30%">
                  <xsl:call-template name="show-id">
                    <xsl:with-param name="id" select="n1:id"/>
                  </xsl:call-template>
                </td>
                <xsl:if test="n1:code">
                  <td width="15%" bgcolor="#3399ff">
                    <span class="td_label">
                      <xsl:text>Type</xsl:text>
                    </span>
                  </td>
                  <td>
                    <xsl:call-template name="show-code">
                      <xsl:with-param name="code" select="n1:code"/>
                    </xsl:call-template>
                  </td>
                </xsl:if>
              </tr>
            </xsl:if>
            <xsl:if test="n1:effectiveTime">
              <tr>
                <td width="20%" bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Période de la rencontre</xsl:text>
                  </span>
                </td>
                <td width="80%" colspan="3">
                    <xsl:if test="n1:effectiveTime/@value">
                      <xsl:text>&#160;Date &amp; heure : &#160;</xsl:text>
                      <span style="font-weight:bold; ">
                        <xsl:call-template name="show-time">
                          <xsl:with-param name="datetime" select="n1:effectiveTime"/>
                        </xsl:call-template>
                      </span>
                    </xsl:if>
                    <xsl:if test="n1:effectiveTime/n1:low">
                      <xsl:text>&#160;Début : &#160;</xsl:text>
                      <span style="font-weight:bold; ">
                        <xsl:call-template name="show-time">
                          <xsl:with-param name="datetime" select="n1:effectiveTime/n1:low"/>
                        </xsl:call-template>
                      </span>
                    </xsl:if>
                    <xsl:if test="n1:effectiveTime/n1:high">
                      <xsl:text> ; Fin : </xsl:text>
                      <span style="font-weight:bold; ">
                        <xsl:call-template name="show-time">
                          <xsl:with-param name="datetime" select="n1:effectiveTime/n1:high"/>
                        </xsl:call-template>
                      </span>
                    </xsl:if>
                 </td>
              </tr>
            </xsl:if>
            <xsl:if test="n1:location/n1:healthCareFacility">
              <tr>
                <td width="20%" bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Lieu de la rencontre</xsl:text>
                  </span>
                </td>
                <td width="80%" colspan="3">
                  <xsl:choose>
                    <xsl:when test="n1:location/n1:healthCareFacility/n1:location/n1:name">
                      <xsl:call-template name="show-name">
                        <xsl:with-param name="name"
                          select="n1:location/n1:healthCareFacility/n1:location/n1:name"/>
                      </xsl:call-template>
                      <xsl:for-each
                        select="n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name">
                        <xsl:text> of </xsl:text>
                        <xsl:call-template name="show-name">
                          <xsl:with-param name="name"
                            select="n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name"/>
                        </xsl:call-template>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="n1:location/n1:healthCareFacility/n1:code">
                      <xsl:call-template name="show-code">
                        <xsl:with-param name="code"
                          select="n1:location/n1:healthCareFacility/n1:code"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:if test="n1:location/n1:healthCareFacility/n1:id">
                        <xsl:text>id: </xsl:text>
                        <xsl:for-each select="n1:location/n1:healthCareFacility/n1:id">
                          <xsl:call-template name="show-id">
                            <xsl:with-param name="id" select="."/>
                          </xsl:call-template>
                        </xsl:for-each>
                      </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="n1:responsibleParty">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Responsabilité médicale</xsl:text>
                  </span>
                </td>
                <td width="80%" colspan="3">
                  <xsl:call-template name="show-assignedEntity">
                    <xsl:with-param name="asgnEntity" select="n1:responsibleParty/n1:assignedEntity"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
            <xsl:if
              test="n1:responsibleParty/n1:assignedEntity/n1:addr | n1:responsibleParty/n1:assignedEntity/n1:telecom">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Coordonnées</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="show-contactInfo">
                    <xsl:with-param name="contact" select="n1:responsibleParty/n1:assignedEntity"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- custodian -->
  <xsl:template name="custodian">
    <xsl:if test="n1:custodian">
      <br/>
      <table class="header_table">
        <tbody>
          <tr>
            <td width="20%" bgcolor="#3399ff">
              <span class="td_label">
                <xsl:text>Structure productrice</xsl:text>
              </span>
            </td>
            <td width="80%">
              <xsl:choose>
                <xsl:when
                  test="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name">
                  <xsl:call-template name="show-name">
                    <xsl:with-param name="name"
                      select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"
                    />
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:for-each
                    select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:id">
                    <xsl:call-template name="show-id"/>
                    <xsl:if test="position()!=last()">
                      <br/>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:for-each
                select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:id">
                <br/>
                <xsl:call-template name="show-idName"/>
              </xsl:for-each>
            </td>
          </tr>
          <xsl:if
            test="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:addr |             n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:telecom">
            <tr>
              <td bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Coordonnées</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:call-template name="show-contactInfo">
                  <xsl:with-param name="contact"
                    select="n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- documentationOf -->
  <xsl:template name="documentationOf">
    <xsl:if test="n1:documentationOf">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:documentationOf">
            <!--            <xsl:if test="n1:serviceEvent/@classCode and n1:serviceEvent/n1:code"> -->
            <xsl:if test="n1:serviceEvent/n1:code">
              <xsl:variable name="displayName">
                <xsl:call-template name="show-actClassCode">
                  <xsl:with-param name="clsCode" select="n1:serviceEvent/@classCode"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$displayName">
                <tr>
                  <td width="20%" bgcolor="#3399ff">
                    <span class="td_label">
                      <!-- <xsl:call-template name="firstCharCaseUp">
                        <xsl:with-param name="data" select="$displayName"/>
                        </xsl:call-template> -->
                      <xsl:choose>
                        <xsl:when test="n1:serviceEvent/n1:performer">
                          <text>Acte principal documenté</text>
                        </xsl:when>
                        <xsl:otherwise>
                          <text>Acte documenté</text>
                        </xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </td>
                  <td width="80%" colspan="3">
                    <xsl:call-template name="show-code">
                      <xsl:with-param name="code" select="n1:serviceEvent/n1:code"/>
                    </xsl:call-template>
                    <xsl:if test="n1:serviceEvent/n1:effectiveTime">
                      <xsl:choose>
                        <xsl:when test="n1:serviceEvent/n1:effectiveTime/@value">
                          <xsl:text>&#160;le&#160;</xsl:text>
                          <xsl:call-template name="show-time">
                            <xsl:with-param name="datetime"
                              select="n1:serviceEvent/n1:effectiveTime"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="n1:serviceEvent/n1:effectiveTime/n1:low">
                          <xsl:text>&#160;de&#160;</xsl:text>
                          <xsl:call-template name="show-time">
                            <xsl:with-param name="datetime"
                              select="n1:serviceEvent/n1:effectiveTime/n1:low"/>
                          </xsl:call-template>
                          <xsl:if test="n1:serviceEvent/n1:effectiveTime/n1:high">
                            <xsl:text> à </xsl:text>
                            <xsl:call-template name="show-time">
                              <xsl:with-param name="datetime"
                                select="n1:serviceEvent/n1:effectiveTime/n1:high"/>
                            </xsl:call-template>
                          </xsl:if>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:if>
                  </td>
                </tr>
              </xsl:if>
            </xsl:if>
            <xsl:for-each select="n1:serviceEvent/n1:performer">
              <xsl:variable name="displayName">
                <xsl:call-template name="show-participationType">
                  <xsl:with-param name="ptype" select="@typeCode"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:if test="n1:functionCode/@code">
                  <xsl:text>(</xsl:text>
                  <xsl:call-template name="show-participationFunction">
                    <xsl:with-param name="pFunction" select="n1:functionCode/@code"/>
                  </xsl:call-template>
                  <xsl:text>)</xsl:text>
                </xsl:if>
              </xsl:variable>
              <tr>
                <td width="20%" bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:call-template name="firstCharCaseUp">
                      <xsl:with-param name="data" select="$displayName"/>
                    </xsl:call-template>
                  </span>
                </td>
                <td width="80%" colspan="3">
                  <xsl:call-template name="show-assignedEntity">
                    <xsl:with-param name="asgnEntity" select="n1:assignedEntity"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 
              <xsl:if test="n1:assignedEntity/n1:representedOrganization/n1:addr | n1:assignedEntity/n1:representedOrganization/n1:telecom"> -->
              <xsl:if test="n1:assignedEntity/n1:addr | n1:assignedEntity/n1:telecom">
                <tr>
                  <td bgcolor="#3399ff">
                    <span class="td_label">
                      <xsl:text>Coordonnées</xsl:text>
                    </span>
                  </td>
                  <td>
                    <xsl:call-template name="show-contactInfo">
                      <!-- <xsl:with-param name="contact" select="n1:assignedEntity/n1:representedOrganization"/> -->
                      <xsl:with-param name="contact" select="n1:assignedEntity"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- inFulfillmentOf -->
  <xsl:template name="inFulfillmentOf">
    <xsl:if test="n1:inFulfillmentOf">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:inFulfillmentOf">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Références prescriptions</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:for-each select="n1:order">
                  <xsl:for-each select="n1:id">
                    <xsl:call-template name="show-id"/>
                  </xsl:for-each>
                  <xsl:for-each select="n1:code">
                    <br/>
                    <xsl:call-template name="show-code">
                      <xsl:with-param name="code" select="."/>
                    </xsl:call-template>
                  </xsl:for-each>
                  <xsl:for-each select="n1:priorityCode">
                    <br/>
                    <xsl:call-template name="show-code">
                      <xsl:with-param name="code" select="."/>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- informant -->
  <xsl:template name="informant">
    <xsl:if test="n1:informant">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:informant">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:if test="n1:assignedEntity">
                    <xsl:text>PS Informateur</xsl:text>
                  </xsl:if>
                  <xsl:if test="n1:relatedEntity">
                    <xsl:call-template name="show-relatedEntityClass">
                      <xsl:with-param name="clsCode" select="n1:relatedEntity/@classCode"/>
                    </xsl:call-template>
                  </xsl:if>                 
                </span>
              </td>
              <td width="80%">
                <xsl:if test="n1:assignedEntity">
                  <xsl:call-template name="show-assignedEntity">
                    <xsl:with-param name="asgnEntity" select="n1:assignedEntity"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="n1:relatedEntity">
                  <xsl:call-template name="show-relatedEntity">
                    <xsl:with-param name="relatedEntity" select="n1:relatedEntity"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:for-each select="n1:assignedEntity/n1:id">
                  <br/>
                  <xsl:call-template name="show-idName"/>
                </xsl:for-each>
              </td>
            </tr>
            <xsl:choose>
              <xsl:when test="n1:assignedEntity/n1:addr | n1:assignedEntity/n1:telecom">
                <tr>
                  <td bgcolor="#3399ff">
                    <span class="td_label">
                      <xsl:text>Coordonnées</xsl:text>
                    </span>
                  </td>
                  <td>
                    <xsl:if test="n1:assignedEntity">
                      <xsl:call-template name="show-contactInfo">
                        <xsl:with-param name="contact" select="n1:assignedEntity"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="n1:relatedEntity/n1:addr | n1:relatedEntity/n1:telecom">
                <tr>
                  <td bgcolor="#3399ff">
                    <span class="td_label">
                      <xsl:text>Coordonnées</xsl:text>
                    </span>
                  </td>
                  <td>
                    <xsl:if test="n1:relatedEntity">
                      <xsl:call-template name="show-contactInfo">
                        <xsl:with-param name="contact" select="n1:relatedEntity"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- informationRecipient -->
  <xsl:template name="informationRecipient">
    <xsl:if test="n1:informationRecipient">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:informationRecipient">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Destinataire</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:choose>
                  <xsl:when test="n1:intendedRecipient/n1:informationRecipient/n1:name">
                    <xsl:for-each select="n1:intendedRecipient/n1:informationRecipient">
                      <xsl:call-template name="show-name">
                        <xsl:with-param name="name" select="n1:name"/>
                      </xsl:call-template>
                      <xsl:if test="position() != last()">
                        <br/>
                      </xsl:if>
                    </xsl:for-each>
                    <xsl:if test="n1:intendedRecipient/n1:receivedOrganization/n1:name">
                      <xsl:text>, </xsl:text>
                      <xsl:call-template name="show-name">
                        <xsl:with-param name="name"
                          select="n1:intendedRecipient/n1:receivedOrganization/n1:name"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="n1:intendedRecipient">
                      <xsl:for-each select="n1:id">
                        <xsl:call-template name="show-id"/>
                      </xsl:for-each>
                      <xsl:if test="position() != last()">
                        <br/>
                      </xsl:if>
                      <br/>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="n1:intendedRecipient/n1:id">
                  <br/>
                  <xsl:call-template name="show-idName"/>
                </xsl:for-each>
              </td>
            </tr>
            <!-- <xsl:if test="n1:intendedRecipient/n1:receivedOrganization/n1:addr | n1:intendedRecipient/n1:receivedOrganization/n1:telecom"> -->
            <xsl:if test="n1:intendedRecipient/n1:addr | n1:intendedRecipient/n1:telecom">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Coordonnées</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="show-contactInfo">
                    <!-- <xsl:with-param name="contact" select="n1:intendedRecipient/n1:receivedOrganization"/> -->
                    <xsl:with-param name="contact" select="n1:intendedRecipient"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <xsl:template name="participant">
    <xsl:if test="n1:participant">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:participant">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <xsl:variable name="participtRole">
                  <xsl:call-template name="translateRoleAssoCode">
                    <xsl:with-param name="code" select="n1:associatedEntity/@classCode"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$participtRole">
                    <span class="td_label">
                      <xsl:choose>
                        <xsl:when test="@typeCode='REF'">
                          <xsl:text>Prescripteur (</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>Participant (</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:call-template name="firstCharCaseUp">
                        <xsl:with-param name="data" select="$participtRole"/>
                      </xsl:call-template>
                      <xsl:text>)</xsl:text>
                    </span>
                  </xsl:when>
                  <xsl:otherwise>
                    <span class="td_label">
                      <xsl:text>Participant</xsl:text>
                    </span>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td width="80%">
                <xsl:if test="n1:functionCode">
                  <xsl:call-template name="show-code">
                    <xsl:with-param name="code" select="n1:functionCode"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:call-template name="show-associatedEntity">
                  <xsl:with-param name="assoEntity" select="n1:associatedEntity"/>
                </xsl:call-template>
                <xsl:if test="n1:time">
                  <xsl:if test="n1:time/n1:low">
                    <xsl:text> de </xsl:text>
                    <xsl:call-template name="show-time">
                      <xsl:with-param name="datetime" select="n1:time/n1:low"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="n1:time/n1:high">
                    <xsl:text> à </xsl:text>
                    <xsl:call-template name="show-time">
                      <xsl:with-param name="datetime" select="n1:time/n1:high"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="position() != last()">
                  <br/>
                </xsl:if>
              </td>
            </tr>
            <xsl:if test="n1:associatedEntity/n1:addr | n1:associatedEntity/n1:telecom">
              <tr>
                <td bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Coordonnées</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="show-contactInfo">
                    <xsl:with-param name="contact" select="n1:associatedEntity"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- recordTarget -->
  <xsl:template name="recordTarget">
    <table class="header_table">
      <tbody>
        <!-- recordTarget
        <xsl:for-each select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole">
        -->
        <xsl:for-each select="n1:recordTarget/n1:patientRole">
          <xsl:if test="not(n1:id/@nullFlavor)">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Patient</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="show-patient-name">
                  <xsl:with-param name="name" select="n1:patient/n1:name"/>
                </xsl:call-template>
              </td>
            </tr>
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Date de naissance</xsl:text>
                </span>
              </td>
              <td width="30%">
                <span style="font-weight:bold; ">
                  <xsl:call-template name="show-time">
                    <xsl:with-param name="datetime" select="n1:patient/n1:birthTime"/>
                  </xsl:call-template>
                </span>
              </td>
              <td width="15%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Sexe</xsl:text>
                </span>
              </td>
              <td>
                <xsl:for-each select="n1:patient/n1:administrativeGenderCode">
                  <xsl:call-template name="show-gender"/>
                </xsl:for-each>
              </td>
            </tr>
            <xsl:if test="n1:patient/n1:birthplace/n1:place">
              <tr>
                <td width="20%" bgcolor="#3399ff">
                  <span class="td_label">
                    <xsl:text>Lieu de naissance</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:if test="n1:patient/n1:birthplace/n1:place/n1:name">
                    <xsl:call-template name="show-name">
                      <xsl:with-param name="name" select="n1:patient/n1:birthplace/n1:place/n1:name"
                      />
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="n1:patient/n1:birthplace/n1:place/n1:addr">
                    <xsl:if test="n1:patient/n1:birthplace/n1:place/n1:name">
                      <br/>
                    </xsl:if>
                    <xsl:call-template name="show-contactInfo">
                      <xsl:with-param name="contact" select="n1:patient/n1:birthplace/n1:place"/>
                    </xsl:call-template>
                  </xsl:if>
                </td>
              </tr>
            </xsl:if>
            <tr>
              <td bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Coordonnées</xsl:text>
                </span>
              </td>
              <td>
                <xsl:call-template name="show-contactInfo">
                  <xsl:with-param name="contact" select="."/>
                </xsl:call-template>
              </td>
              <td bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Identifiant(s)</xsl:text>
                </span>
              </td>
              <td>
                <xsl:for-each select="n1:id">
                  <xsl:choose>
                    <xsl:when test=" @root = '1.2.250.1.213.1.4.1' ">
                      <xsl:text>INS-A : </xsl:text>
                    </xsl:when>
                    <xsl:when test=" @root = '1.2.250.1.213.1.4.2' ">
                      <xsl:text>INS-C : </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>Autre : </xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:call-template name="show-id"/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:if>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <!-- relatedDocument -->
  <xsl:template name="relatedDocument">
    <xsl:if test="n1:relatedDocument">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:relatedDocument">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Référence document original</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:for-each select="n1:parentDocument">
                  <xsl:for-each select="n1:id">
                    <xsl:call-template name="show-id"/>
                  </xsl:for-each>
                  <br/>
                  <xsl:text>Version : </xsl:text>
                  <xsl:value-of select="n1:versionNumber/@value"/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- authorization (consent) -->
  <xsl:template name="authorization">
    <xsl:if test="n1:authorization">
      <br/>
      <table class="header_table">
        <tbody>
          <xsl:for-each select="n1:authorization">
            <tr>
              <td width="20%" bgcolor="#3399ff">
                <span class="td_label">
                  <xsl:text>Autorisation</xsl:text>
                </span>
              </td>
              <td width="80%">
                <xsl:call-template name="show-code">
                  <xsl:with-param name="code" select="n1:consent/n1:code"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="show-code">
                  <xsl:with-param name="code" select="n1:consent/n1:statusCode"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
  <!-- setAndVersion -->
  <xsl:template name="setAndVersion">
    <xsl:if test="n1:setId and n1:versionNumber">
      <table class="header_table">
        <tbody>
          <tr>
            <td width="20%">
              <xsl:text>Identifiant du lot de versions</xsl:text>
            </td>
            <td colspan="3">
              <xsl:text>Identifiant: </xsl:text>
              <xsl:call-template name="show-id">
                <xsl:with-param name="id" select="n1:setId"/>
              </xsl:call-template>
              <xsl:text>  numéro de version: </xsl:text>
              <xsl:value-of select="n1:versionNumber/@value"/>
            </td>
          </tr>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
