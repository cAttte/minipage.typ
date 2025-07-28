set -euo pipefail

input=$1
outdir="minipages"
mkdir -p "$outdir"

mapfile -t sources < <(typst query $input metadata --field value | jq -c '.[]')
for i in "${!sources[@]}"; do
    (jq -r <<<"${sources[i]}") | typst compile - "minipages/$i.svg"
done

typst compile $@ --input fallback=false
