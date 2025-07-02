#!/usr/bin/env sh

url=$1

out=$(mktemp)
curl -s "$url" -o "$out"

pname=$(echo "$url" | sed -E 's/.*\/([^-]+)-.*/\1/' | tr '_' '-')
manifest=$(unzip -p "$out" manifest.json)
version=$(echo "$manifest" | jq -r .version)
addonId=$(echo "$manifest" | jq -r .browser_specific_settings.gecko.id)
sha256=$(sha256sum <"$out" | cut -d ' ' -f 1)

cat <<EOF | nixfmt
{ buildFirefoxXpiAddon, ... }:

buildFirefoxXpiAddon {
  pname = "$pname";
  version = "$version";
  addonId = "$addonId";
  url = "$url";
  sha256 = "$sha256";
  meta = { };
}
EOF

rm "$out"
