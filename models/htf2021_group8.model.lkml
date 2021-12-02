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

explore: bnbcheckins {
  join: people {
    type: left_outer
    sql_on: ${bnbcheckins.person_id2} = ${people.id} ;;
    relationship: many_to_one
  }
  join: aib_bnbs_nyc {
    type: left_outer
    sql_on: ${bnbcheckins.bnb_id1} = ${aib_bnbs_nyc.id} ;;
    relationship: many_to_one
  }
  join: bnbreservations{
    type: left_outer
    sql_on: ${bnbcheckins.bnb_id1} = ${bnbreservations.bnbid} ;;
    relationship: many_to_one
  }
}

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

explore: physical_characteristics {
  join: people {
    type: left_outer
    sql_on: ${physical_characteristics.id} = ${people.id} ;;
    relationship: many_to_one
  }
  join: gender {
    type: left_outer
    sql_on: ${physical_characteristics.id} = ${gender.id} ;;
    relationship: many_to_one
  }
  join: ages {
    type: left_outer
    sql_on: ${physical_characteristics.id} = ${ages.id} ;;
    relationship: many_to_one
  }
  join: religions {
    type: left_outer
    sql_on: ${physical_characteristics.id} = ${religions.id} ;;
    relationship: many_to_one
  }
  join: financial_status {
    type: left_outer
    sql_on: ${physical_characteristics.id} = ${financial_status.id} ;;
    relationship: many_to_one
  }
}

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

explore: ride_passengers {
  join: people {
    type: left_outer
    sql_on: ${people.id} = ${ride_passengers.passenger_id} ;;
    relationship: many_to_one

  }
  join: ride_info {
    type: left_outer
    sql_on: ${ride_passengers.ride_id} = ${ride_info.ride_id} ;;
    relationship: many_to_one

  }
}
