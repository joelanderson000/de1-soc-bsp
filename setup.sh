#!/bin/sh

echo "Configuring environment variables for Yocto build system..."

CWD=$(pwd)

# Set Versions
export LINUX_VER=6.12.43
export UBOOT_VER=v2025.01

export MACHINE="de1-soc"

export PATH="$CWD/u-boot-socfpga/arch/arm/mach-socfpga/cv_bsp_generator:$PATH"

# Set Linux Version
echo "LINUX_VERSION        = $LINUX_VER"
LINUX_SOCFPGA_BRANCH=socfpga-$LINUX_VER-lts
echo "LINUX_SOCFPGA_BRANCH = $LINUX_SOCFPGA_BRANCH"

# Set U-Boot Version
export UBOOT_REL=
echo "UBOOT_VERSION        = $UBOOT_VER$UBOOT_REL"
UBOOT_SOCFPGA_BRANCH=socfpga_$UBOOT_VER$UBOOT_REL
echo "UBOOT_SOCFPGA_BRANCH = $UBOOT_SOCFPGA_BRANCH"

. layers/openembedded-core/oe-init-build-env