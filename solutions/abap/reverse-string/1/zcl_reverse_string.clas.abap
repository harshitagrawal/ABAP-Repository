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

    DATA: 
          rev_string type string,
          char type c,
          counter type i.

    counter = strlen( input ) - 1.
    WHILE counter >= 0.
      char = input+counter(1).
      if char eq space. 
        concatenate rev_string space into rev_string RESPECTING BLANKS.
      endif.
      CONCATENATE rev_string char into rev_string.
      counter = counter - 1.

    ENDWHILE.
    
    result = rev_string.
  ENDMETHOD.

ENDCLASS.
