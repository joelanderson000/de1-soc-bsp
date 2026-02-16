# Linux build for DE1-SOC

## Project Setup
1. Install necessary system dependencies listed [in the yoco quick start setup steps](https://docs.yoctoproject.org/1.8/yocto-project-qs/yocto-project-qs.html)
2. Clone this repo and pull the module dependencies with `git submodule update --init --recursive`
3. update environment with `source setup.sh` 

## Building an image
1. run bitbake build command: `bitbake console-image-minimal
2. Image saves in the default directory under build/tmp/deploy/images

## Updating the meta-de1-soc recipes
### Set up workspace
#### VSCode Yocto Plugin
Project has .vscode directory checked in so config should load if plugin is installed. By default, a lot of the build folder is hidden from the editor. Adjust the settings.json in the .vscode directory for alternate workflows. 
1. Navigate to yocto tab on left hand side of editor.
2. click `New devtool workspace` and enter the name of the recipe you would like to modify.
    1. u-boot-socfpga
    2. linux-socfpga-lts
3. open the recipe. A new editor window will open with the targeted source code for modification.
#### Equivalent devtool commands
1. run the devtool command to set up a workspace
    1. u-boot: `devtool modify u-boot-socfpga -O`
    2. linux kernel: `devtool modify linux-socfpga-lts -O`
### Make modifications
1. Edit files in workspace. It should be on `devtool` branch.
2. In main window, run `devtool build NAME` to test changes.

### Save Changes
1. Commit changes to devtool branch
2. for simplicity, I was using a single commit/patch for all my changes. to update an existing commit with new changes.
    1. run `git log` to check if your original commit exists in the workspace (it should. Just a sanity check). You should see two commits with your name.
    2. rebase changes into one commit. throw away the second commit message. I do this with an interactive rebase.
        1. start interactive rebase `git rebase -i`. It will open your default editor with rebase options.
        2. Change `pick` on the bottom commit to `fixup`
        3. Save and quit
3. update the recipe with the new changes using devtool: `devtool update-recipe NAME -a path/to/meta-de1-soc

## Flashing to SD Card
1. navigate to images directory
2. use `lsblk` to determine what name your SD card has been asigned by the OS (ex. /dev/sde)
3. Double check your target is correct. The following steps **will destroy** any data on the target.
4. use `dd` to copy the wic file to the SD card `dd if=your-input-wic-file of=/dev/sdtarget bs=1M status=progress`
5. execute the `sync` command and wait for the process to complete


# Resources
## Tools Used
- Intel/Altera Quartus lite 25.1

## Project Dependencies
- https://github.com/joelanderson000/meta-de1-soc.git

## Upstream Dependencies
- https://github.com/altera-fpga/u-boot-socfpga
- https://git.openembedded.org/bitbake/
- https://git.openembedded.org/openembedded-core/
- https://git.yoctoproject.org/meta-intel-fpga

## Resources that helped me learn about this
- https://wiki.trenz-electronic.de/display/PD/Create+a+custom+BSP+layer+for+Intel+SoC+or+FPGA
- https://www.youtube.com/watch?v=2WUkEt4-Q7Q

## Other Useful References
- https://docs.altera.com/r/docs/683126/21.2/cyclone-v-hard-processor-system-technical-reference-manual/cyclone-v-hard-processor-system-technical-reference-manual-revision-history
- https://documentation-service.arm.com/static/5e8e3d1dfd977155116aa14a
- https://docs.yoctoproject.org/
- https://altera-fpga.github.io/rel-24.3.1/embedded-designs/agilex-5/e-series/modular/gsrd/ug-gsrd-agx5e-modular/
- https://github.com/altera-fpga/gsrd-socfpga

