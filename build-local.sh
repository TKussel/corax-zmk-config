#!/usr/bin/env bash
# Build both Corax halves locally in the same container image CI uses.
# Requires Docker. First run downloads the image and sources (~5 min);
# subsequent runs are incremental.
set -euo pipefail

IMAGE="zmkfirmware/zmk-build-arm:stable"
BOARD="nice_nano@2.0.0//zmk" # nice!nano v2, HWMv2 board ID
cd "$(dirname "$0")"

run() {
  docker run --rm -v "$PWD":/work -w /work "$IMAGE" bash -ec "$1"
}

if [ ! -d .west ]; then
  run "west init -l config"
fi

# Picks up changes to the pinned revisions in config/west.yml.
run "west update && west zephyr-export"

run "west build -s zmk/app -d build/left -b $BOARD -- -DZMK_CONFIG=/work/config -DSHIELD='corax_left nice_view' -DSNIPPET='studio-rpc-usb-uart' -DCONFIG_ZMK_STUDIO=y"
run "west build -s zmk/app -d build/right -b $BOARD -- -DZMK_CONFIG=/work/config -DSHIELD='corax_right nice_view'"

echo
echo "Firmware ready:"
echo "  build/left/zephyr/zmk.uf2   (central, with Studio)"
echo "  build/right/zephyr/zmk.uf2"
