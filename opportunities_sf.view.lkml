view: opportunities_sf {
  sql_table_name: dbt_at.opportunities_sf;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: account_id{
    type: string
    sql: ${TABLE}.account_id;;
  }

  dimension: account_name{
    type: string
    sql: ${TABLE}.account_name;;
  }

  dimension_group: close{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.close_date;;
  }

  dimension_group: created{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.created_date;;
  }

  dimension: is_won{
    type: yesno
    sql: ${TABLE}.is_won;;
  }

  dimension: lead_source{
    type: string
    sql: ${TABLE}.lead_source;;
  }

  dimension: opp_arr{
    type: number
    sql: ${TABLE}.opp_arr;;
    hidden: yes
  }

  dimension: opp_name{
    type: string
    sql: ${TABLE}.opp_name;;
  }

  dimension: opp_type{
    type: string
    sql: ${TABLE}.opp_type;;
  }

  measure: closed_arr {
    type: sum
    sql: ${opp_arr} ;;
    value_format: "$#,##0.00"
  }

  measure: total_opps_created {
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: created_date
      value: "-NULL"
    }
  }

  measure: total_opps_closed {
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: close_date
      value: "-NULL"
    }
  }
}
