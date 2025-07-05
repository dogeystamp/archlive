#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="dogeyrescue"
iso_label="DOGEY_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="dogeystamp <https://www.dogeystamp.com>"
iso_application="Arch Linux Live/Rescue DVD, customized"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp'
           'uefi-ia32.systemd-boot.eltorito' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/home/julius/.local/bin/imgv.sh"]="0:0:700"
  ["/home/julius/.local/bin/newterm.sh"]="0:0:700"
  ["/home/julius/.local/bin/nv"]="0:0:700"
  ["/home/julius/.local/bin/nv-man"]="0:0:700"
  ["/home/julius/.local/bin/ping-up.sh"]="0:0:700"
  ["/home/julius/.local/bin/cb"]="0:0:700"
  ["/home/julius/.local/bin/niri-swal.sh"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"
)
