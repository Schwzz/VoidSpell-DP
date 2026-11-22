# Voidcraft foundation

This pack provides a per-player casting state, a timed sequence dispatcher, cancellation, a cooldown, and a short visual preview. Void Nova is not implemented.

## Installation

1. Download the ZIP using the export button.
2. Extract it so `voidcraft` is directly inside your world's `datapacks` folder.
3. Run `/reload`.
4. Run `/datapack list` and confirm Voidcraft is enabled.

## Testing

After a tick has passed, run `/trigger vc_cast set 1` to start the preview. Run `/trigger vc_cast set 2` during the preview to cancel it. The preview lasts 20 ticks, followed by a 100-tick cooldown; cancellation applies a 20-tick cooldown. Try casting and cancelling independently with two players.

Operators can also run `/execute as <player> at <player> run function voidcraft:sequence/preview/start` to test the sequence directly. This bypasses normal casting and cooldown checks.

## Architecture

Each online player has their own state, elapsed time and cooldown scores. State 0 is idle; state 1 dispatches the preview sequence. The dispatcher increments the timer once per tick, starting on the tick after acceptance, and calls the active sequence's tick function. Each sequence owns its timed events and completion. Add future sequences as separate functions, assign each a distinct positive state in the dispatcher, and extend the valid-state check in `player_tick`.

A 200-tick watchdog resets a stuck sequence; unknown states and negative active timers are also reset. Cooldowns and sequences pause while a player is offline and resume after they return; scores persist across reloads. Removing the pack does not automatically remove its scoreboard objectives.

This pack uses format 48 as required by the project configuration; Minecraft 1.21.11 compatibility has not been verified.