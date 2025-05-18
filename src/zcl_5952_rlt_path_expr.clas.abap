CLASS zcl_5952_rlt_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_5952_RLT_PATH_EXPR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM Z5952_C_EMPLOYEEQUERY
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           DepartmentDescription,
           AssistantName,
           \_department\_Head-LastName as headname
    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
