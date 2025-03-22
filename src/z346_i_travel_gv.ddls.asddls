@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z346_I_TRAVEL_GV
  provider contract transactional_interface
  as projection on Z346_R_TRAVEL_GV
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      
      /* Associations */
      _Agency,
      _Currency,
      _Customer,
      _OverallStatus
}
