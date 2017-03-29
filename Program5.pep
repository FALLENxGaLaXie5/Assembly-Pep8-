         ;Joshua Steward
         ;Program 5


         BR      Main
arr1:    .BLOCK 50
arr2:    .BLOCK 50
currV:   .BLOCK 1
arrayL:  .BLOCK 2
numArr1: .BLOCK 2
numArr2: .BLOCK 2
arr1Dec: .BLOCK 100
arr2Dec: .BLOCK 100
intIn:   .BLOCK 2
intPlus: .BLOCK 2
intEq:   .BLOCK 2
currC1:  .BLOCK 1
currC2:  .BLOCK 1
currI1:  .BLOCK 2
currI2:  .BLOCK 2
currI3:  .BLOCK 2
carry:   .BLOCK 2
greater: .BLOCK 2

Main:    LDX     0, i        ;start x off at 0
         LDA     0, i        ; start a off at 0
         STA     numArr1, d  ; store 0 in length of first and second array and carry
         STA     numArr2, d  
         STA     carry, d
topIn:   CHARI   currV, d    ;take character input in
         LDBYTEA currV, d    ;load that character in accumulator
         CPA     '+', i      ;compare to the plus sign - branch to the next array if equal
         BREQ    next
         CHARO   currV, d    ;output character - checking if read in correctly
         STBYTEA arr1, x     ;store in arr1 at byte offset
         LDA     numArr1, d  ;load accumulator into the length of arr1
         ADDA    1, i        ;add 1 to the length
         STA     numArr1, d  ;store length
         ADDX    1, i        ;add 1 to the byte offset x register
         BR      topIn       ;branch back to read in another character
next:    LDX     0, i        ;load 0 into x register
nextIn:  CHARI   currV, d    ;take in character input
         LDBYTEA currV, d
         CPA     '=', i
         BREQ    eval
         CHARO   currV, d
         STBYTEA arr2, x
         LDA     numArr2, d
         ADDA    1, i
         STA     numArr2, d
         ADDX    1, i
         BR      nextIn
eval:    LDX     0, i
         DECO    numArr1, d
         DECO    numArr2, d
         CHARO   '*', i
eval1:   CPX     numArr1, d
         BRGE    eval2
         CHARO   arr1, x
         ADDX    1, i
         BR      eval1
eval2:   LDX     0, i
eval3:   CPX     numArr2, d
         BRGE    findG
         CHARO   arr2, x
         ADDX    1, i
         BR      eval3
findG:   LDA     numArr1, d
         CPA     numArr2, d
         BRGE    arr1Gr
         BR      arr2Gr
arr1Gr:  LDA     numArr1, d
         STA     greater, d
         BR      evalExp
arr2Gr:  LDA     numArr2, d
         STA     greater, d
         BR      startEv
startEv: LDX     numArr1, d
         SUBX    1, i
         STX     numArr1, d
         LDX     numArr2, d
         SUBX    1, i
         STX     numArr2, d
         LDX     greater, d
         SUBX    1, i
         ASRX    
         STX     greater, d
evalExp: LDX     numArr1, d
         CPX     0, i
         BRLE    arr1L
         LDBYTEA arr1, x
         SUBA    '0', i
         STA     currI1, d
         SUBX    1, i
         STX     numArr1, d
         LDX     numArr2, d 
         LDBYTEA arr2, x
         SUBA    '0', i
         STA     currI2, d
         SUBX    1, i
         STX     numArr2, d
         LDX     greater, d
         ADDA    currI1, d
         ADDA    carry, d
         CPA     10, i
         BRGE    carryB
         STA     arr1Dec, x
         SUBX    2, i
         LDA     0, i
         STA     carry, d
         BR      evalExp
carryB:  SUBA    10, i
         STA     arr1Dec, x
         LDA     carry, d
         ADDA    1, i
         STA     carry, d
         BR      evalExp
arr1L:   CPX     greater, d
done:    .END
         STOP
         
         
             