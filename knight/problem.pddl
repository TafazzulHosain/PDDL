(define (problem problem_name) 
(:domain Kinght_tour)
(:objects n1 n2 n3 n4
)

(:init
    (at n1 n4)
    (visited n1 n4)
    
    ;increase by one

    (increase_one n1 n2)
    (increase_one n2 n1)

    (increase_one n2 n3)
    (increase_one n3 n2)

    (increase_one n3 n4)
    (increase_one n4 n3)

    ;increse by two

    (increase_two n1 n3)
    (increase_two n3 n1)

    (increase_two n2 n4)
    (increase_two n4 n2)

)

(:goal (and
    
    (visited n1 n1)
    (visited n1 n2)
    (visited n1 n3)
    (visited n1 n4)
    
    ))



)
