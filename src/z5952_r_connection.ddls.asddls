@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connections'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z5952_R_connection
  as select from /DMO/I_Connection_R
{
  key AirlineID,
  key ConnectionID,

      _Flight.OccupiedSeats

}

where
      AirlineID    = 'LH' //Only one connection
  and ConnectionID = '0400' //Fulfills this filter

// and _Airline.CurrencyCode = 'EUR'
// and _Flight.PlaneType = '747-400'
