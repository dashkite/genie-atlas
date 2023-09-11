import M from "@dashkite/masonry"
import atlas from "@dashkite/masonry-atlas"

export default ( Genie ) ->

  if ( options = Genie.get "import-map" )?
    Genie.define "import-map", M.start [
      M.glob ( options.target ? options.targets ), "."
      M.read
      M.tr atlas options
      M.write "."
    ]

    Genie.after "build", "import-map"
    
