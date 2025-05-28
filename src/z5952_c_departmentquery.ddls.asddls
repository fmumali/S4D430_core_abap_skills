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
  as select from Z5952_C_EMPLOYEEQUERY
{
  DepartmentId,
  DepartmentDescription,
  avg( CompanyAffiliation as abap.dec(11,1) ) as AverageAffiliation,
  @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
  sum( AnnualSalaryConverted )                as TotalSalary,
  CurrencyCodeUSD
}
group by
  DepartmentId,
  DepartmentDescription,
  CurrencyCodeUSD
