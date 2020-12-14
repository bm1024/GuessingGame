"Author: Bianca Magyar"
"Date: 12/14/20"
"Description: Automated guessing game with computer to see how many attempts it takes to guess a number correctly."

Object subclass: GuessGame [
    | rand user count done|
    
     rand := 0.
     user := 0.
    
    setRand: newRand [ ]
    getRand [^rand ]
    
    setUser: newInput [ user := newInput ]
    getUser [ ^user ]
    
    play [
        rand := (1 to: 50) atRandom.
        Transcript show: 'Please enter a whole number between 1 and 100 to make a guess: '.
        user := (1 to: 50) atRandom.
        user printNl.
        
        
        count := 0.
        done := False.
        [done ~= True ] whileTrue: [
            (rand  == user)
                ifTrue: [
                    Transcript show: 'You win! Random number was ', rand printString; cr.
                    Transcript show: 'It took you ', count printString, ' attemtps to guess correctly!';cr.
                    (count < 21 )
                        ifTrue: [
                            Transcript show: 'You are smart!!'
                        ]
                        ifFalse: [
                            Transcript show: 'You need work...'
                        ].
                    done := True.
                ]
                ifFalse: [
                    ( user > rand )
                        ifTrue: [
                            Transcript show: 'Guess is too big'; cr.
                        ]
                        ifFalse: [
                            Transcript show: 'Guess is too small'; cr.
                        ].
                    Transcript show: 'Please try another number: '.
                    user := (1 to: 50) atRandom.
                    user printNl.
                ].
            count := count + 1.
        ]
        
    ]
    
]

g := GuessGame new.
g play.