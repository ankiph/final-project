Feature: [POST] - createBooking

  Background:
    * url baseTrpUrl
    * def endPoint = '/booking/createBooking'

  Scenario: Get Auth, Booking ID, and Invoice ID
    Given path baseTrpPath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/common/createBooking.json')
    * set requestBody
    | path                                                            | value               |
    | data.selectedProductSpec.experienceBookingPageSpec.experienceId | config_experienceId |
    | data.selectedProductSpec.experienceBookingPageSpec.ticketId     | config_ticketId     |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response