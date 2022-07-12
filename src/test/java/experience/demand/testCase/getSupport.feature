@GetSupport
Feature: [POST] - Get Support

  Background:
    * url baseXpeUrl
    * def endPoint = 'web/seo/getSupport'
    * def requestBody = read('classpath:experience/demand/requestTemplate/getSupport.json')
    * def contentType = 'application/json'

    Scenario: Get SEO data on Product Detail Page
    # SEO data should be returned when call getSupport with entity ID and request page type = "PRODUCT_DETAIL_PAGE"
    # Product name: 'Hendro's Exclusive - Hendro Theme Park'
      Given path baseXpePath, endPoint
      And header Origin = origin
      And header Content-type = contentType
      * set requestBody
        | path                    | value                   |
        | data.entityId           | '5892288859455'         |
        | data.requestPageType    | 'PRODUCT_DETAIL_PAGE'   |

      * print requestBody
      And request requestBody
      When method POST
      Then status 200
      * print response

  Scenario: Get SEO data on Landing Page
    # SEO data should be returned when call getSupport with entity type = "GEO" and request page type = "LANDING_PAGE"
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-type = contentType
    * set requestBody
      | path                    | value           |
      | data.entityId           | '0'             |
      | data.entityType         | 'GEO'           |
      | data.requestPageType    | 'LANDING_PAGE'  |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Get SEO data on Chain Page
    # SEO data should be returned when call getSupport with entity ID, entity type = "PRODUCT_CHAIN" and request page type = "PRODUCT_CHAIN_PAGE"
    # Chain name: 'Hendro's Exclusive'
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-type = contentType
    * set requestBody
      | path                    | value                     |
      | data.entityId           | '6566996'                 |
      | data.entityType         | 'PRODUCT_CHAIN'           |
      | data.requestPageType    | 'PRODUCT_CHAIN_PAGE'      |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response