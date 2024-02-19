import * as Fn from "@dashkite/joy/function"
import M from "@dashkite/masonry"
import atlas from "@dashkite/masonry-atlas"
import SkyPreset from "@dashkite/atlas/presets/sky"
import configuration from "./configuration"

export default ( Genie ) ->


  if ( options = Genie.get "atlas" )?

    SkyPreset.apply
      provider: "jsdelivr"
      build: "build/browser/src"
      origin: configuration.provider

    targets = options.target ? options.targets

    Genie.define "atlas:generate", M.start [
      M.glob targets
      M.read
      M.tr atlas options
      M.write "."
    ]

    Genie.after "pug:build", "atlas:generate"
