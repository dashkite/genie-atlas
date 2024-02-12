import * as Fn from "@dashkite/joy/function"
import M from "@dashkite/masonry"
import atlas from "@dashkite/masonry-atlas"
import * as SNS from "@dashkite/dolores/sns"
import * as SQS from "@dashkite/dolores/sqs"
import SkyPreset from "@dashkite/atlas/presets/sky"
import { load } from "@dashkite/drn-loader"
import configuration from "./configuration"

# sigh...
debounce = do ({ last } = {}) ->
  last = 0
  ( f ) ->
    ( args... ) ->
      now = performance.now()
      if ( now - last ) > 100 #ms
        last = now
        f args...

export default ( Genie ) ->


  if ( options = Genie.get "import-map" )?

    SkyPreset.apply
      provider: "jsdelivr"
      build: "build/browser/src"
      origin: configuration.provider

    await do load

    targets = options.target ? options.targets

    Genie.define "import-map", M.start [
      M.glob targets
      M.read
      M.tr atlas options
      M.write "."
    ]

    Genie.after "build", "import-map"

    Genie.define "import-map:watch", ->
      W = await import( "@dashkite/masonry-watch" )
      do M.start [
        W.glob glob: targets
        debounce W.match type: "file", name: [ "add", "change" ], [
          M.read
          M.tr atlas options
          M.write "."
        ]
      ]

    Genie.on "watch", "import-map:watch&"
    
