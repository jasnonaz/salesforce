view: opportunity {
  sql_table_name: sfdc.sf_opportunity;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: account_id{
    type: string
    sql: ${TABLE}.accountid;;
  }

  dimension: account_name{
    type: string
    sql: ${TABLE}.account_name;;
  }

  dimension: amount{
    type: number
    sql: ${TABLE}.amount;;
  }

  dimension_group: close{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.closedate;;
  }

  dimension: commit{
    type: number
    sql: ${TABLE}.commit__c;;
  }

  dimension_group: created{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.createddate;;
  }

  dimension: isclosed{
    type: yesno
    sql: ${TABLE}.isclosed;;
  }

  dimension: iswon{
    type: yesno
    sql: ${TABLE}.iswon;;
  }

  dimension: project_description{
    type: string
    sql: ${TABLE}.lbl_project_description__c;;
  }

  dimension: lead_source{
    type: string
    sql: ${TABLE}.leadsource;;
  }

  dimension: opp_name{
    type: string
    sql: ${TABLE}.name;;
  }

  dimension: number_of_users{
    type: string
    sql: ${TABLE}.number_of_users__c;;
  }

  dimension: opp_closed_lost_reasons{
    type: string
    sql: ${TABLE}.opp_closed_lost_reasons__c;;
  }

  dimension: owner_id{
    type: string
    sql: ${TABLE}.ownerid;;
  }

  dimension: probability{
    type: number
    sql: ${TABLE}.probability;;
  }

  dimension: service_revenue{
    type: number
    sql: ${TABLE}.service_revenue__c;;
  }

  dimension: services{
    type: string
    sql: ${TABLE}.services__c;;
  }

  dimension: stage_name{
    type: string
    sql: ${TABLE}.stagename;;
  }

  dimension: subscription_revenue{
    type: string
    sql: ${TABLE}.subscription_revenue__c;;
  }

  dimension: type_1{
    type: string
    sql: ${TABLE}.type;;
  }

  dimension: type_2{
    type: string
    sql: ${TABLE}.type__c;;
  }

  dimension: billing_term{
    type: string
    sql: ${TABLE}.billing_term__c;;
  }

  dimension_group: renewal{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.renewal_date__c;;
  }

  dimension: suyf{
    type: yesno
    sql: ${TABLE}.suyf;;
  }

  dimension: primary_address_country{
    type: string
    sql: ${TABLE}.primary_address_country__c;;
  }

  dimension: primary_contact{
    type: string
    sql: ${TABLE}.primary_contact__c;;
  }

  dimension: primary_contact_email{
    type: string
    sql: ${TABLE}.primary_contact_email__c;;
  }

  dimension: multi_year_agreement{
    type: yesno
    sql: ${TABLE}.multi_year_agreement__c;;
  }

  dimension: covid_19_new{
    type: yesno
    sql: ${TABLE}.covid_19_new__c;;
  }

  dimension: toolkit{
    type: string
    sql: ${TABLE}.toolkit__c;;
  }

  dimension: industry{
    type: string
    sql: ${TABLE}.industry__c;;
  }

  dimension: unique_id{
    type: string
    sql: ${TABLE}.unique_id__c;;
  }

  dimension: senior_account{
    type: string
    sql: ${TABLE}.lbl_canvas_billing_account_id__c;;
  }

}
