Feature: [POST] - info

  Background:
    * url baseXpeUrl
    * def endPoint = '/search/info'

  Scenario: Filters and information should be returned when call /search/info
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/info.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Filters and information should be returned when call /search/info with currency
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/info.json')
    * set requestBody
      | path                                 |  value                  |
      | data.currency                        |  'SGD'                  |
      | data.basicSearchSpec.searchQuery     |  null                   |
      | data.basicSearchSpec.searchType      |  'ALL_PRODUCTS'         |
      | data.basicSearchSpec.entityId        |  null                   |
      | data.basicSearchSpec.filter          |  null                   |
      | data.basicSearchSpec.geoLocation     |  null                   |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Filters and information should be returned when call /search/info with entity id and searchType = "GEO"
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/info.json')
    * set requestBody
      | path                                 |  value                  |
      | data.currency                        |  'IDR'                  |
      | data.basicSearchSpec.searchQuery     |  null                   |
      | data.basicSearchSpec.searchType      |  'GEO'                  |
      | data.basicSearchSpec.entityId        |  102813                 |
      | data.basicSearchSpec.filter          |  null                   |
      | data.basicSearchSpec.geoLocation     |  null                   |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Filters and information should be returned when call /search/info with geoLocation
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/info.json')
    * set requestBody
      | path                                 |  value                  |
      | data.currency                        |  'IDR'                  |
      | data.basicSearchSpec.searchQuery     |  null                   |
      | data.basicSearchSpec.searchType      |  'NEARBY'               |
      | data.basicSearchSpec.entityId        |  null                   |
      | data.basicSearchSpec.filter          |  null                   |
      | data.basicSearchSpec.geoLocation.lat |  -6.17511               |
      | data.basicSearchSpec.geoLocation.lon |  106.865036             |


    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response