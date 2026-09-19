#!/bin/sh
set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
configuration=${CONFIGURATION:-Release}
architecture=${ARCHITECTURE:-$(uname -m)}

case "$architecture" in
    arm64) runtime="osx-arm64" ;;
    x86_64) runtime="osx-x64" ;;
    *) echo "Unsupported macOS architecture: $architecture" >&2; exit 1 ;;
esac

app_name="YRM100 Reader.app"
bundle_dir="$project_dir/dist/$app_name"
publish_dir="$project_dir/.macos-publish/$runtime"

rm -rf "$bundle_dir" "$publish_dir"
mkdir -p "$bundle_dir/Contents/MacOS" "$bundle_dir/Contents/Resources"

dotnet publish "$project_dir/src/Yrm100.App/Yrm100.App.csproj" \
    --configuration "$configuration" \
    --framework net10.0 \
    --runtime "$runtime" \
    --self-contained false \
    --output "$publish_dir"

cp -R "$publish_dir"/. "$bundle_dir/Contents/MacOS/"
cp "$project_dir/macos/Info.plist" "$bundle_dir/Contents/Info.plist"

chmod +x "$bundle_dir/Contents/MacOS/YRM100.Reader"

echo "Created: $bundle_dir"