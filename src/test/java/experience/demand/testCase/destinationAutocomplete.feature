@Autocomplete
Feature: [POST] - Destination Autocomplete

  Background:
    * url baseXpeUrl
    * def endPoint = 'destinationAutocomplete'
    * def requestBody = read('classpath:experience/demand/requestTemplate/destinationAutocomplete.json')
    * def contentType = 'application/json'

    Scenario: Get destination autocomplete result (with search query)
      # Destination autocomplete result should be returned when call destinationAutocomplete with search query
      Given path baseXpePath, endPoint
      And header Origin = origin
      And header Content-type = contentType
      * set requestBody
        | path                                 |  value                  |
        | data.query                           |  'jakarta'              |

      * print requestBody
      And request requestBody
      When method POST
      Then status 200
      * print response