# arch linux live rescue disk

![preview](https://raw.githubusercontent.com/dogeystamp/dots/main/preview.jpg)

This is a modified Arch Linux live USB image, built using [Archiso](https://wiki.archlinux.org/title/Archiso).
The live system includes a graphical environment with the [Niri](https://github.com/YaLTeR/niri) window manager, and includes customizations from my [dotfiles](https://github.com/dogeystamp/dots).

The custom desktop environment is intended to be a comfortable experience specifically for myself.
However, you can inspire yourself from `add_dotfiles.sh`, `bootstrap_packages.x86_64` and `airootfs` to
make an archiso image that uses your own dotfiles.
I recommend that you [create an archiso profile](https://wiki.archlinux.org/title/Archiso#Prepare_a_custom_profile)
from scratch to avoid being hindered by my modifications.

## installation

The following steps explain how to create a live USB using this image.
You should be on Arch Linux to run `archiso`.
If you are on a different system, consider using [portable archiso](https://github.com/dogeystamp/archiso-portable),
an older project of mine,
or simply use the [default Arch Linux ISO](https://archlinux.org/download/) that is not customized.

+ Install the `archiso` package on your system.

+ Run the `build.sh` script,
    which first downloads the dotfiles from GitHub using [chezmoi](https://www.chezmoi.io/),
    then runs archiso.

    - Run the script without root. You will be prompted for root permissions.
    - You must run the script from this directory (the root of this repository).

+ The resulting ISO file will be placed in the `out/` directory.

+ Follow the [USB flash installation medium](https://wiki.archlinux.org/title/USB_flash_installation_medium)
    article on the Wiki to flash the ISO file to a USB drive.
    I would recommend either using `cat` (the simplest method),
    or using [manual formatting](https://wiki.archlinux.org/title/USB_flash_installation_medium#BIOS_and_UEFI)
    which lets you add a separate [data partition](https://wiki.archlinux.org/title/USB_flash_installation_medium#Add_an_additional_data_partition_to_the_drive) to the USB drive which will persist between reboots.

After [booting from the USB](https://wiki.archlinux.org/title/Installation_guide#Boot_the_live_environment),
you will be presented with the Niri window manager.
If you do not know the keyboard shortcuts,
press `Alt-Shift-/` (alt plus question mark) to get help.
For more information about using the live system,
start a terminal (`Alt-Shift-Enter`) and open README.txt:

    less README.txt

Alternatively, use Neovim, which is included in the image:

    nvim README.txt

The `README.txt` file is also [available in this repository](airootfs/home/julius/README.txt).

## testing the image

You can test the ISO image without actually booting it on a computer.
To do this, use the `run_archiso` script included in the `archiso` package.
See the [Wiki](https://wiki.archlinux.org/title/Archiso#Test_the_ISO_in_QEMU)
for more details.

Since Niri was buggy in the VM for me, I had to make some changes to the script,
and I have included this modified script in `run_archiso` in this repository.
If QEMU shows a "Display output is not active" when Niri is running,
use the patched `run_archiso`.
Then, resize the window to get Niri to run.
(I don't know why this happens, but that's the workaround I used.)
