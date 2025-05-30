@AbapCatalog: {
dataMaintenance: #RESTRICTED,
viewEnhancementCategory: [#PROJECTION_LIST],
extensibility.dataSources: [ 'Employee' ],
extensibility.elementSuffix: 'ZEM'
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Querry)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity Z5952_C_EMPLOYEEQUERYP
  with parameters
    p_target_curr : /dmo/currency_code,

    @Environment: {
        systemField: #SYSTEM_DATE
    }
    p_date        : abap.dats
  as select from Z5952_R_Employee as Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,
      _Department.Description   as DepartmentDescription,
      //      _Department._Assistant.LastName         as AssistantName,
      concat_with_space( _Department._Assistant.FirstName,
                         _Department._Assistant.LastName,
                         1 )    as AssistantName,


      case EmployeeId
       when _Department.DepartmentHead
       then 'H'
       when _Department.DepartmentAssistant
       then 'A'
       else ' '
       end                      as EmployeeRole,


      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount            => AnnualSalary,
                           source_currency   => CurrencyCode,
                           target_currency    => $projection.CurrencyCode,
                           exchange_rate_date => $parameters.p_date
                           )    as AnnualSalaryConverted,


      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( $projection.AnnualSalaryConverted as abap.fltp
      )
      / 12.0                    as MonthlySalaryConverted,

      // CurrencyCode,
      // cast( 'USD' as /dmo/currency_code )                           as CurrencyCodeUSD,
      $parameters.p_target_curr as CurrencyCode,
      division( dats_days_between( EntryDate,
                          $parameters.p_date ),
                          365,
                          1)    as CompanyAffiliation,

      /*Association*/
      _Department

}
