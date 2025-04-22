# EDL Downgrade

Status: xxx

This attack is trying to use Qualcomm's Emergency Download Mode, which allows forced flashing of firmware files. This could potentially allow for bootloader unlock, shown by [Quest Bootloader Unlocker](https://github.com/darknight1050/quest-bootloader-unlocker) which could unlock Q1/2 devices if running old versions. Latest vulnerable version is `16476800118700000 (29.0.0.65.370.289987413)` from May 9 2021 for Quest 2 and `16476800119700000 (29.0.0.66.370.290246252)` from May 10 2021 for Quest 1.

To enter EDL mode on Quest 123P, hold Power + VolUp + VolDown. The fan may start spinning fast, there will be no LED or screen display. USB device will be shown as HS-USB QD-Loader 9008.

## Resources
1. https://github.com/darknight1050/quest-bootloader-unlocker
2. https://en.wikipedia.org/wiki/Qualcomm_EDL_mode