# genie-atlas

*Task preset for generating import maps.*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

The `genie-atlas` package is a preset for the Genie task runner that automates the generation and management of Atlas import maps for projects.

## Features

- Defines the `atlas:generate` task for creating import maps.
- Automatically hooks `atlas:generate` to execute after the `build` task.
- Integrates with the Atlas Sky preset for module resolution.
- Configurable via the project `genie.yaml` configuration.

## Installation

Install this preset as a development dependency:

```bash
pnpm install -D @dashkite/genie-atlas
```

Because it is installed as a Genie preset, it will be automatically registered and available for use in the project.

## Usage

Configure the plugin in the `genie.yaml` and define the Atlas options.

```yaml
atlas:
  target: "build/browser/src/index.html"
```

## Other Resources

- [Recipes](docs/recipes.md)
- [Reference](docs/reference.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)
