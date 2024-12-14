export PATH=./cli-tools/nvim-macos-arm64/bin:./cli-tools/dotnet/sdks/8.0:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
SCRIPT_DIR=$(dirname "$(realpath "$0")")
open  $SCRIPT_DIR/Visual\ Studio\ Code.app
