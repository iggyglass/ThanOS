# ThanOS
For when you need to perfectly balance your hard drive.

## What
Basically it just makes half of the data in your hard drive 1s and the other half 0s. it only does this with the second hard drive you have installed (think of the `D:\` drive on Windows), thus not destroying itself.

## Why
The pun was too good to pass up.

## Binary
The binary of the most recent build of this project can be found in `bin/boot.bin`. As of writing, the entire system takes up 1KB of disk space.

## Assembling 
For testing this project, I personally used [NASM](https://www.nasm.us/), however any assembler of your choosing *should* as well, assuming it uses the same syntax. If you are on a Windows system, I have included my batch file (`compile.bat`) that I use when I need to assemble the project.

## Emulating
If for some reason you don't wish to *actually delete all of the files on your hard drive*, and wish to emulate a system instead, then I can recommend [QEMU](https://www.qemu.org/), which is what I used for testing. To test writing to a hard drive, I wrote a python script (`test/imgGen.py`) to generate a `.img` file for usage as a fake hard drive. By default, it is filled with 1.44MB of `0xAB` (Thus making the emulated drive 1.44MB in size). If you are on a Windows system, I have included my batch file (`run.bat`) that I use when I need to emulate this project. 

## Usage
### Normal operation
When operating error-free, a pointer icon should should appear while the drive is being written to (See below).
<img src="docs/pointer.png" alt="Pointer Image"/>

When writing is finished, a popping icon should appear. At this point, the user can press F5 to reboot the machine. 
<img src="docs/snap.png" alt="Popping Image"/>

### Errors
If something isn't working, an error code may appear on screen. The full list of error codes are as follows, though most of these *should* never occur, no matter what your hardware or emulation setup is, but it is still *theoretically possible* that they somehow get outputted, hence why they are included. 

| Error Code | Meaning                                 |
|------------|-----------------------------------------|
| 01         | Invalid Command                         |
| 02         | Cannot Find Address Mark                |
| 03         | Attempted Write On Write Protected Disk |
| 04         | Sector Not Found                        |
| 05         | Reset Failed                            |
| 06         | Disk Change Line Active                 |
| 07         | Disk Parameter Activity Failed          |
| 08         | DMA Overrun                             |
| 09         | Attempt to DMA Over 64KB Boundary       |
| 0A         | Bad Sector Detected                     |
| 0B         | Bad Cylinder/Track Detected             |
| 0C         | Media Type Not Found                    |
| 0D         | Invalid Number of Sectors               |
| 0E         | Control Data Address Mark Detected      |
| 0F         | DMA Out of Range                        |
| 10         | CRC/ECC Data Error                      |
| 11         | ECC Corrected Data Error                |
| 15         | BIOS Extension Methods Not Supported    |
| 20         | Drive Controller Failure                |
| 40         | Drive Seek Failure                      |
| 80         | Drive Timed Out                         |
| AA         | Drive Not Ready                         |
| BB         | Undefined Error                         |
| CC         | Write Fault                             |
| E0         | Drive Status Error                      |
| FF         | Sense Operation Failed                  |

### Notes
Currently, because of the LBA addressing used, ThanOS can support drives up to about 2.2TB, or 2TiB, in size
