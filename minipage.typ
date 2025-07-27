#let fallback = sys.inputs.at("fallback", default: "true") == "true"
#let minipage-index = counter("minipage-index")
#let minipage(source, ..rect-args) = context {
    [#metadata(source.text)<minipage>]
    if fallback {
        raw(source.text, block: true, lang: "typ")
    } else {
        rect(stroke: .5pt + luma(75%), ..rect-args,
          image("minipages/" + str(minipage-index.get().first()) + ".svg")
        )
        minipage-index.step()
    }
}
