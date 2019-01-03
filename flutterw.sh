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

# step3 package get
echo 'packages get'
cd ${projectDir} # 回到项目
${rootFlutter} packages get

# step4 build
echo 'build apk'
${rootFlutter} build apk

# step4 unzip apk
echo 'unzip apk'
cd ${projectDir}/build/host
mkdir apkfile
unzip ${projectDir}/build/host/outputs/apk/release/app-release.apk -d ${projectDir}/build/host/apkfile/

# step4 copy assets / lib
echo 'copy assets / lib'
mv ${projectDir}/build/host/apkfile/assets/ ${projectDir}/.android/Flutter/src/main/
mv ${projectDir}/build/host/apkfile/lib/ ${projectDir}/.android/Flutter/src/main/

# step5 build aar
echo 'publish aar'
cd ${projectDir}/.android
./gradlew clean flutter:assembleRelease artifactoryPublish --info

# step6 remove assets/lib
echo 'remove assets/lib'
cd ${projectDir}/.android/Flutter/src/main/
rm -rf assets
rm -rf lib

echo 'succccccccccccccccccccccccccccccccccc'
exit

