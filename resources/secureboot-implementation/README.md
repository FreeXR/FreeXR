# The Secureboot implementation of Qualcomm XR2 chip

**Status:** Pending research and review, likely has inaccurate informations

The System-On-Chip ("SoC") has a memory [[what kind of memory?]] inside of itself which allows the vendor to flash a private key into it and then burn an efuse to prevent anyone from overwriting the key that is then processed by the Android Boot Loader ("ABL") to check the `unlock_token` partiton.

The data on the `unlock_token` partition being flashed is made of two parts:
1. "bootloader script"
2. bootloader script's signature (which strangely precedes it).

The "bootloader signature" has the following format:
```
01 <unlock_serial_len>:4 <unlock_serial>:unlock_serial_len
```

The unlock_serial field must of course match the device's.

The signature is verified using **RSA-PSS-SHA-256** and the following public key: [[is this signature on all devices?]]
```
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm+zQa4coLC8LhrK4mYpO
EyCDeTDhhgFp34sCHHklNRh9yZLEjv21XWN6VMTdg4oVAjNNPEvRsGD/AmeTDYh/
g3sMHwWa7H5Plv77np+g9+ogIP/MMCr8OcBNmlmF4sg8RppIkqgqkA/ZJKQDZtEp
JHVeaYCx+llsbYVRXU2NpbQ0t40tuKyaDdze9tP8D1JppLzSaijTpcKmvDkPKerz
MT12Z0zV2Rvg8EdMOr+h/nQb36cMWhPewxyJoAKgcMhoWJiBiEpWO1hfAXt9//C7
bODv7Ygo5CLCM5A49ZP+lHsgBv0Mf4GTCJGLwJ1wBFoy3Dtlxe0/Jlu2RlgUAI1q
TwIDAQAB
-----END PUBLIC KEY-----
```

## Resources

1. QuestEscape exploit: https://github.com/QuestEscape/research
1.1. Bootloader Unlocking: https://github.com/QuestEscape/research?tab=readme-ov-file#unlocking