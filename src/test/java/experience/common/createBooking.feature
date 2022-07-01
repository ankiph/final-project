Feature: [POST] - createBooking

  Background:
    * url baseTrpUrl
    * def endPoint = '/booking/createBooking'

  Scenario:
    Given path baseTrpPath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/common/createBooking.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response