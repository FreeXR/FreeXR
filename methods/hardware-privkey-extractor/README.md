# Hardware Private Key Extractor

Status: Research Active

This attack is trying to re-invent the method presented in [QuestEscape](https://github.com/QuestEscape) combined with [CVE-2021-1931](https://nvd.nist.gov/vuln/detail/CVE-2021-1931) to overflow the buffer in fastboot fixed in this commit https://github.com/tianocore/edk2/commit/0727b7b0d4cafb091397b76f75a3a4f66852a361 to dump the private key from the XR2 chips which is all that is needed to unlock the bootloader.

The idea is to get a vulnerable board, exploit it and recreate the vulnerability to then engineer a hotswappable SoC socket (e.g. with pogo pins and custom made jig that mounts to the PCB) to create a workflow that dumps the private key to the USB flash disk which would enable us to unlock any XR2 chip that is inserted to this jig.

See `../resources/secureboot-implementation` for details on how the secure boot is implemented

## Resources

1. https://github.com/QuestEscape
2. https://github.com/darknight1050/quest-bootloader-unlocker