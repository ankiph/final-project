Feature: [POST] - detail

  Background:
    * url baseXpeUrl
    * def endPoint = 'detail'
  Scenario: Experience product details should be returned when call detail
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/detail.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Experience product details should be returned when call detail with currency
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/detail.json')
    * set requestBody
      | path                                 |  value                  |
      | data.experienceId                    |  '5892288859455'        |
      | data.currency                        |  'SGD'                  |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response