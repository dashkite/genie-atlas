# Reference

This document provides a comprehensive reference for the commands and configurations introduced by the `genie-atlas` preset.

## Commands

### atlas:generate:

The core command introduced by this preset. It performs the sequence of operations required to generate and inject import maps.

It globs the specified target HTML files, reads their contents, applies the Atlas import map transformation using the options defined in `genie.yaml`, and writes the modified files back to the file system. This command is automatically configured to run after the `build` command.

## Configuration

The preset reads options from the `atlas` key in the `genie.yaml` configuration file. If no options are provided, it falls back to a default configuration.

### target

$string | array$

A glob pattern or array of patterns specifying the HTML files to process. The preset will find these files and inject the generated import maps into them. Aliased as `targets`. Defaults to `"./build/browser/src/index.html"`.

### entries

$array$

A list of entry point files for the application. These are the primary modules that the import map needs to resolve. Defaults to `["./build/browser/src/index.js"]`.

### build

$string$

The output directory for the build process, used by the Sky preset to determine the location of built assets. Defaults to `"build/browser/src"`.
