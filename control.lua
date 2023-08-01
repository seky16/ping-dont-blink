-- http://lua-users.org/wiki/SimpleRound
local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

script.on_event("custom-place-ping", function(event)
    local position = event.cursor_position
    local position_round = { x = round(position.x, 1), y = round(position.y, 1)}
    local player = game.get_player(event.player_index)
    local time_to_live = settings.get_player_settings(player)["ping-dont-blink_time-to-live"].value or 20
    rendering.draw_sprite
    {
        sprite = "utility/shoot_cursor_red",
        target = position_round,
        surface = player.surface,
        time_to_live = time_to_live * 60,
        players = { player },
        x_scale = 0.3,
        y_scale = 0.3
    }
end)