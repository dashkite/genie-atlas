# Testing

This document outlines the testing strategy for the `genie-atlas` preset.

The preset is designed to integrate seamlessly into the Genie task runner lifecycle. The primary approach to testing involves verifying that the `atlas:generate` command correctly configures the Masonry pipeline and successfully hooks into the `build` lifecycle.

To execute the test suite for the project, use the standard Genie test command:

```bash
npx genie test
```

This command will invoke the configured test runner and report on the status of all available test cases.
