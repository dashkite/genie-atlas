import * as M from "@dashkite/masonry"
import { atlas } from "@dashkite/masonry/atlas"

export default ( t ) ->

  if ( options = ( t.get "presets" )?[ "import-map" ])?

    t.define "import-map", M.start [
      M.glob ( options.target ? options.targets ), "."
      M.read
      M.tr atlas options
      M.write "."
    ]

    t.after "build", "import-map"
    
