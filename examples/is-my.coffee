IMJV = require("is-my-json-valid")

module.exports =

  version: "draft4"

  validate: (schema, document) ->
    v = IMJV(schema)
    {valid: v(document)}

  ignores:
    # Doubtful value for the majority of use cases.
    minLength: [
      "one supplementary Unicode code point is not long enough"
    ]
    maxLength: [
      "two supplementary Unicode code points is long enough"
    ]

    # Impossible to test when using output of JSON.parse
    "optional/zeroTerminatedFloats": true
    
    # The following items require fetching of remote schemas.
    refRemote: true
    ref: [
      "remote ref, containing refs itself"
    ]
    definitions: true

