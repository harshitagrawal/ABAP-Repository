CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
    DATA: counter type i.
    counter = strlen( input ) - 1.
    WHILE counter >= 0.
      result = |{ result }{ input+counter(1) }|.
      counter -= 1.
    ENDWHILE.
  ENDMETHOD.

ENDCLASS.
