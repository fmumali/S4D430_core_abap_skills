CLASS zcl_5952tyt_table_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

* Task 1: Simple Table Type
**********************************************************************
*    TYPES Z5952t_addresses TYPE SORTED TABLE OF /lrn/s_address
*                       WITH NON-UNIQUE KEY country city.

* Task 2: Deep Structure
**********************************************************************
*    TYPES:
*      BEGIN OF st_person_deep,
*        first_name TYPE /dmo/first_name,
*        last_name  TYPE /dmo/last_name,
*        addresses  TYPE Z5952t_addresses,
*      END OF st_person_deep.


*Task 3: Nested Table Type
**********************************************************************
*    TYPES tt_persons TYPE HASHED TABLE OF st_person_deep
*                     WITH UNIQUE KEY last_name first_name.


protected section.
private section.
ENDCLASS.



CLASS ZCL_5952TYT_TABLE_TYPE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Task 1
**********************************************************************
*    DATA addresses TYPE tt_addresses.
    DATA addresses TYPE Z5952t_addresses.

    addresses =
      VALUE #(
              ( street      = 'Dietmar-Hopp-Allee 16'
                postal_code = '69190'
                city        = 'Walldorf'
                country     = 'DE'
              )
              ( street      = '3999 West Chester Pike'
                postal_code = '19073'
                city        = 'Newtown Square, PA'
                country     = 'US'
              )
             ).

* Task 2
**********************************************************************
    "DATA person TYPE st_person_deep.
    DATA person TYPE z5952s_person_deep.

    person-first_name = 'Dictionary'.
    person-last_name  = 'ABAP'.
    person-addresses  = addresses.

* Task 3
**********************************************************************
*    DATA persons TYPE tt_persons.
       DATA persons TYPE z5952t_persons.

    persons =
       VALUE #(
          ( person )
          (
            first_name = 'CDS'
            last_name  = 'ABAP'
            addresses =
              VALUE #(
                      ( street      = 'SAP-Allee 29'
                        postal_code = '68789'
                        city        = 'St.Leon-Rot'
                        country     = 'DE'
                      )
                      ( street      = '35 rue d''Alsace'
                        postal_code = '92300'
                        city        = 'Levallois-Perret'
                        country     = 'FR'
                      )
                      ( street      = 'Bedfont Road'
                        postal_code = 'TW14 8HD'
                        city        = 'Feltham'
                        country     = 'GB'
                      )
                     )
           )
         ).

  ENDMETHOD.
ENDCLASS.
