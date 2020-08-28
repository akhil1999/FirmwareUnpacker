#!/bin/bash
echo "Akhil99's Samsung Firmware Extractor"
echo "Version 1 Beta"
echo " "
echo "Detecting Firmware..."
zip=$(find *.zip)
echo "Found Firmware: $zip"
echo " "
mkdir extracted
unzip $zip -d extracted
cd extracted
echo " "
APmd5=$(find AP*.tar.md5)
echo "Found AP:$APmd5"
echo " "
echo "Extracting AP tar..."
mv AP*.tar.md5 AP.tar
echo " "
tar -xvf AP.tar
echo " "
mkdir images
mv *.lz4 images
cd images
echo " "
echo "Extracting images..."
lz4 -d boot.img.lz4 boot.img
lz4 -d system.img.lz4 system.img
lz4 -d vendor.img.lz4 vendor.img
lz4 -d product.img.lz4 product.img
lz4 -d odm.img.lz4 odm.img
echo "Firmware image extraction complete, find it in /extracted/images/ directory"
echo "To extract the images further, please use a tool like Henry's Unpacker"
echo "Find the tool over here: https://forum.xda-developers.com/android/software/tool-henry-s-unpacker-unpack-repack-t4139005"
