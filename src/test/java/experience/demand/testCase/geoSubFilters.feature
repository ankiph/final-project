@Search
Feature: [POST] - geoSubFilters

  Background:
    * url baseXpeUrl
    * def endPoint = 'geoSubFilters'

  Scenario: Destination list should be returned when call geoSubFilters with search query
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/geoSubFilters.json')
    * set requestBody
      | path                                 |  value                  |
      | data.geoId                           |  null                   |
      | data.searchQuery                     |  'Museum'               |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Destination list should be returned when call geoSubFilters with geo id
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/geoSubFilters.json')
    * set requestBody
      | path                                 |  value                  |
      | data.geoId                           |  102813                 |
      | data.searchQuery                     |  null                   |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response