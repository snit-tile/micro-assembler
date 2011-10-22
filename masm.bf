========= Instructions ==========
(None)      : 1
G           : 2
S           : 3
(plus)      : 4
(minus)     : 5
J           : 6
C           : 7
R           : 8
W           : 9
=================================

========= Operand Types =========
Direct      : 0
Indirect    : 1
=================================


============ Symbols ============
#0  char
#1  instruction
#2  isDesiredChar
#3  tmp
#4  readChar
#5  continueParsingLine
#6  continueParsingLineCopy
#7  operandType
=================================


>>>>+                                       #readChar = true
>+                                          #continueParsingLine = true
<                                           #go to readChar
[                                           #while readChar:
    -                                           #readChar = false
    <<<<,                                       #char = readch()
    +[-                                         #if char != EOF:
        >>>>+                                       #readChar = true
        <<<<[->>>+<<<]                              #tmp = char
    ]
    >>>[-<<<+>>>]                               #char = tmp
    <<<                                         #go to char

    ============ Reading ';' (comment marker) ==================================
    >>+                                         #isDesiredChar = true
    <<  -----------------------------------------------------------
    [                                           #if char != 'G'
        +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>-                                         #isDesiredChar = false
        <<[->>>+<<<]                                #tmp = char
    ]
    >>>[-<<<+>>>]                               #char = tmp
    <[                                          #if isDesiredChar:
        >>>[-]                                      #continueParsingLine = false
        <<<-                                        #isDesiredChar = false
    ]
    <<                                          #go to char
    ============================================================================

    >>>>>                                       #go to continueParsingLine
    [                                           #if continueParsingLine
        <<<<<                                       #go to char

        ============ Reading 'G' instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  -----------------------------------------------------------------------
        [                                           #if char != 'G'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <+                                          #instruction = 2
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading 'S' instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  -----------------------------------------------------------------------------------
        [                                           #if char != 'S'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <++                                         #instruction = 3
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading (plus) instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  -------------------------------------------
        [                                           #if char != (plus)
            +++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <+++                                        #instruction = 4
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading (minus) instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  ---------------------------------------------
        [                                           #if char != (minus)
            +++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <++++                                       #instruction = 5
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading 'J' instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  --------------------------------------------------------------------------
        [                                           #if char != 'J'
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <+++++                                      #instruction = 6
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading 'C' instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  -------------------------------------------------------------------
        [                                           #if char != 'C'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <++++++                                     #instruction = 7
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading 'R' instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  ----------------------------------------------------------------------------------
        [                                           #if char != 'R'
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <+++++++                                    #instruction = 8
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        ============ Reading 'W' instruction ======================================
        >>+                                         #isDesiredChar = true
        <<  ---------------------------------------------------------------------------------------
        [                                           #if char != 'W'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            <++++++++                                   #instruction = 9
            >-                                          #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================



        ============ Reading '$' ==================================================
        >>+                                         #isDesiredChar = true
        <<  ------------------------------------
        [                                           #if char != '$'
            ++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
        >>>[-<<<+>>>]                               #char = tmp
        <[                                          #if isDesiredChar:
            >>>>>+                                      #operandType = 1
            <<<<<-                                      #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================



        ============ Reading Operand ===============================================

        ====== 0 =========
        >>+                                         #isDesiredChar = true
        <<  ------------------------------------------------
        [                                           #if char != '0'
            ++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            ++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            ------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 1 =========
        >>+                                         #isDesiredChar = true
        <<  -------------------------------------------------
        [                                           #if char != '1'
            +++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            +++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            -------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 2 =========
        >>+                                         #isDesiredChar = true
        <<  --------------------------------------------------
        [                                           #if char != '2'
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            ++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            --------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 3 =========
        >>+                                         #isDesiredChar = true
        <<  ---------------------------------------------------
        [                                           #if char != '3'
            +++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            +++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            ---------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 4 =========
        >>+                                         #isDesiredChar = true
        <<  ----------------------------------------------------
        [                                           #if char != '4'
            ++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            ++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            ----------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 5 =========
        >>+                                         #isDesiredChar = true
        <<  -----------------------------------------------------
        [                                           #if char != '5'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            +++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            -----------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 6 =========
        >>+                                         #isDesiredChar = true
        <<  ------------------------------------------------------
        [                                           #if char != '6'
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            ------------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 7 =========
        >>+                                         #isDesiredChar = true
        <<  -------------------------------------------------------
        [                                           #if char != '7'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            -------------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 8 =========
        >>+                                         #isDesiredChar = true
        <<  --------------------------------------------------------
        [                                           #if char != '8'
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            --------------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp
        <<<                                         #go to char

        ====== 9 =========
        >>+                                         #isDesiredChar = true
        <<  ---------------------------------------------------------
        [                                           #if char != '9'
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>-                                         #isDesiredChar = false
            <<[->>>+<<<]                                #tmp = char
        ]
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        >>>[
            <<<
            ---------------------------------------------------------
            >>>
            [-<<<+>>>]
        ]#char = tmp


        <[                                         #if isDesiredChar:
            >>>>>>>>>>>>>>>>>>>                         #go to first char of operand
            [>]                                         #go to first available slot on operand
            +                                           #increment slot
            [<]                                         #backs to operandStart
            <<<<<<<<<<<<<<<<<<<<                        #backs to char
            -                                           #decrement char
            [                                           #while char
                -                                           #decrement char
                >>>>>>>>>>>>>>>>>>>>>                       #go to first char of operand
                [>]<                                        #go to last char of operand
                +                                           #increment slot
                [<]                                         #backs to operandStart
                <<<<<<<<<<<<<<<<<<<<                        #backs to char
            ]
            >>[-]                                   #isDesiredChar = false
        ]
        <<                                          #go to char
        ============================================================================


        >>>>>[->+<]                                 #continueParsingLineCopy = continueParsingLine
    ]
    >[-<+>]                                         #continueParsingLine = continueParsingLineCopy
    <<<<<<                                          #go to char



    ============ Reading '\n' or EOF (instruction end) ======================================
    ====== '\n' =========
    >>+                                         #isDesiredChar = true
    <<  ----------
    [                                           #if char != '\n'
        ++++++++++
        >>>>[                                       #if readChar (not EOF):
            <<-                                         #isDesiredChar = false
            >+                                          #tmp = 1
            >-                                          #readChar = 0
        ]
        <[->+<]                                     #readChar = tmp
        <<<[-]                                      #char = 0
    ]
    ++++++++++[-]                               #char = 0


    >>[                                          #if isDesiredChar:
        >>>+                                        #continueParsingLine = true
        <<<                                         #go to isDesiredChar


        =============================== CONVERTING OPERAND ==================================
        ======== Symbols ==========
        #10      operandInt
        #12      currentDigit
        #13      factor
        #14      factorCopy
        #15      multipliedDigit
        #16      ten
        #17      currentDigitCopy
        #20      operandStart
        ===========================

        >>>>>>>>                            #go to 10
        [-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]     #resets positions 10 to 17
        <<<<<<<                             #go to 10
        >>>+                                #factor=1
        >>>>>>>>                            #go to first char of operand
        [>]<                                #go to last char of operand

        [                                   #loops from last to first char of operand
            [->+<]                              #shift right last char of operand
            >[-<<[<]<<<<<<<<+>>>>>>>>>[>]>]     #transfer value to currentDigit
            <<[<]<<<<<<<<                       #go to currentDigit
            ---------- ---------- ----------    #currentDigit minus 30
            ---------- --------                 #currentDigit to int
            >                                   #go to factor
            [                                   #while factor
                -                                   #decrement factor
                >+                                  #increment factorCopy
                <<                                  #go to currentDigit
                [                                   #while currentDigit
                    -                                   #decrement currentDigit
                    >>>+                                #increment multipliedDigit
                    >>+                                 #increment currentDigitCopy
                    <<<<<                               #go to currentDigit
                ]
                >>>>>[-<<<<<+>>>>>]                 #restores currentDigitCopy into currentDigit
                <<<<                                #go to factor
            ]
            >>[-<<<<<+>>>>>]                    #adds multipliedDigit to operandInt
            <                                   #go to factorCopy
            [                                   #while factorCopy
                -                                   #decrement factorCopy
                >>++++++++++                        #ten = 10
                [-<<<+>>>]                          #increment factor 10 times
                <<                                  #go to factorCopy
            ]
            <<[-]                               #resets currentDigit
            >>>>>>>>>[>]<                       #go to new last char of operand
        ]

        <<<<<<<<<<                              #go to #10(operandInt)
        <<<<<<<<                                #go to isDesiredChar

        ======================================================================================




        ============ Debug only ====================================================
        <+                                          #instruction plus 1
        ++++++++++++++++++++++++++++++++++++++++++++++++ .         #print instruction
        [-]                                         #instruction = 0

        >>>>>>++++++++++++++++++++++++++++++++++++++++++++++++.     #print operandType
        [-]                                         #operandType = 0

        >>>.                                        #print operandInt
        [-]                                         #operandInt = 0
        <<<                                         #go to operandType

        <<<<<<                                      #go to instruction

        ++++++++++++++++++++++++++++++++.[-]        #print '\s'
        ============================================================================

        >-                                          #isDesiredChar = false
    ]
    <<                                          #go to char
    ============================================================================

    >>[-]                                   #isDesiredChar = 0
    <<[-]                                   #char = 0

    >>>>                                    #go to readChar
]