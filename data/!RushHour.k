7 5 8 9 10 1 7 9
10
0
1000
64
30
60
200
Rush Hour by hap, 08.02.08, hap.samor.nl.  Originally released on 17-12-06. This game contains 170 puzzles. The goal of the game is to slide the arrow block(s) out of the 6*6 grid.


=========================
Rush Hour (v1.1) for CHIP-8 by hap 08-02-08, http://hap.samor.nl/
Originally released on 17-12-06. Version 1.1 improves a few things.
Based on a boardgame by Nobuyuki Yoshigahara "Nob" and ThinkFun,
http://www.thinkfun.com/

This game contains 170 puzzles. Most were taken from the original cardsets,
some were made by me, and some were generated with Michel's PyTraffic,
http://alpha.uhasselt.be/Research/Algebra/Members/pytraffic . Refer to
the source code for detailed information on this.

HOW TO PLAY
===========

The goal of the game is to slide the arrow block(s) out of the 6*6 grid.
Completing 10 boards will be awarded with the inclusion of the next boardset(s)
as seen from the connections on the boardset select screen, a password will be
given so you don't have to complete the game in a single session.

 HEX key   PC key*   Use
---------------------------
 5         W         up
 8         S         down
 7         A         left
 9         D         right
 A         Z         ok/hold to slide
 1         1         option(in-game)/back

* = for interpreters that have the 4*4 keypad at 1234/QWER/ASDF/ZXCV.

===========================




//INSTRUCTIONS
It's important not to change layout of first 9 lines of this file.
The name of the config file should be the same as the name of the corresponding game <gamename.k>
- key mapping separated by spaces
- foreground color
- background color
- delay
- compatibility flags
- quantity of opcodes run before TFT updates
- timers frequency
- sound tone frequency
- .ch8 file description


1. KEY MAPPING
first line is the list of chi8 keys separated with spaces corresponded to ESPboy keys

ESPboy keys
0-LEFT, 1-UP, 2-DOWN, 3-RIGHT, 4-ACT, 5-ESC, 6-LFT side button, 7-RGT side button

Chip8 keys
1     2     3       C[12]
4     5     6       D[13]
7     8     9       E[14]
A[10] 0[0]   B[11]  F[15]

2. FOREGROUND COLOR
no of color according to the list
0-BLACK  1-NAVY  2-DARKGREEN  3-DARKCYAN  4-MAROON
5-PURPLE  6-OLIVE  7-LIGHTGREY  8-DARKGREY  9-BLUE
10-GREEN  11-CYAN  12-RED  13-MAGENTA  14-YELLOW
15-WHITE  16-ORANGE  17-GREENYELLOW  18-PINK

3. BACKGROUND COLOR
no of color according to the same list

4. DELAY
delay in microseconds before each instruction

5. COMPATIBILITY FLAGS
are used to turn on/off few emulator tricks
details https://github.com/Chromatophore/HP48-Superchip

8XY6/8XYE opcode
Bit shifts a register by 1, VIP: shifts rY by one and places in rX, SCHIP: ignores rY field, shifts existing value in rX.
bit1 = 1    <<= amd >>= takes vx, shifts, puts to vx, ignore vy
bit1 = 0    <<= and >>= takes vy, shifts, puts to vx

FX55/FX65 opcode
Saves/Loads registers up to X at I pointer - VIP: increases I by X, SCHIP: I remains static.
bit2 = 1    load and store operations leave i unchaged
bit2 = 0    I is set to I + X + 1 after operation

8XY4/8XY5/8XY7/ ??8XY6??and??8XYE??
bit3 = 1    arithmetic results write to vf after status flag
bit3 = 0    vf write only status flag

DXYN
bit4 = 1    wrapping sprites
bit4 = 0    clip sprites at screen edges instead of wrapping

BNNN (aka jump0)
Sets PC to address NNN + v0 - VIP: correctly jumps based on value in v0. SCHIP: also uses highest nibble of address to select register, instead of v0 (high nibble pulls double duty). Effectively, making it jumpN where target memory address is N##. Very awkward quirk.
bit5 = 1    Jump to CurrentAddress+NN ;4 high bits of target address determines the offset register of jump0 instead of v0.
bit5 = 0    Jump to address NNN+V0

DXYN check bit 8
bit6 = 1    drawsprite returns number of collised rows of the sprite + rows out of the screen lines of the sprite (check for bit8)
bit6 = 0    drawsprite returns 1 if collision/s and 0 if no collision/s

EMULATOR TFT DRAW
bit7 = 1    draw to TFT just after changing pixel by drawsprite() not on timer
bit7 = 0    redraw all TFT from display on timer

DXYN OUT OF SCREEN check bit 6
bit8 = 1    drawsprite does not add "number of out of the screen lines of the sprite" in returned value
bit8 = 0    drawsprite add "number of out of the screen lines of the sprite" in returned value
*/

for example for AstroDodge game should be set as (binary)01000011 = (decimal)67


6. Quantity of opcodes runs till screen update. Works if you don't use TFT_DRAW bit7 of COMPATIBILITY FLAGS

7. TIMERS FREQUENCY
Setting up the frequency of CHIP8 timers. Standart is 60Hz

8. SOUND TONE
the freq tone of sound

9. GAME INFO
write 314 symbols of information you'll see before the game starts
