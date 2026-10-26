[![Build ZMK firmware](https://github.com/TKussel/corax-zmk-config/actions/workflows/build.yaml/badge.svg)](https://github.com/TKussel/corax-zmk-config/actions/workflows/build.yaml)

# Corax ZMK configuration

Personal [ZMK](https://zmk.dev/) firmware configuration for the
[Corax keyboard](https://github.com/dnlbauer/corax-keyboard), optimized for a
US International host layout.

The configuration supports:

- Corax56 and Corax54 hardware
- nice!nano v2 controllers and nice!view displays
- ZMK Studio on the central/left half
- rotary encoders, including mouse-wheel scrolling
- deep sleep after one hour of inactivity

## Dependencies

The firmware is built against the stable ZMK `v0.3` release. The Corax shield
is provided by the external
[`zmk-keyboards-corax`](https://github.com/dnlbauer/zmk-keyboards-corax)
module, pinned to a tested commit in `config/west.yml`.

Keep the ZMK revision in `config/west.yml` aligned with the reusable workflow
revision in `.github/workflows/build.yaml` when upgrading.

## Building and flashing

Pushing a commit or opening a pull request runs the GitHub Actions build. A
manual build can also be started from the Actions tab. Download the generated
firmware artifact and copy the appropriate UF2 file to each controller while it
is in bootloader mode.

See the [ZMK user setup documentation](https://zmk.dev/docs/user-setup) for
local tooling, build, and flashing instructions.

## ZMK Studio

The central/left firmware includes the Studio USB RPC endpoint. Use the Studio
unlock key on the Adjust layer before connecting through
[ZMK Studio](https://zmk.studio/).

Studio stores runtime keymap changes on the keyboard. Later edits to
`config/corax.keymap` will not replace those stored changes until the keyboard
is restored to stock settings in Studio.

## Corax56 and Corax54

The Corax56 and Corax54 use the same shield. Their hardware is identical except
that the Corax54 omits one physical key. The same firmware can be used for both;
the binding at the omitted position is ignored on a Corax54.

## License

MIT License
