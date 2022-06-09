    .ORIG x3000
    .STRINGZ "HP:9"
    ADD R4, R4, #9 ; starting health
    .STRINGZ "Base attack and defense: 2"
    ADD R3, R3, #2 ; Starting attack and defense (Will only use one register for both for simplicity)
    .STRINGZ "You wake up, sword in hand, the hazards force such an alert sleeping condition. You hear banging at the door"
    .STRINGZ "will you go to answer the door? Or will you sneak out the back door?"
    LD R2, Choice
    JSRR R2






Choice
    .FILL x3100
    
    .END
