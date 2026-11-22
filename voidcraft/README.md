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

Each online player has their own state, elapsed time and cooldown scores. State 0 is idle; state 1 dispatches the preview sequence. The dispatcher increments the timer once per tick, starting on the tick after acceptance, and calls the active sequence's tick function. Each sequence owns its timed events, timeout, completion, and cleanup. For a future sequence, add its request to `casting/request`, state to `casting/validate` and `casting/advance`, and cleanup to `casting/cleanup`.

The preview recovers if its timer reaches 201; future sequences choose their own timeout. Unknown states and negative active timers are also reset. Cleanup runs before a known sequence's state is cleared on completion, cancellation, or recovery. Cooldowns and sequences pause while a player is offline and resume after they return; scores persist across reloads. Removing the pack does not automatically remove its scoreboard objectives.

Objective setup probes each objective on every load and creates missing ones without resetting existing scores. Recreating a removed objective cannot restore its scores. The probe can fail when an objective is missing; check the reload log when testing initialization.

For future entity-based spells, call `casting/prepare_owner` as the caster, then immediately summon the entity and call `casting/bind_owner` as that entity in the same synchronous function chain. The player and entity then share a `vc_owner` score, which can be compared with scoreboard operations. The pending value is shared scratch space: do not defer binding or call another prepare between preparation and binding. Keep the `vc_owner` objective and its `#next` counter intact; deleting or resetting them can cause ID collisions. Integer overflow is not handled. The preview does not spawn entities.

Death and respawn do not explicitly cancel a cast. Decide on a death policy and test a per-player death-detection mechanism before adding one.

This pack declares format 48 and uses `data/minecraft/tag/function/` as required by this project's configuration. These settings do not match the requested Minecraft 1.21.11 format and tag directory, so compatibility with 1.21.11 is not established.