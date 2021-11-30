connection: "htf2021"

# include all the views
include: "/views/**/*.view"

datagroup: htf2021_group8_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf2021_group8_default_datagroup

explore: appearance {}

explore: companies {}

explore: company_employees {}

explore: aib_bnbs_nyc {}

explore: bnbcheckins {}

explore: event_reviews {
  join: events {
    type: left_outer
    sql_on: ${event_reviews.event_id} = ${events.id} ;;
    relationship: many_to_one
  }
}

explore: ages {}

explore: bnbreservations {}

explore: events {}

explore: physical_characteristics {}

explore: financial_status {}

explore: gender {}

explore: locations {}

explore: people {}

explore: nationalities {}

explore: religions {}

explore: taxis {}

explore: ride_info {}

explore: sub_departments {}

explore: taxi_rides {
  join: taxis {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${taxis.id} ;;
    relationship: many_to_one
  }
}

explore: roles {}

explore: ride_passengers {}
