@Autocomplete
Feature: [POST] - Autocomplete

  Background:
    * url baseXpeUrl
    * def endPoint = 'autocomplete'
    * def requestBody = read('classpath:experience/demand/requestTemplate/autocomplete.json')
    * def contentType = 'application/json'

  Scenario: Get autocomplete result (with search query)
    # Autocomplete result should be returned when call autocomplete with search query
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path                                 |  value                  |
      | data.query                           |  'hendro'               |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response