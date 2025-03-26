%Predicados
%PadreDe------------------------------------
padreDe( Padre, Hijo ) :- 
    padreLista( Padre, Hijos ),
    member( Hijo, Hijos ).

padreLista( abraham_simpson, [homero_simpson, herbert_powell] ).
padreLista( clancy_bouvier, [marge_simpson, patty_bouvier, selma_bouvier] ).
padreLista( homero_simpson, [bart_simpson, lisa_simpson, maggie_simpson] ).
%MadreDe-----------------------------------------
madreDe( Madre, Hijo ) :-
    madreLista( Madre, Hijos ),
    member( Hijo,Hijos ).

madreLista( mona_simpson, [homero_simpson] ).
madreLista( jacqueline_bouvier, [marge_simpson, patty_bouvier, selma_bouvier] ).
madreLista( marge_simpson, [bart_simpson, lisa_simpson, maggie_simpson] ).
madreLista( selma_bouvier, [ling_bouvier] ).
%Reglas-------------------------------------------

%AbueloDe-----------------------------------------
abueloDe( X,Y ) :-
    padreDe( X,Z ), 
    padreDe( Z,Y ) ; madreDe( Z,Y ).
%AbuelaDe-----------------------------------------
abuelaDe( X,Y ) :-
    madreDe( X,Z ) ,
    padreDe( Z,Y ) ; madreDe( Z,Y ).
%nieto_nietaDe------------------------------------
nieto_nietaDe( X,Y ) :-
    padreDe( Z,X ) ,
    padreDe( Y,Z ) ; madreDe( Y,Z ).
nieto_nietaDe( X,Y ) :-
    madreDe( Z,X ) ,
    padreDe( Y,Z ) ; madreDe( Y,Z ).
%hermano_hermanaDe--------------------------------
hermano_hermanaDe( X,Y ) :-
    madreDe( Z,X ) ,
    madreDe( Z,Y ) , X\= Y.
hermano_hermanaDe( X,Y ) :-
    padreDe( C,X ) , 
    padreDe( C,Y ) , X\= Y.
%Tio_TiaDe----------------------------------------
tio_tiaDe( X,Y ) :- 
    hermano_hermanaDe( X,Z ), 
    (padreDe( Z,Y ) ; madreDe( Z,Y )).
%Sobrino_sobrinaDe--------------------------------
sobrino_sobrinaDe( X,Y ) :- 
    (padreDe( Z,X ) ; madreDe( Z,X )), 
    hermano_hermanaDe( Z,Y ).
%Primo_PrimaDe------------------------------------
primo_primaDe( X,Y ) :- 
    (padreDe( Z,X ) ; madreDe( Z,X )), 
    hermano_hermanaDe( Z,T ), 
    (padreDe( T,Y ) ; madreDe( T,Y )).