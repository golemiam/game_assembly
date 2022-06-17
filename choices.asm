    .ORIG x4000

    BRnzp Housing
ASCII   .FILL x30 ; Convert to ASCII
NEGASCII .FILL xFFD0 ; Negate the ASCII
house
    .STRINGZ "Type 1 for front, or 2 for back\n"
Housing
    LD R6, ASCII
    LD R5, NEGASCII
    LEA R0, house
    PUTS

    GetC
    OUT
    ADD R0, R0, R5 ; Convert ASCII to int
    ADD R0, R0, #-1 ; decrement to determine route.
    BRz Frontdoor
    BRp Backdoor
Front
    .STRINGZ "\nYou go to open the front door, on the other side you find...\n"
Frontdoor
    LEA R0, Front
    PUTS
    BR Front_end_s
Back
    .STRINGZ "\nYou go out the back door, roll a stealth check (Google d10, roll the dice, input the value as 0-9)\n"
Backdoor
    LEA R0, Back
    PUTS

    GetC
    OUT
    ADD R0, R0, R5 ; Convert ASCII to int
    ADD R2, R0, #0 ; Move value to R2
    ADD R2, R2, #-2 ; Decrement R2 by 2
    ADD R0, R2, #0 ; Move back to R0
    BRp dec_cont
    BRnz Folding
Front_determine
    .STRINGZ "Roll a dexterity check (google d10 and roll, input value as 0-9, 9 being the highest)\n"
Front_end_s
    LEA R0, Front_determine
    PUTS
    GETC
    OUT
    ADD R0, R0, R5 ; Convert ASCII to int
    ADD R0, R0, #-5
    BRp Frontage
    BRnz Front_end
Front_death
    .STRINGZ "A giant club to the face, you die\n"
Front_dead
    LEA R0, Front_death
    PUTS
    BR Front_deading
Front_end
    LEA R0, Front_death
    PUTS
    ADD R4, R4, #-9
    AND R0, R0, #0
    ADD R4, R4, R0
    BR Front_end_ender
Folding
    BR Foldfail
Front_survive
    .STRINGZ "You open the door to a club flying at you and you nimbly dodge"
Frontage
    LEA R0, Front_death
    PUTS    
    BR Frontling
Front_end_ender
    BR Front_end_ended
Front_deading
    BR Front_deads
dec_cont
    ADD R2, R2, #-2 ; Decrement R2 by 2
    BRnz Notterrible_stopped
    ADD R2, R2, #-2 ; Decrement again
    BR Next_stopped
Frontling
    BR Frontsesses
Front_end_ended
    BR Front_end_end_a
Front_deads
    BR Front_corpses
Fold
    .STRINGZ "\nWhen you go to open the door you trip on the chair leg, hit the door with your face, and the door falls off of its hinges and slams to the ground. You take 5 damage.\n"
Foldfail
    LEA R0, Fold
    PUTS
    ADD R4, R4, #-5
    ADD R4, R4, R6
    BR Folded_over
Notterrible_stopped
    BR Notterrible_stop
Next_stopped
    BR Next_stop
Frontsesses
    BR Frontses
Front_end_end_a
    BR Front_end_end
Front_corpses
    BR Front_corps
folded_scramble
    .STRINGZ "While you are on the ground recovering you see an ogre running at you"
Folded_over
    LEA R0, folded_scramble
    PUTS
    BR reaction
reaction_dex
    .STRINGZ "Roll a dex check (google d10 roller 0-9 where 10 is 0)"
reaction
    LEA R0, reaction_dex
    PUTS
    GETC
    
    
Next_stop
    BR next
Notterrible_stop
    BR Notterrible
Front_end_end
    BR almost_ended
Frontses
    BR Frontlings
Front_corps
    BR Front_decay
Notbad
    .STRINGZ "\nYou go to open the back door but you fumble the door, it swings open loudly\n"
Notterrible
    LEA R0, Notbad
    PUTS
    BRnzp almost_ended
Frontlings
    BR Front_dex
Front_decay
    BR Front_decaying
next
    BRnz Almost
    ADD R2, R2, #-2 ; decrement
    BRnzp next2
almost_ended
    BR really_almost_end
Front_dex
    BR Front_exec
Front_decaying
    BR Front_pastfeeling
Almostgotit
    .STRINGZ "\nYou open the door quietly, and you attempt to walk away but you are seen.\n"
Almost
    LEA R0, Almostgotit
    PUTS
ending
    BR really_almost_end
next2
    BRnz Success
    BRp CritSuccess
Front_exec
    BR Frontings
Front_pastfeeling
    BR Frontses_past
really_almost_end
    BR frontses_past
Successful
    .STRINGZ "\nYou manage to open the door quietly and you escape.\n"
Success
    LEA R0, Successful
    PUTS
    BR frontses_past
Frontings
    BR Fight
Frontses_past
    BR endses
Crit
    .STRINGZ "\nYou are so stealthy when you leave you managed to make your bed, and clean up without being heard, made\nit look like no one has been there for a long time.\n"
CritSuccess
    LEA R0, Crit
    PUTS
    BR end
endses
    BR end
fight_start_after_dodge
    .STRINGZ "The ogre swung his club so hard it broke your door."
Fight
    LEA R0, fight_start_after_dodge
    PUTS
    BR fight_continues
fight_cont_s
    .STRINGZ "After you dodge, you see the ogre unprepared. You strike him down\n"
fight_continues
    LEA R0, fight_start_after_dodge
    PUTS
    BR end
end
    RET


    .END
