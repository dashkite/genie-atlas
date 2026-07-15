# Technical Notes

This document contains technical details, architectural decisions, and internal mechanics of the `genie-atlas` preset.

### Atlas Sky Preset Integration

The preset automatically integrates with the `@dashkite/atlas/presets/sky` preset. This provides a baseline configuration for resolving modules from a CDN.

By default, the provider is set to `"jsdelivr"`, ensuring that bare module imports are successfully mapped to the jsDelivr CDN. The origin is pulled from the internal configuration, establishing the core module namespace (`drn:origin/modules/dashkite/com`).

### Masonry Transformation Pipeline

The generation process relies on a Masonry pipeline to handle the file operations. The `atlas:generate` command is defined as a Masonry stream that globs the target files, reads their contents into the pipeline, transforms the contents by applying the `@dashkite/masonry-atlas` plugin with the provided options, and writes the modified files back to their original locations.

### Genie Preset Strategy

This package operates as a Genie preset rather than a traditional library. By installing it as a development dependency, it becomes automatically available to the Genie task runner. Instead of requiring creators to manually import and initialize the module within a build script, the preset automatically exports an initialization function that receives the `Genie` context. It then defines the `atlas:generate` command and hooks it directly into the task lifecycle, configuring it to execute automatically after the standard `build` command.
