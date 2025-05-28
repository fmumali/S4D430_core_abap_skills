@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z5952_C_DepartmentQuery
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    P_DATE        : abap.dats
  as select from Z5952_C_EMPLOYEEQUERYP( p_target_curr: $parameters.p_target_curr, p_date: $parameters.P_DATE )
{
  DepartmentId,
  DepartmentDescription,
  avg( CompanyAffiliation as abap.dec(11,1) ) as AverageAffiliation,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( AnnualSalaryConverted )                as TotalSalary,
  CurrencyCode
}
group by
  DepartmentId,
  DepartmentDescription,
  CurrencyCode
