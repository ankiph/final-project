Feature: E2E API Testing


#  Background:
#    * def appendTicketData = read('classpath:experience/demand/appendTicketData.js')

  Scenario: Booking Item from chain page

#===== Get Chain ID from Autocomplete ================================
    * def getNewChainID = callonce read('classpath:experience/demand/testCase/autocomplete.feature')
    * def newChainID = getNewChainID.response.data.groups[0].items[0].link.experienceId
    * print newChainID

#===== Get Entity ID from Chain Page ================================

    * def getNewEntityID = callonce read('classpath:experience/demand/testCase/productChainPage.feature') { config_chainId: '#(newChainID)' }
    * def newEntityID = getNewEntityID.response.data.chainId
    * print newEntityID

#===== Get Experience ID from Chain Page ================================

    * def getNewXpeID = callonce read('classpath:experience/demand/testCase/searchV2.feature@chain') { config_chainEntityId: '#(newEntityID)' }
    * def newXpeID = getNewXpeID.response.data.results[0].experienceId
    * print newXpeID

  #===== Get Product Details from Experience ID ================================

    * def getProductDetails = callonce read('classpath:experience/demand/testCase/detail.feature@e2e') { config_experienceId: '#(newXpeID)' }
    * def newProducts =  getProductDetails.response.data
    * print newProducts

  #===== Get Ticket ID from Experience ID ================================

    * def getNewTicketID = callonce read('classpath:experience/demand/testCase/ticketList.feature') { config_experienceId: '#(newXpeID)' }
    * def newTicketID = getNewTicketID.response.data.ticketTypeDisplays[0].experienceTicketId
    * print newTicketID

#  #===== Get Minimum Price from Ticket List ================================
#
#    * def getNewMinimum = callonce read('classpath:experience/demand/testCase/minimumPrice.feature') { config_experienceId: '#(newXpeID)', config_ticketId: '#(newTicketID)' }
#    * def newMinimumPrice = getNewMinimum.response.data
#    * print newMinimumPrice
#
#  #===== Get Ticket Allotment from Ticket List ================================
#
#    * def getTicketAllotment = callonce read('classpath:experience/demand/testCase/ticketAllotmentInfo.feature') { config_experienceId: '#(newXpeID)', config_ticketId: '#(newTicketID)' }
#    * def newAllotment = getNewMinimum.response.data
#    * print newAllotment

  #===== Get Booking Infos from Booking Page ================================

    * def getBookingPage = callonce read('classpath:experience/demand/testCase/bookingPage.feature') { config_experienceId: '#(newXpeID)', config_ticketId: '#(newTicketID)' }
    * def newBookingPage = getBookingPage.response.data
#    * print newBookingPage

  #===== Get Auth from Create Booking ================================

    * def getCreateBooking = callonce read('classpath:experience/common/createBooking.feature') { config_experienceId: '#(newXpeID)', config_ticketId: '#(newTicketID)' }
    * def newAuth = getCreateBooking.response.data.auth
    * def newBookingID = getCreateBooking.response.data.bookingId
    * def newInvoiceID = getCreateBooking.response.data.invoiceId

  #===== Get Booking Info on payment page ================================

    * def getBookingInfo = callonce read('classpath:experience/demand/testCase/bookingInfo.feature@e2e') { newAuth: '#(newAuth)', newBookingId: '#(newBookingID)', newInvoiceId: '#(newInvoiceID)'  }
    * def newBookingInfo = getBookingInfo.response

