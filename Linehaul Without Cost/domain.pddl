;Header and description

(define (domain Line_haul)

;remove requirements that are not needed
(:requirements :strips :typing )

(:types 
    
    truck location quantity - objects

    Ref_truck - truck

)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    
    (at ?t - truck ?l - location )
    (free_capacity ?t - truck ?q - quantity)
    (demand_ambient_goods ?l - location ?q - quantity)
    (demand_chilled_goods ?l - location ?q - quantity)
    (plus1 ?q1 ?q2 - quantity)

)


(:functions ;todo: define numeric functions here
)

; for ambient goods
(:action ambient_goods
    :parameters (?t - truck ?l - location ?d_less_one ?d ?c_less_one ?c - quantity)
    :precondition (and 
        (at ?t ?l)
        (demand_ambient_goods ?l ?d)
        (free_capacity ?t ?c)
        (plus1 ?d_less_one ?d) ; True Until demand is full fill
        (plus1 ?c_less_one ?c) ; True Until capacity is full fill
    )
    :effect (and 
        (not (demand_ambient_goods ?l ?d))
        (demand_ambient_goods ?l ?d_less_one)
        (not (free_capacity ?t ?d))
        (free_capacity ?t ?d_less_one)
    )
)

    ; for Chilled goods
(:action chilled_goods
    :parameters (?t - Ref_truck ?l - location ?d_less_one ?d ?c_less_one ?c - quantity)
    :precondition (and 
        (at ?t ?l)
        (demand_chilled_goods ?l ?d)
        (free_capacity ?t ?c)
        (plus1 ?d_less_one ?d) ; True Until demand is full fill
        (plus1 ?c_less_one ?c) ; True Until capacity is full fill
    )
    :effect (and 
        (not (demand_chilled_goods ?l ?d))
        (demand_chilled_goods ?l ?d_less_one)
        (not (free_capacity ?t ?d))
        (free_capacity ?t ?d_less_one)
    )

)
(:action drive
    :parameters (?t - truck ?from ?to - location)
    :precondition (and 
        (at ?t ?from)
    )
    :effect (and 
        
        (not (at ?t ?from ))
        (at ?t ?to)

    )
)



)
