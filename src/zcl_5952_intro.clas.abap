CLASS zcl_5952_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_5952_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA var TYPE /lrn/s4d430_ind_struct.

    SELECT FROM /lrn/s4d430_ind FIELDS * INTO TABLE @DATA(result).

     ENDMETHOD.

ENDCLASS.
