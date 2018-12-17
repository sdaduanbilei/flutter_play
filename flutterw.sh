#!/bin/bash
# This is flutter build

# 初始化记录项目pwd
projectDir=`pwd`
# 获取 flutter sdk
rootFlutter=`which flutter`
# 提取 flutter skd路径
rootDir=${rootFlutter%/*}

# step1 clean
echo 'clean old build'
find . -depth -name "build" | xargs rm -rf
${rootFlutter} clean


# step2 copy so
echo 'copy so'
cd ${rootDir}/cache/artifacts/engine
for arch in android-arm android-arm-profile android-arm-release ; do
    pushd $arch
    cp flutter.jar flutter-armeabi-v7a.jar #备份
    unzip flutter.jar lib/armeabi-v7a/libflutter.so
    mv lib/armeabi-v7a lib/armeabi
    zip -d flutter.jar lib/armeabi-v7a/libflutter.so
    zip flutter.jar lib/armeabi/libflutter.so
    popd
done

# step3 build
echo 'build apk'
cd ${projectDir} # 回到项目路径,并且编译产物
${rootFlutter} build apk

# step4 unzip apk
echo 'unzip apk'
unzip ${projectDir}/build/host/outputs/apk/release/app-release.apk ${projectDir}/build/host/intermediates
