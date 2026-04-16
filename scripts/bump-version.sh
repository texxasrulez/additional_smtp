#!/bin/sh

set -eu

if [ "${1:-}" = "" ]; then
    echo "Usage: sh scripts/bump-version.sh <version>" >&2
    exit 1
fi

version="$1"
file="additional_smtp.php"

php -r '
$file = $argv[1];
$version = $argv[2];
$src = file_get_contents($file);
if ($src === false) {
    fwrite(STDERR, "Unable to read $file\n");
    exit(1);
}
$count = 0;
$src = preg_replace("/const PLUGIN_VERSION = '\''[^'\'']+'\'';/", "const PLUGIN_VERSION = '\''" . $version . "'\'';", $src, 1, $count);
if ($count !== 1) {
    fwrite(STDERR, "PLUGIN_VERSION constant not updated\n");
    exit(1);
}
if (file_put_contents($file, $src) === false) {
    fwrite(STDERR, "Unable to write $file\n");
    exit(1);
}
' "$file" "$version"

echo "Updated $file to version $version"
echo "Reminder: update CHANGELOG.md before tagging the release."
