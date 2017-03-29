

BININ:   STA     -2, s       ;save register A
         STX     -4, s       ;save register X
         LDA     32768, i    ; start bit add at 32768 - will be shifted right every iteration
         STA     2, s
         LDA     0, i        ;clearing register A
         STA     4, s        
         LDX     0, i        ;clearing register X
BININ1:  CPX     16, i       ;compare to 16 - if more, finished reading in
         BRGE    done
         DECI    6, s        ;input 0 or 1
         LDA     6, s        ;load into accumulator
         CPA     1, i        ;if 1, go to ones branch
         BREQ    ones
         BR      zeros       ;otherwise, branch to zeros
ones:    LDA     4, s        ; for ones, load the total decimal number so far
         ADDA    2, s        ; add the current iterative binary value
         STA     4, s        ;store in stack
         LDA     2, s        ;shift binary number
         ASRA
         STA     2, s
         ADDX    1, i
         BR      BININ1
zeros:   LDA     2, s        ;don't change for zeros - just shift right for next value
         ASRA
         STA     2, s
         ADDX    1, i
         BR      BININ1
done:    LDA     4, s
         STA     8, s
         LDA     -2, s       ;restoring register A
         LDX     -4, s       ;restoring register X
         RET0