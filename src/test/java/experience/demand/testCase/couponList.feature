Feature: [POST] - couponList

  Background:
    * url baseXpeUrl
    * def endPoint = 'couponList'

  Scenario: Coupon list should be returned when call couponList
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/couponList.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Coupon list should be returned when call couponList with currency
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/couponList.json')
    * set requestBody
      | path                                 |  value                  |
      | data.experienceId                    |  '9228238313272'        |
      | data.ticketId                        |  '922823831327200892'   |
      | data.currency                        |  'SGD'                  |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response