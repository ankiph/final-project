@ignore
Feature: Onboard new supplier, product, and item


  Background:
#    * def tempData = []
#    * def appendSupplierData = read('classpath:utils/appendSupplierData.js')
    * def appendTicketData = read('classpath:experience/demand/appendTicketData.js')
#    * def constructAllotment = read('classpath:utils/constructAllotment.js')

  Scenario: Search Modal to PD

#===== Get Product ID from Autocomplete ================================

    * def getNewExperienceID = callonce read('classpath:experience/demand/testCase/autocomplete.feature')
    * def newExperienceID = getNewExperienceID.response.data.groups[0].items[0].link.experienceId
    * print "New Experience ID:" + newExperienceID

#===== Get Ticket ID from Ticket List ================================

    * def getNewTicketID = callonce read('classpath:experience/demand/testCase/ticketList.feature') { experienceId: '#(newExperienceID)' }
    * def ticketData = getNewTicketID.response.data
#    * def ticketDataAppended = appendTicketData (ticketData)
#    * print ticketDataAppended
    * def newTicketID = getNewTicketID.response.data.ticketTypeDisplays[0].experienceTicketId
    * print "New Ticket ID:" + newTicketID

#  #===== Get Booking Form ID from Booking Page ================================
#
#    * def getBookingData = callonce read('classpath:experience/demand/testCase/bookingPage.feature') ticketDataAppended
#    * def bookingFormId = getBookingData.response.trackingSpec.bookingFormId
#    * print "Booking Form ID:" + bookingFormId

#  #===== Create new Supplier ================================
#
#    * def createNewSupplierResult = callonce read('classpath:src/test/java/xxt/supplier/testCase/createSupplier.feature')
#    * def newSupplierId = createNewSupplierResult.response.data.value
#    * print "New Supplier Id:" + newSupplierId
#
##=====  Get Supplier Info ==================================
#
#    * def getSupplierInfoResult = callonce read('classpath:src/test/java/xxt/supplier/testCase/getSupplierInfo.feature') { config_supplierId: '#(newSupplierId)' }
#    * def supplierData = getSupplierInfoResult.response.data
#    * def supplierDataAppended = appendSupplierData (supplierData)