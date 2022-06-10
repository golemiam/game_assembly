    .ORIG x3100
    BRnzp start
    
start


House
    .STRINGZ "Type 1 for front, or 2 for back"
    LEA R0, House
    PUTS
    
    GetC
    ADD R0, R0, R5 ; Convert ASCII to int
    ADD R1, R0, #0 ; Move input to R1
    ADD R1, R1, #-1 ; Decrement R1
    BRz Frontdoor
    BRp Backdoor
Front
    .STRINGZ "You go to open the front door, on the other side you find..." 
Frontdoor
    LEA R0, Front
    PUTS
Back
    .STRINGZ "You go out the back door, roll a stealth check (Google d10, roll the dice, input the value)"
Backdoor
    LEA R0, Back
    PUTS

    GetC
    ADD R0, R0, R5 ; Convert ASCII to int
    ADD R2, R0, #0 ; Move value to R2
    ADD R2, R2, #-2 ; Decrement R2 by 2
    ADD R0, R2, #0 ; Move back to R0
    BRnz Foldfail
    ADD R2, R2, #-2 ; Decrement R2 by 2
    BRnz Notterrible
    ADD R2, R2, #-2 ; Decrement again
    BRnzp next
Fold
    .STRINGZ "When you go to open the door you trip on the chair leg, hit the door with your \nface, and the door falls off of its hinges and slams to the ground. You take 5 damage."
Foldfail
    LEA R0, Fold
    PUTS
    ADD R4, R4, #-2
    ADD R4, R4, R6
Notbad
    .STRINGZ "You go to open the back door but you fumble the door and it swings open loudly"
Notterrible
    LEA R0, Notbad
    PUTS
next
    BRnz Almost
    ADD R2, R2, #-2 ; decrement
    BRnzp next2
Almostgotit
    .STRINGZ "You open the door quietly, and you attempt to walk away but you are seen."    
Almost
    LEA R0, Almostgotit
    PUTS
next2
    BRnz Success
    BRp CritSuccess
Successful
    .STRINGZ "You manage to open the door quietly and you escape."
Success
    LEA R0, Successful
    PUTS
Crit
    .STRINGZ "You are so stealthy when you leave you managed to make your bed, and clean up without being heard, made\nit look like no one has been there for a long time."
CritSuccess
    LEA R0, Crit
    PUTS
    RET
    LD R6, ASCII
    LD R5, NEGASCII
ASCII   .FILL x30 ; Convert to ASCII
NEGASCII .FILL xFFD0 ; Negate the ASCII
    .END
