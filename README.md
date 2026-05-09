# Genie Import Maps

*Task preset for generating import maps.*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

Genie Atlas is a plugin for the Genie build tool that automates the generation and management of Atlas import maps for your projects.

## Installation

Use your favorite package manager:

```bash
npm install @dashkite/genie-atlas
```

## Usage

Enable the plugin in your `genie.yaml` configuration and define your Atlas options.

```yaml
plugins:
  - "@dashkite/genie-atlas"

atlas:
  target: "src/index.html"
```

## Status

Not suitable for production use. Please report any issues on the [GitHub repository](https://github.com/dashkite/genie-atlas).
