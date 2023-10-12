import * as Fn from "@dashkite/joy/function"
import M from "@dashkite/masonry"
import atlas from "@dashkite/masonry-atlas"
import * as DRN from "@dashkite/drn-sky"
import SkyPreset from "@dashkite/atlas/presets/sky"


export default ( Genie ) ->

  if ( options = Genie.get "import-map" )?

    configure = Fn.once ->
      SkyPreset.apply
        provider: "jsdelivr"
        build: "build/browser/src"
        origin: await DRN.resolve "drn:origin/modules/dashkite/com"

    run = M.start [
      M.glob ( options.target ? options.targets ), "."
      M.read
      M.tr atlas options
      M.write "."
    ]

    Genie.define "import-map", Fn.flow [ configure, run ]

    Genie.after "build", "import-map"
    
