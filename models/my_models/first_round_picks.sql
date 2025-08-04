select
    season,
    player_name,
    team_id,
    round_number,
    round_pick
from {{source('idan_dbt', 'draft_history')}}
where round_number = 1
