class zcl_346_gen_data_gv definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
endclass.


class zcl_346_gen_data_gv implementation.

  method if_oo_adt_classrun~main.

"  out->write( cl_abap_context_info=>get_system_url(  ) ).

    delete from z346_travel_gv_a.
    delete from z346_travel_gv_d.

    insert z346_travel_gv_a from (
          select from /dmo/travel
                 fields uuid(  ) as travel_uuid,
                        travel_id,
                        agency_id,
                        customer_id,
                        begin_date,
                        end_date,
                        booking_fee,
                        total_price,
                        currency_code,
                        description,
                        case status
                          when 'B' then 'A'
                          when 'P' then 'O'
                          when 'N' then 'O'
                          else 'X'
                        end as overall_status,
                      createdby     as local_created_by,
                      createdat     as local_created_at,
                      lastchangedby as local_last_changed_by,
                      lastchangedat as local_last_changed_at
                      where travel_id between 1 and 3000 ).

    if sy-subrc eq 0.
      out->write( |Travel......{ sy-dbcnt } rows inserted.| ).
    endif.

  endmethod.

endclass.
