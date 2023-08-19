#!/bin/bash
cat vhdl/AiMlAddonsCustomComponents.vhdl > lib/AiMlAddons.vhdl
cat vhdl/generic*.vhdl >> lib/AiMlAddons.vhdl
cat vhdl/memory*.vhdl >> lib/AiMlAddons.vhdl
