         ;Joshua Steward
         ;HW #5 (1)


get:     SUBSP   2, i
         LDX     4, s
         SUBX    1, i
         ASLX
         LDX     B, x
         ADDX    6, s
         ADDX    6, s
         SUBX    4, i
         LDA     0, x
         STA     8, s
         RET0


put:     LDX     2, s
         SUBX    1, i
         ASLX
         LDX     B, x
         ADDX    4, s
         ADDX    4, s
         SUBX    4, i
         LDA     6, s
         STA     B, x
         RET0
         
         .END
         STOP

         
         
             