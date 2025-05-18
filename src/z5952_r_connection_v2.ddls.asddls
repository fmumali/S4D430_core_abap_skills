@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connections'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z5952_R_CONNECTION_v2
  as select from /DMO/I_Connection_R
{

  key AirlineID,
  key ConnectionID,

      _Airline._Currency._Text.CurrencyName

      //_Airline._Currency._Text[ Language = 'E' ].CurrencyName

      //_Airline._Currency._Text[ 1: language = 'E' ].CurrencyName
}
where
      AirlineID    = 'AA'
  and ConnectionID = '0017'
