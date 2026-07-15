# Recipes

This document provides task-oriented guides for creators working with the `genie-atlas` preset.

## Generating Import Maps for a Build

This guide demonstrates how to configure the preset to generate import maps for a browser build. The preset automates the process of injecting import maps into HTML files by tapping into the build lifecycle.

To enable the generation of import maps, configure the `atlas` section in the `genie.yaml` file. The primary setting is the `target` or `targets`, which specifies the HTML files where the import map will be injected.

```yaml
atlas:
  target: "build/browser/src/index.html"
```

### 1. Define the Targets

Specify the target files that should receive the import map. The preset reads these options during initialization.

### 2. Execute the Build

Once configured, the preset automatically hooks the `atlas:generate` command to run after the standard `build` command. There is no need to invoke it manually unless generating the map independently is required. 

To run the complete build process, including the import map generation, execute the standard build command:

```bash
npx genie build
```

The import map will be generated and injected into the specified target files.
