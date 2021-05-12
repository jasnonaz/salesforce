view: opportunity {
  derived_table: {
    sql: select * from sfdc.sf_opportunity where isdeleted = false ;;
  }

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
    value_format: "$#,##0.00"
  }

  dimension_group: close{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CASE
            when ${TABLE}.closedate is not null and ${TABLE}.closedate::date > '2021-03-13' then dateadd(hour, -4, ${TABLE}.closedate)
            when ${TABLE}.closedate is not null and ${TABLE}.closedate::date > '2020-10-31' and ${TABLE}.closedate::date <= '2021-03-13' then dateadd(hour, -5, ${TABLE}.closedate)
            when ${TABLE}.closedate is not null and ${TABLE}.closedate::date > '2020-03-07' and ${TABLE}.closedate::date <= '2021-10-31' then dateadd(hour, -4, ${TABLE}.closedate)
            when ${TABLE}.closedate is not null then dateadd(hour, -5, ${TABLE}.closedate)
            else null
         END;;
  }

  dimension_group: created{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CASE
            when ${TABLE}.createddate is not null and ${TABLE}.createddate::date > '2021-03-13' then dateadd(hour, -4, ${TABLE}.createddate)
            when ${TABLE}.createddate is not null and ${TABLE}.createddate::date > '2020-10-31' and ${TABLE}.createddate::date <= '2021-03-13' then dateadd(hour, -5, ${TABLE}.createddate)
            when ${TABLE}.createddate is not null and ${TABLE}.createddate::date > '2020-03-07' and ${TABLE}.createddate::date <= '2021-10-31' then dateadd(hour, -4, ${TABLE}.createddate)
            when ${TABLE}.createddate is not null then dateadd(hour, -5, ${TABLE}.createddate)
            else null
         END;;
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
    description: "Containes values like New Logo, Add on etc"
    type: string
    sql: ${TABLE}.type;;
  }

  dimension: type_2{
    description: "Containes values like Team License, Use Case, Toolkit etc"
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
    type: number
    sql: ${TABLE}.unique_id__c;;
  }

  dimension: senior_account{
    type: number
    sql: ${TABLE}.lbl_canvas_billing_account_id__c;;
  }

  dimension: total_potential_company_user{
    type: string
    sql: ${TABLE}.total_potential_company_user__c;;
    hidden: yes
  }

  dimension: total_potential_company_user_mod{
    type: number
    sql: case
            when ${total_potential_company_user} is null then 0
            else regexp_instr(${total_potential_company_user}, '[a-zA-Z~!"%#$&"()*+,-./:\;<=>?@]')::integer
         end;;
    hidden: yes
  }

  dimension: bdr_mrr_pipeline_generated{
    type: number
    sql: CASE
            when ${toolkit} is not null and ${total_potential_company_user_mod} = 0 then (${total_potential_company_user}::bigint * 8)
            when ${total_potential_company_user_mod} = 0 then (${total_potential_company_user}::bigint * 30)
            else 0
         END;;
    value_format: "$#,##0.00"
  }

  dimension: bdr_arr_pipeline_generated{
    type: number
    sql: ${bdr_mrr_pipeline_generated} * 12;;
    value_format: "$#,##0.00"
  }

  dimension: subscription_revenues{
    type: number
    sql: CASE
            when ${amount} is not null and lower(${subscription_revenue}) = 'monthly' then ${amount}
            when ${amount} is not null and lower(${subscription_revenue}) in ('annual','annuals','12 month') then (${amount} / 12)
            when ${amount} is not null and lower(${subscription_revenue}) = '24 month' then (${amount} / 24)
            when ${amount} is not null and lower(${subscription_revenue}) = '36 month' then (${amount} / 36)
            when ${amount} is not null and lower(${subscription_revenue}) = '48 months' then (${amount} / 48)
            when ${amount} is not null and lower(${subscription_revenue}) = '60 months' then (${amount} / 60)
            when ${amount} is not null and lower(${subscription_revenue}) = '72 months' then (${amount} / 72)
            when ${amount} is not null and lower(${subscription_revenue}) ='90 day out' then (${amount} / (12/custom_contract__c))
            when ${amount} is not null and lower(${subscription_revenue}) = 'custom term' then (${amount} / custom_term_length__c)
            when ${bdr_mrr_pipeline_generated} is not null then ${bdr_mrr_pipeline_generated}
            else 0.0
         END;;
    value_format: "$#,##0.00"
  }

  dimension: arr{
    type: number
    sql: CASE
            when ${amount} is not null and lower(${subscription_revenue}) = 'monthly' then ${amount} * 12
            when ${amount} is not null and lower(${subscription_revenue}) in ('annual','annuals','12 month') then (${amount} / 12) * 12
            when ${amount} is not null and lower(${subscription_revenue}) = '24 month' then (${amount} / 24) * 12
            when ${amount} is not null and lower(${subscription_revenue}) = '36 month' then (${amount} / 36) * 12
            when ${amount} is not null and lower(${subscription_revenue}) = '48 months' then (${amount} / 48) * 12
            when ${amount} is not null and lower(${subscription_revenue}) = '60 months' then (${amount} / 60) * 12
            when ${amount} is not null and lower(${subscription_revenue}) = '72 months' then (${amount} / 72) * 12
            when ${amount} is not null and lower(${subscription_revenue}) ='90 day out' then (${amount} / (12/custom_contract__c)) * 12
            when ${amount} is not null and lower(${subscription_revenue}) = 'custom term' then (${amount} / custom_term_length__c) * 12
            when ${bdr_arr_pipeline_generated} is not null then ${bdr_arr_pipeline_generated}
            else 0.0
         END;;
    value_format: "$#,##0.00"
  }

  dimension: forecast_category_name{
    type: string
    sql: ${TABLE}.ForecastCategoryName;;
  }

  dimension: commit{
    type: number
    sql: CASE
            when ${forecast_category_name} in ('Commit','Closed') then (${subscription_revenues} * ${probability} * 0.01)
            else 0
         END;;
    value_format: "$#,##0.00"
  }

  dimension: mrr_ps_amount{
    type: number
    sql: ${TABLE}.mrr_ps_amount__c;;
    value_format: "$#,##0.00"
  }

  dimension: services_revenue{
    type: number
    sql: CASE
            when ${forecast_category_name} in ('Commit','Closed','Omitted','Best Case','Pipeline') and ${services} in ('Apps','Custom Output','Services Custom') then ${amount}
            when ${forecast_category_name} in ('Commit','Closed','Omitted','Best Case','Pipeline') and ${services} in ('Integration','Web Analytics') then ${mrr_ps_amount}
            else 0
         END;;
    value_format: "$#,##0.00"
  }

}
