read -p "Path of Super Mario 64 US: " -r sm64rom

set -x

sm64rom="${sm64rom%\"}"
sm64rom="${sm64rom#\"}"

pacman -Syuu

pacman -S unzip make git mingw-w64-i686-gcc mingw-w64-x86_64-gcc mingw-w64-i686-glew mingw-w64-x86_64-glew mingw-w64-i686-SDL2 mingw-w64-i686-SDL mingw-w64-x86_64-SDL2 mingw-w64-x86_64-SDL python3

rm -rf "./sm64ex"

git clone --recursive https://github.com/N00byKing/sm64ex -b archipelago

cd "./sm64ex"

sm64romunixpath=$(cygpath $sm64rom)

git apply enhancements/60fps_ex.patch
git apply enhancements/nonstop_mode_always_enabled.patch

cp ${sm64romunixpath} baserom.us.z64

make EXTERNAL_DATA=0 VERSION=us -j2

if [[ $? -ne 0 ]]; then
    read -p "The build has failed"
    exit -1
fi
