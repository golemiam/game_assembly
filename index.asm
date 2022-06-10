    .ORIG x3000
HP
    .STRINGZ "HP:9"
    LEA R0, HP
    PUTS
    ADD R4, R4, #9 ; starting health
strength
    .STRINGZ "Base attack and defense: 2\n"
    LEA R0, strength
    PUTS
    ADD R3, R3, #2 ; Starting attack and defense (Will only use one register for both for simplicity)
wake    
    .STRINGZ "You wake up, sword in hand, the hazards force such an alert sleeping condition. You hear banging at the door"
    LEA R0, wake
    PUTS
question
    .STRINGZ "will you go to answer the door? Or will you sneak out the back door?"
    LEA R0, question
    PUTS
    LD R2, Choice
    JSRR R2
    
ending
    .STRINGZ "Thus the end cometh"
    LEA R0, ending
    PUTS




    HALT
Choice
    .FILL x3100
    
    .END
