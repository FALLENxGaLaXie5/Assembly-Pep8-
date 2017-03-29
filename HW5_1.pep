         ;Joshua Steward
         ;HW #5 (1)


         BR      Main
rain:    .BLOCK 256
currTot: .BLOCK 2
currAve: .BLOCK 2
currEx:  .BLOCK 2
phrase:  .ASCII "Current number: \x00"
average: .ASCII  "Average is: \x00"
out:     .ASCII  "Number of days in which rainfall exceeds the average: "

Main:    LDX     0, i
         LDA     0, i
         STA     currEx, d
record:  CPX     256, i 
         BRGE    ave
         DECI    rain, x
         ADDX    2, i
         BR      record    
ave:     LDX     0, i
ave1:    CPX     256, i
         BRGE    calcAve
         LDA     currTot, d
         ADDA    rain, x
         STA     currTot, d
         ADDX    2, i
         BR      ave1
calcAve: LDA     currTot, d
         ASRA    
         ASRA
         ASRA    
         ASRA
         ASRA
         ASRA
         ASRA
         STA     currAve, d
         LDX     0, i
         STRO    average, d
         DECO    currAve, d
         CHARO   '\n', i
iterate: CPX     256, i
         BRGE    done
         LDA     currAve, d
         CPA     rain, x
         BRLE    addTo
         ADDX    2, i
         BR      iterate
addTo:   LDA     currEx, d
         ADDA    1, i
         STA     currEx, d
         ADDX    2, i
         BR      iterate
done:    STRO    out, d
         DECO    currEx, d
         .END
         STOP

         
         
             