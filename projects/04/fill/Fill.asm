// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// while (1)
// {
//      if (check(i)) black
//      else white
// } 

(LOOP)
@24575
D = A
@R0 // 用于储存最大地址 + 1
M = D
@SCREEN
D = A
@R1 // 用于储存当前地址
M = D 

@24576
D = M

@WHITE
D;JEQ

(BLACK) // 将屏幕渲染为黑色
@R1
D = M
A = M
M = -1

@R0
D = M
@R1
D = D - M

@LOOP
D;JEQ

@R1
M = M + 1
@BLACK
0;JMP

(WHITE)
@R1
D = M
A = M
M = 0

@R0
D = M
@R1
D = D - M
@LOOP
D;JEQ

@R1
M = M + 1

@WHITE
0;JMP