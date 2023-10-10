THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $THIS_DIR/../rust-core

NAME="rust_core"
TARGET_DIR="target"
BINDINGS_DIR="bindings"
RELEASE_DIR="release"
OUT_DIR="../ios/generated"
TEMP_HEADER_DIR="${BINDINGS_DIR}/include"

TARGET_ARCHES=(
    aarch64-apple-darwin
    aarch64-apple-ios
    aarch64-apple-ios-sim
)

# Build the library to create bindings
cargo build

for arch in "${TARGET_ARCHES[@]}"; do
    # Add the target arch via rustup (if needed)
    rustup target add "$arch"

    # Build the library for the target architecture in release mode
    cargo build --target "$arch" --release
done

# Move headers and module map into a temp directory, with proper naming conventions for xcframework
mkdir -p "${TEMP_HEADER_DIR}"
cp "${BINDINGS_DIR}/${NAME}FFI.h" "${TEMP_HEADER_DIR}/"
cp "${BINDINGS_DIR}/${NAME}FFI.modulemap" "${TEMP_HEADER_DIR}/module.modulemap"

# Remove the old xcframework
rm -rf "${OUT_DIR}/${NAME}_framework.xcframework"

# Build a new xcframework, with libraries and headers for each target architecture
XCODE_BUILD_CMD="xcodebuild -create-xcframework"
for arch in "${TARGET_ARCHES[@]}"; do
    XCODE_BUILD_CMD+=" -library \"${TARGET_DIR}/${arch}/${RELEASE_DIR}/lib${NAME}.a\""
    XCODE_BUILD_CMD+=" -headers \"${TEMP_HEADER_DIR}\""
done
XCODE_BUILD_CMD+=" -output \"${OUT_DIR}/${NAME}_framework.xcframework\""
echo "{$XCODE_BUILD_CMD}"
eval "$XCODE_BUILD_CMD"

# Remove the temp header directory
rm -rf "${TEMP_HEADER_DIR}"

