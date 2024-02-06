import * as Fn from "@dashkite/joy/function"
import Time from "@dashkite/joy/time"
import M from "@dashkite/masonry"
import atlas from "@dashkite/masonry-atlas"
import * as SNS from "@dashkite/dolores/sns"
import * as SQS from "@dashkite/dolores/sqs"
import SkyPreset from "@dashkite/atlas/presets/sky"
import configuration from "./configuration"

export default ( Genie ) ->

  if ( options = Genie.get "import-map" )?

    Build =

      configure: Fn.once ->
        SkyPreset.apply
          provider: "jsdelivr"
          build: "build/browser/src"
          origin: configuration.provider

      run: M.start [
        M.glob ( options.target ? options.targets ), root: "."
        M.read
        M.tr atlas options
        M.write "."
      ]

    Genie.define "import-map", 
      Fn.flow [ Build.configure, Build.run ]

    Genie.after "build", "import-map"

    Watch = do ({ queue, topic } = {}) ->

      configure: 

        Fn.once ->
          topic = await SNS.create configuration.topic
          queue = await SQS.create configuration.queue
          await SNS.subscribe topic, queue
      
      # could also be a flow:
      # https://github.com/dashkite/masonry-targets/issues/2
      listen: ->    
        loop
          events = await SQS.poll queue
          if events.length > 0
            await do Build.run

    Genie.define "import-map:watch", 
      Fn.flow [ Build.configure, Watch.configure, Watch.listen ]

    Genie.on "watch", "import-map:watch&"
    
