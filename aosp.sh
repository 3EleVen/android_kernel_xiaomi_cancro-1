DEFCONFIG=redkancut_aosp_defconfig
make ARCH=arm CROSS_COMPILE=~/gcc/bin/arm-eabi- $DEFCONFIG
make ARCH=arm CROSS_COMPILE=~/gcc/bin/arm-eabi-
rm ~/redkancut/modules/*
for i in `find -name *.ko`; do cp $i ~/redkancut/modules/; done
scripts/dtbToolCM -s 2048 -d "qcom,msm-id = <" -2 -o arch/arm/boot/dt.img -p /usr/bin/ arch/arm/boot/
cp arch/arm/boot/zImage ~/redkancut/
cp arch/arm/boot/dt.img ~/redkancut/
cd ~/redkancut
rm *.zip
zip -r9 redkancut_aosp-v3.1.zip * -x README redkancut_aosp-v3.1.zip
cp *.zip /media/sf_ubuntu/release/
