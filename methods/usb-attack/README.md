# USB Attack

**Status:** Research Active

As reported on as of 18th Apr 2025 not yet disclosed security issue: https://thehackernews.com/2025/03/googles-march-2025-android-security.html

This attack abuses `CVE-2024-53197` and `CVE-2024-50302` assuming vulnerable kernel:

* Confirmed vulnerable: https://github.com/facebookincubator/oculus-linux-kernel/blob/oculus-go-kernel-master/sound/usb/quirks.c#L565
* Fixed by: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b909df18ce2a998afef81d58bbd1a05dc0788c40

by pretending to be a **USB Extigy** or **USB Mbox2** device.

```c
for (i = 0; i < dev->descriptor.bNumConfigurations; i++)
    kfree(dev->rawdescriptors[i]);
```

The size of `rawdescriptors` is based on the first read of `bNumConfigurations`

But we can control this second `bNumConfigurations` and make it bigger

Meaning we call `kfree` out-of-bounds

On w/e is past the original buffer

> one of them might be useful to smash the stack then we could do ROP to get privesc, but we ofc need the ASLR info, which seems that CVE-2024-50302 could maybe be useful for

`usb_dump_desc` seems useful.

## References
1. Initial Research https://discordapp.com/channels/1344235945238593547/1344235945674674258/1361932910948778086