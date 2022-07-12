@Search
Feature: [POST] - softRecommendation

  Background:
    * url baseXpeUrl
    * def endPoint = 'softRecommendation'

  Scenario: product recommendation should be returned when call softRecommendation
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/softRecommendation.json')

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response

  Scenario: Product recommendation should be returned when call softRecommendation with search query and filters
    Given path baseXpePath, endPoint
    And header Origin = origin
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:experience/demand/requestTemplate/softRecommendation.json')
    * set requestBody
      | path                                 |  value                  |
      | data.currency                        |  'IDR'                  |
      | data.sortType                        |  'RELEVANCE'            |
      | data.filters.availabilityFilter      |  []                     |
      | data.filters.durationFilter          |  []                     |
      | data.filters.featureFilter           |  ["FLEXIBOOK"]          |
      | data.filters.geoIdsFilter            |  []                     |
      | data.filters.priceFilter.minPrice    |  20000                  |
      | data.filters.priceFilter.maxPrice    |  200000                 |
      | data.filters.instantVoucherOnly      |  false                  |
      | data.filters.subTypeFilter           |  []                     |
      | data.filters.promoFilterList         |  ["PROMO_1"]            |
      | data.filters.typeFilterList          |  ["BEAUTY_AND_SPA"]     |
      | data.basicSearchSpec.searchQuery     |  'hendro'               |
      | data.basicSearchSpec.searchType      |  'ALL_PRODUCTS'         |
      | data.rowsToReturn                    |  50                     |
      | data.skip                            |  0                      |

    * print requestBody
    And request requestBody
    When method POST
    Then status 200
    * print response