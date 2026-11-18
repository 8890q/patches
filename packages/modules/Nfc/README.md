# NCI 1.x screen-off polling

Android 17 configures ordinary tag polling while the screen is off and relies
on NCI 2.0 screen-state commands to gate it. NCI 1.x controllers cannot use
those commands. This patch restores discovery-based gating for NCI 1.x and
serializes the routing update with the screen-state message.

Ordinary polling stops on screen off and while locked. Explicit lockscreen
unlock/provisioning polling and host card-emulation routing are retained.
The NCI 2.x discovery policy is unchanged.

The herolte baseline lost 87-88% charge over approximately 15h25 with only
26 seconds of screen-on time. CPU awake time was approximately 78%; sec-nfc
accounted for about 26,700 wakeups and its wake lock was held for 9h54.
NFC reported NCI 1.0, screen OFF_LOCKED, and the default polling mask.

Validation: the unmodified production discovery method reproduces the
screen-off polling regression. The corrected method and the production
NfcDiscoveryParameters class pass 393 host assertions covering NCI 1.x/2.x,
screen states, reader mode, HCE, provisioning and lockscreen opt-in.
Patch replay matches the committed source tree. Android unit regressions
are included; their execution and an unplugged deep-sleep test await the
next ROM build. USB prevents a meaningful on-cable suspend measurement.
