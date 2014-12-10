require 'active_support/core_ext'

module FootballAPISample

RESPONSE = {
APIVersion: 1,
APIRequestsRemaining: 1000,
DeveloperAuthentication: "TRUE",
matches: [
  {
    match_id: "1962073",
    match_static_id: "1755714",
    match_comp_id: "1204",
    match_date: "Dec 07",
    match_formatted_date: "07.12.2014",
    match_season_beta: "",
    match_week_beta: "",
    match_venue_beta: "",
    match_venue_id_beta: "0",
    match_venue_city_beta: "",
    match_status: "13:30",
    match_timer: "",
    match_time: "13:30",
    match_commentary_available: "epl",
    match_localteam_id: "9427",
    match_localteam_name: "West Ham",
    match_localteam_score: "2",
    match_visitorteam_id: "9387",
    match_visitorteam_name: "Swansea",
    match_visitorteam_score: "1",
    match_ht_score: "",
    match_ft_score: "",
    match_et_score: ""
    },
    {
    match_id: "1962074",
    match_static_id: "1755706",
    match_comp_id: "1204",
    match_date: "Dec 07",
    match_formatted_date: "07.12.2014",
    match_season_beta: "",
    match_week_beta: "",
    match_venue_beta: "",
    match_venue_id_beta: "0",
    match_venue_city_beta: "",
    match_status: "16:00",
    match_timer: "",
    match_time: "16:00",
    match_commentary_available: "epl",
    match_localteam_id: "9008",
    match_localteam_name: "Aston Villa",
    match_localteam_score: "3",
    match_visitorteam_id: "9240",
    match_visitorteam_name: "Leicester",
    match_visitorteam_score: "2",
    match_ht_score: "",
    match_ft_score: "",
    match_et_score: ""
    }
  ],
  Action: "today",
  Params: {
    Action: "today",
    APIKey: "22b010b0-6e2d-bd23-143ae1773790",
    comp_id: "1204"
  },
  ComputationTime: 0.062367916107178,
  IP: "101.174.194.67",
  ERROR: "OK",
  ServerName: "Football-API",
  ServerAddress: "http://football-api.com/api"
}.to_json

end