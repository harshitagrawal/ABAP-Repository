CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    "add solution here
    FIELD-SYMBOLS: <fs_data> type initial_type.
    append initial line to initial_data assigning <fs_data>.
    <fs_data>-group = 'A'.
    <fs_data>-number = 10.
    <fs_data>-description = 'Group A-2'.
    
    append initial line to initial_data assigning <fs_data>.
    <fs_data>-group = 'B'.
    <fs_data>-number = 5.
    <fs_data>-description = 'Group B'.
    
    append initial line to initial_data assigning <fs_data>.
    <fs_data>-group = 'A'.
    <fs_data>-number = 6.
    <fs_data>-description = 'Group A-1'.
    
    append initial line to initial_data assigning <fs_data>.
    <fs_data>-group = 'C'.
    <fs_data>-number = 22.
    <fs_data>-description = 'Group C-1'.
    
    append initial line to initial_data assigning <fs_data>.
    <fs_data>-group = 'A'.
    <fs_data>-number = 13.
    <fs_data>-description = 'Group A-3'.
    
    append initial line to initial_data assigning <fs_data>.
    <fs_data>-group = 'C'.
    <fs_data>-number = 500.
    <fs_data>-description = 'Group C-2'.
    
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
    field-symbols: <fs_data> type initial_type.
    append initial line to updated_data assigning <fs_data>.
    <fs_data>-group = 'A'.
    <fs_data>-number = 19.
    <fs_data>-description = 'Group A-4'.
    
    "add solution here
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    sort updated_data stable by group ascending number descending.
    "add solution here
  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = initial_data.
    "add solution here
    read table temp_data into Data(lv_data) with key number = 6.
    result_index = sy-tabix.
  ENDMETHOD.

ENDCLASS.
