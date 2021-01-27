
(define (domain Kinght_tour)
(:requirements :strips :negative-preconditions)

(:predicates 
    (at ?col ?row)
    (visited ?col ?row)
    (increase_one ?x ?y)
    (increase_two ?x ?y)
)
(:action move_2colo_1row
    :parameters (?from_col ?from_row  ?to_col ?to_row)

    :precondition (and 
        (at ?from_col ?from_row)
        (increase_two ?from_col ?to_col)
        (increase_one ?from_row ?to_row)
        (not (visited ?to_col ?to_row))
    )
    :effect (and 
        (not(at ?from_col ?from_row))
        (at ?to_col ?to_row)
        (visited ?to_col ?to_row)
    )

)


(:action move_2row_1col
    :parameters (?from_col ?from_row ?to_col ?to_row)
    :precondition (and 
        (at ?from_col ?from_row)
        (increase_one ?to_col ?to_row)
        (increase_two ?to_col ?to_row)
        (not (visited ?to_col ?to_row))
    )
    :effect (and 
        
        (not (at ?from_col ?from_row))
        (at ?to_col ?to_row)
        (visited ?to_col ?to_row)
    )

)

)

