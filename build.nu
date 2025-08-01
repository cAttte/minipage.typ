def --wrapped main [input: string, ...compile_args] {
    mkdir minipages

    let sources = typst query $input metadata --field value | from json
    $sources | enumerate | each { |src|
        $src.item | typst compile - $"minipages/($src.index).svg"
    }

    typst compile $input --input fallback=false ...$compile_args
}
