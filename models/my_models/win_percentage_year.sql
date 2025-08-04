with games as (
select
        team_id_home,
        year(game_date) as season,
        wl_home,
        wl_away,
        case when wl_home = 'W' then 1 else 0 end as win
    from {{source('idan_dbt', 'game')}}
    where year(game_date) > 2000
    )
select top 3
    team_id_home,
    season,
    count(*) as total_games,
    sum(win) as total_wins,
    round(100.0 * sum(win) / count(*), 2) as win_percentage
from games
group by team_id_home, season