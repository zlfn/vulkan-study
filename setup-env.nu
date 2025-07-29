# Copyright (c) 2020 LunarG, Inc.
# Copyright (c) 2025 zlfn

# This script is meant to be sourced into an existing shell environment.
# Execute this shell script with `source setup-env.nu`

# Set the Vulkan SDK path
$env.VULKAN_SDK = $"($env.FILE_PWD)/macOS"
print $"Vulkan SDK path: ($env.VULKAN_SDK)"
$env.PATH = ($env.PATH | prepend $"($env.VULKAN_SDK)/bin")

# Set the DYLD_LIBRARY_PATH
$env.DYLD_LIBRARY_PATH = $"($env.VULKAN_SDK)/lib:($env.DYLD_LIBRARY_PATH? | default "")"
print $"DYLD_LIBRARY_PATH: ($env.DYLD_LIBRARY_PATH)"

# VK_ADD_LAYER_PATH is used instead of VK_LAYER_PATH after Vulkan 1.3
print "This script is now using VK_ADD_LAYER_PATH instead of VK_LAYER_PATH"

# Vulkan layers (debugging and profiling)
$env.VK_ADD_LAYER_PATH = $"($env.VULKAN_SDK)/share/vulkan/explicit_layer.d"
print $"VK_ADD_LAYER_PATH: ($env.VK_ADD_LAYER_PATH)"

# Vulkan ICD (Installable Client Driver) files
$env.VK_ICD_FILENAMES = $"($env.VULKAN_SDK)/share/vulkan/icd.d/MoltenVK_icd.json"
print $"VK_ICD_FILENAMES: ($env.VK_ICD_FILENAMES)"

# For executables that use VK_DRIVER_FILES
$env.VK_DRIVER_FILES = $"($env.VULKAN_SDK)/share/vulkan/icd.d/MoltenVK_icd.json"
print $"VK_DRIVER_FILES: ($env.VK_DRIVER_FILES)"

$env.PKG_CONFIG_PATH = $"($env.VULKAN_SDK)/lib/pkgconfig:($env.PKG_CONFIG_PATH? | default "")"
print $"PKG_CONFIG_PATH: ($env.PKG_CONFIG_PATH)"
