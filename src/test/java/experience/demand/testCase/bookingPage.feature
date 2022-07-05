Feature: [POST] - Booking Page

  Background:
    * url baseTrpUrl
    * def endPoint = 'booking/bookingPage'
    * def requestBody = read('classpath:experience/demand/requestTemplate/bookingPage.json')
    * def contentType = 'application/json'

  Scenario: Get all data of Booking Page
    # Booking data should be returned when call bookingPage
    Given path baseTrpPath, endPoint
    And header Origin = origin
    And header Content-Type = contentType
    * set requestBody
      | path                                                                           | value                      |
      | data.selectedProductSpec.experienceBookingPageSpec.experienceId                | config_experienceId        |
      | data.selectedProductSpec.experienceBookingPageSpec.ticketId                    | config_ticketId            |
      | data.selectedProductSpec.experienceBookingPageSpec.selectedDate.month          | 8                          |
      | data.selectedProductSpec.experienceBookingPageSpec.selectedDate.day            | 4                          |
      | data.selectedProductSpec.experienceBookingPageSpec.selectedDate.year           | 2022                       |
      | data.selectedProductSpec.experienceBookingPageSpec.selectedTimeSlot.timeSlotId | 'all_day_pass'             |
      | data.trackingSpec.chainId                                                      | '6566996'                  |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response