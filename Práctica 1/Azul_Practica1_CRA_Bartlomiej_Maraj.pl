% Autor:  Bartlomiej Maraj
% Fecha: 26/02/2020


% ---------- JUGADOR ------------------------------------------------------------------------------------
% Fichas(Verde,Negro,Rojo,Naranja,Azul), 100 fichas en total (bolsa), 4 fichas por factoria.
% 0 = vac�o, 1 = verde, 2 = negro, 3 = rojo, 4 = naranja, 5 = azul
% Jugador(puntos,lineas_patron,pared,linea_suelo)
% lineas_patron([[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]])
% pared([[15,14,13,12,11],[11,15,14,13,12],[12,11,15,14,13],[13,12,11,15,14],[14,13,12,11,15]])
% 11 = huecoVerde, 12 = huecoNegro, 13 = huecoRojo, 14 = huecoNaranja, 15 = huecoAzul
% lineas_suelo([0,0,0,0,0,0,0])  = 7 fichas (Recomendaci�n del profe)
%
% ---------- MESA ---------------------------------------------------------------------------------------
% Factor�a([0,0,0,0])
% Factor�as([Factor�a,Factor�a,Factor�a,Factor�a,Factor�a,Factor�a,Factor�a,Factor�a,Factor�a]) 9 factorias
% Centro_mesa([]) 27 azulejos como m�x: 3*9factor�as
% Bolsa_fichas ( [1,1,...1,2,2,...,5,5])  A[100 azulejos : 20 de cada]
% Caja_fichas ( [])

azulejo(0, vacio).
azulejo(1, verde).
azulejo(2, negro).
azulejo(3, rojo).
azulejo(4, naranja).
azulejo(5, azul).
azulejo(10, marcador_jugador_inicial).
azulejo(11, hueco_verde).
azulejo(12, hueco_negro).
azulejo(13, hueco_rojo).
azulejo(14, hueco_naranja).
azulejo(15, hueco_azul).

arrayFactorias(2,ArrayID):- ArrayID = [1,2,3,4,5].
arrayFactorias(3,ArrayID):- ArrayID = [1,2,3,4,5,6,7].
arrayFactorias(4,ArrayID):- ArrayID = [1,2,3,4,5,6,7,8,9].

arrayJugadores(2,ArrayJug):- ArrayJug = [1,2].
arrayJugadores(3,ArrayJug):- ArrayJug = [1,2,3].
arrayJugadores(4,ArrayJug):- ArrayJug = [1,2,3,4].

arrayLineasPatron(ArrayLP):- ArrayLP = [1,2,3,4,5].                                                 %Cantidad de lineas de patron
arrayLineasPared(ArrayLP):- ArrayLP = [1,2,3,4,5].                                                  %Cantidad de lineas de pared
arrayLineasCompletas(ArrayLC):- ArrayLC = [0,0,0,0,0].                                              %Array inicial de lineas completas del patron

arrayHuecosFactoria(ArrayHF):- ArrayHF = [0,0,0,0].                                                 %Cantidad de huecos de la factoria
arrayCaja(ArrayC):- ArrayC = [[],[0],[0,0],[0,0,0],[0,0,0,0]].                                      %Cantidad de azulejos por linea completa del patron


lineas_patron([[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]]).
pared([[15,14,13,12,11],[11,15,14,13,12],[12,11,15,14,13],[13,12,11,15,14],[14,13,12,11,15]]).

jugador([player4,[[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]],[[15,14,13,12,11],[11,15,14,13,12],[12,11,15,14,13],[13,12,11,15,14],[14,13,12,11,15]],[0,0,0,0,0,0,0]]).
jugador([player3,[[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]],[[15,14,13,12,11],[11,15,14,13,12],[12,11,15,14,13],[13,12,11,15,14],[14,13,12,11,15]],[0,0,0,0,0,0,0]]).
jugador([player2,[[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]],[[15,14,13,12,11],[11,15,14,13,12],[12,11,15,14,13],[13,12,11,15,14],[14,13,12,11,15]],[0,0,0,0,0,0,0]]).
jugador([player1,[[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]],[[15,14,13,12,11],[11,15,14,13,12],[12,11,15,14,13],[13,12,11,15,14],[14,13,12,11,15]],[0,0,0,0,0,0,0]]).

factoria([nueve,[0,0,0,0]]).
factoria([ocho,[0,0,0,0]]).
factoria([siete,[0,0,0,0]]).
factoria([seis,[0,0,0,0]]).
factoria([cinco,[0,0,0,0]]).
factoria([cuatro,[0,0,0,0]]).
factoria([tres,[0,0,0,0]]).
factoria([dos,[0,0,0,0]]).
factoria([uno,[0,0,0,0]]).

centro_mesa([]).
caja_tablero([]).
bolsa_fichas([101,[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]]).

jugadores_tablero(Tablero,Jugadores):- nth1(1,Tablero,Jugadores).   %Devuelve los jugadores del tablero.
factorias_tablero(Tablero,Factorias):- nth1(2,Tablero,Factorias).   %Devuelve las factorias del tablero.
centro_tablero(Tablero,Centro):- nth1(3,Tablero,Centro).            %Devuelve el centro del tablero.
bolsa_tablero(Tablero,Bolsa):- nth1(4,Tablero,Bolsa).               %Devuelve la bolsa del tablero.
caja_tablero(Tablero,Caja):- nth1(5,Tablero,Caja).                  %Devuelve la caja del tablero.

jugador_nombre(Jugador,Nombre):- nth1(1,Jugador,Nombre).            %Devuelve el nombre de una jugador.
jugador_patron(Jugador,Patron):- nth1(2,Jugador,Patron).            %Devuelve el patron de una jugador.
jugador_pared(Jugador,Pared):- nth1(3,Jugador,Pared).               %Devuelve la pared de una jugador.
jugador_suelo(Jugador,Suelo):- nth1(4,Jugador,Suelo).               %Devuelve el suelo de una jugador.


factoria_nombre(Factoria,Nombre):- nth1(1,Factoria,Nombre).         %Devuelve el nombre de una factoria.
factoria_azulejos(Factoria,Azulejos):- nth1(1,Factoria,Azulejos).   %Devuelve los azulejos de una factoria.

actualizar_jugador_nombre(Jugador,Nombre,JugadorOut):-              %Actualiza el nombre del jugador.
    nth1(1,Jugador,_,ListaRes),
    nth1(1,JugadorOut,Nombre,ListaRes).

actualizar_jugador_patron(Jugador,Patron,JugadorOut):-              %Actualiza el patron del jugador.
    nth1(2,Jugador,_,ListaRes),
    nth1(2,JugadorOut,Patron,ListaRes).

actualizar_jugador_pared(Jugador,Pared,JugadorOut):-                %Actualiza la pared del jugador.
    nth1(3,Jugador,_,ListaRes),
    nth1(3,JugadorOut,Pared,ListaRes).

actualizar_jugador_suelo(Jugador,Suelo,JugadorOut):-                %Actualiza el suelo del jugador.
    nth1(4,Jugador,_,ListaRes),
    nth1(4,JugadorOut,Suelo,ListaRes).

actualizar_jugadores_tablero(Tablero,Jugadores,TableroOut):-        %Actualiza los jugadores del tablero.
    nth1(1,Tablero,_,ListaRes),
    nth1(1,TableroOut,Jugadores,ListaRes).

actualizar_factorias_tablero(Tablero,Factorias,TableroOut):-        %Actualiza las factorias del tablero.
    nth1(2,Tablero,_,ListaRes),
    nth1(2,TableroOut,Factorias,ListaRes).

actualizar_centro_tablero(Tablero,Centro,TableroOut):-              %Actualiza el contro del tablero.
    nth1(3,Tablero,_,ListaRes),
    nth1(3,TableroOut,Centro,ListaRes).

actualizar_bolsa_tablero(Tablero,Bolsa,TableroOut):-                %Actualiza la bolsa del tablero.
    nth1(4,Tablero,_,ListaRes),
    nth1(4,TableroOut,Bolsa,ListaRes).

actualizar_caja_tablero(Tablero,Caja,TableroOut):-                  %Actualiza la caja del tablero.
    nth1(5,Tablero,_,ListaRes),
    nth1(5,TableroOut,Caja,ListaRes).

actualizar_tablero(Tablero,Jugadores,Factorias,Centro,Bolsa,Caja,TableroOut):-    %Actualiza el tablero.
    actualizar_jugadores_tablero(Tablero,Jugadores,TableroAux1),
    actualizar_factorias_tablero(TableroAux1,Factorias,TableroAux2),
    actualizar_centro_tablero(TableroAux2,Centro,TableroAux3),
    actualizar_bolsa_tablero(TableroAux3,Bolsa,TableroAux4),
    actualizar_caja_tablero(TableroAux4,Caja,TableroOut).



%---------------------JUGAR-----------------------------------------------------------------------------------------------------------------------------------------------------------

jugar :-
    write('\n\nAZUL - By Bartlomiej\n\n'),
    write('Escoge el numero de jugadores de la partida: '), read(NumJugadores),
    crear_tablero(Tablero,NumJugadores),                                          %Creamos el tablero.
    imprimir_tablero(Tablero,NumJugadores),                                       %Imprimimos el tablero.
    writeln('\nOFERTA DE FACTORIAS\n'),
    arrayJugadores(NumJugadores,ArrayJug),                                        %Obtenemos el array de jugadores, para respetar el orden de cada jugador
    oferta_factorias(ArrayJug,Tablero,NumJugadores).                              %Pasamos a la oferta de factor�as.

cambiar_nombres_jugadores(ArrayJug,Jugadores,JugadoresOut):-
    [NumJug|JugRes] = ArrayJug,
    nth1(NumJug,Jugadores,Jugador,JugadoresRes),
    writeln('�Introduzca el nombre dentro de ap�strofes o en minuscula!'),
    write('Nombre del jugador n�mero '), write(NumJug), read(Nombre),
    actualizar_jugador_nombre(Jugador,Nombre,JugadorAux),
    nth1(NumJug,JugadoresAux,JugadorAux,JugadoresRes),
    cambiar_nombres_jugadores(JugRes,JugadoresAux,JugadoresOut).
cambiar_nombres_jugadores([],JugadoresOut,JugadoresOut).

crear_tablero(Tablero,NumJugadores):-                                             %Crea el tablero.
    jugadores(Jugadores),                                                         %Obtenemos los jugadores,factorias,bolsa,centro,caja.
    arrayJugadores(NumJugadores,ArrayJug),
    cambiar_nombres_jugadores(ArrayJug,Jugadores,JugadoresOut),
    factorias(Factorias),
    bolsa_fichas(Bolsa),
    centro_mesa(CentroMesa),
    caja_tablero(CajaTablero),
    arrayFactorias(NumJugadores,ArrayID),                                         %ArrayID indica las factor�as que utilizaremos.
    ini_factorias(ArrayID,Factorias,Bolsa,FactoriasOut,BolsaOut),                 %Inicializamos las factorias y la bolsa
    append([CajaTablero],[],TableroAux),                                          %Juntamos los valores obtenidos en un array, creando as� el tablero.
    writeln(BolsaOut),
    append([BolsaOut],TableroAux,TableroAux1),
    append([CentroMesa],TableroAux1,TableroAux2),
    append([FactoriasOut],TableroAux2,TableroAux3),
    append([JugadoresOut],TableroAux3,Tablero).

jugadores(Res):-jugadores_aux([],Res).                                            %Crea los jugadores.
jugadores_aux(Aux,Res):-
   jugador(Sol),
   \+ member(Sol,Aux),!,
   append([Sol],Aux,Aux2),
   jugadores_aux(Aux2,Res).
jugadores_aux(Res,Res).

factorias(Res):-factorias_aux([],Res).                                            %Crea las factor�as.
factorias_aux(Aux,Res):-
   factoria(Sol),
   \+ member(Sol,Aux),!,
   append([Sol],Aux,Aux2),
   factorias_aux(Aux2,Res).
factorias_aux(Res,Res).

ini_factorias(ArrayID,ListaFactorias,Bolsa,ListaFactoriasOut,BolsaOut):-          %Inicializa las factorias.
    [Num|Restante] = ArrayID,                                                     %Obtenemos el n�mero de la factor�a.
    nth1(Num,ListaFactorias,FactoriaAux,ListaFactoriaRes),                        %Obtenemos la factor�a correspondiente a ese n�mero.
    arrayHuecosFactoria(ArrayHF),
    ini_factoria(ArrayHF,FactoriaAux,Bolsa,FactoriaOut,BolsaAux),                 %Inicializamos la factor�a obtenida.
    nth1(Num,ListaFactoriasAux,FactoriaOut,ListaFactoriaRes),                     %Actualizamos las factor�as, con la factor�a inicializada.
    ini_factorias(Restante,ListaFactoriasAux,BolsaAux,ListaFactoriasOut,BolsaOut).
ini_factorias([],ListaFactoriasOut,BolsaOut,ListaFactoriasOut,BolsaOut).

ini_factoria(ArrayID,Factoria,Bolsa,FactoriaOut,BolsaOut):-                       %Inicializa una factor�a.
    [_|Restante] = ArrayID,
    nth1(2,Factoria,FactoriaAux,FactoriaRes),                                     %Obtenemos los azulejos de la factor�a.
    nth1(1,Bolsa,Cantidad),
    random(1,Cantidad,Num),                                                       %Obtenemos un n�mero aleatorio entre 1 y la cantidad de azulejos en la bolsa.
    actualizar_bolsa(Bolsa,BolsaAux1,Num,Color),                                  %Actualizamos la bolsa quitando dicho azulejo.
    select(0,FactoriaAux,Color,FactoriaAct),
    nth1(2,FactoriaAux1,FactoriaAct,FactoriaRes),                                 %Actualizamos la factoria.
    ini_factoria(Restante,FactoriaAux1,BolsaAux1,FactoriaOut,BolsaOut),!.
ini_factoria([],FactoriaOut,BolsaOut,FactoriaOut,BolsaOut).

actualizar_bolsa(Bolsa,BolsaOut,Num,Color):-
    nth1(1,Bolsa,NumAux),                                                         %Obtenemos el cantidad y le restamos 1 azulejo.
    NumRestado is NumAux-1,
    select(NumAux,Bolsa,NumRestado,BolsaAux),                                     %Quitamos el azulejo correspondiente de la bolsa.
    nth1(2,BolsaAux,Azulejos,BolsaRes),
    nth1(Num,Azulejos,Color,AzulejosRes),                                         %Actualizamos la bolsa.
    nth1(2,BolsaOut,AzulejosRes,BolsaRes).

%----------------------------OFERTA FACTOR�A------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

oferta_factorias(ArrayJug,Tablero,NumJugadores):-                                  %Oferta de factor�as.
    jugadores_tablero(Tablero,Jugadores),
    [NumJugador|_] = ArrayJug,                                                     %Obtenemos al jugador correspondiente al turno.
    nth1(NumJugador,Jugadores,Jugador),
    jugador_nombre(Jugador,Nombre),
    imprimir_menu(Nombre,Opcion),                                                  %Imprimimos el men� de actuaci�n para el jugador.
    realizar_opcion(Opcion,ArrayJug,Tablero,NumJugadores).                         %Realizamos la opci�n correspondiente.
oferta_factorias([],Tablero,NumJugadores):-
    arrayJugadores(NumJugadores,ArrayJug),                                         %Ya han realizado todos los jugadores su turno, volveremos a comenzar por el primero.
    oferta_factorias(ArrayJug,Tablero,NumJugadores).

realizar_opcion(0,_,_,_):-                                                         %Terminamos la ejecuci�n con abort().
       writeln('Ha decidido terminar la partida.\nGracias por jugar. :)\n'),
       abort().

realizar_opcion(1,ArrayJug,Tablero,NumJugadores):-                                 %Imprimimos el tablero.
      imprimir_tablero(Tablero,NumJugadores),
      oferta_factorias(ArrayJug,Tablero,NumJugadores).

realizar_opcion(2,ArrayJug,Tablero,NumJugadores):-                                 %Imprimimos las factorias y el centro.
      factorias_tablero(Tablero,Factorias),                                        %Obtenemos las factorias, el id de estas y el centro.
      arrayFactorias(NumJugadores,ArrayID),
      centro_tablero(Tablero,Centro),
      writeln('FACTORIAS\n'),imprimir_factorias(ArrayID,Factorias),
      writeln('CENTRO MESA\n'),imprimir_centro(Centro),nl,
      oferta_factorias(ArrayJug,Tablero,NumJugadores).

realizar_opcion(3,ArrayJug,Tablero,NumJugadores):-                                 %Imprimimos el centro, el jugador escoge un color de azulejo y decide donde poner azulejos correspondientes.
      factorias_tablero(Tablero,Factorias),                                        %Obtenemos las factorias, los jugadores y el centro.
      centro_tablero(Tablero,Centro),
      jugadores_tablero(Tablero,Jugadores),
      [NumJugador|JugRestantes] = ArrayJug,
      nth1(NumJugador,Jugadores,Jugador,JugadoresRestantes),                       %Obtenemos al jugador correspondiente al turno.
      comprobar_centro(Centro),!,                                                  %Comprobamos si el centro est� vac�o, si lo est�, volvemos a preguntar la opcion, si no lo est� avanzamos.
      writeln('CENTRO MESA\n'),imprimir_centro(Centro),nl,                         %Imprimimos el centro de la mesa.
      write('Color deseado: '), read(Color), azulejo(NumColor,Color),              %Preguntamos por el color de azulejo deseado.
      escoger_centro(Centro,[],CentroOut,NumColor,[],Azulejos),                    %Escogemos los azulejos con ese color del centro.
      %comprobar_centro_color(Azulejos),!,
      escoger_patron(Azulejos,Jugador,JugadorOut),!,                               %Preguntamos en que linea de su patr�n quiere colocar los azulejos y los colocamos.
      nth1(NumJugador,JugadoresOut,JugadorOut,JugadoresRestantes),
      actualizar_jugadores_tablero(Tablero,JugadoresOut,TableroAux1),              %Actualizamos el tablero manteniendo los cambios en el jugador y en el centro de la mesa.
      actualizar_centro_tablero(TableroAux1,CentroOut,TableroOut),
      factorias_vacias(Factorias,CentroOut,JugRestantes,TableroOut,NumJugadores).  %Comprobamos que las factorias y el centro mesa tienen azulejos para poder seguir jugando.

realizar_opcion(4,ArrayJug,Tablero,NumJugadores):-                                 %Imprimimos las factorias, el jugador escoge una factoria, un color de azulejo de dicha factoria y decide donde poner azulejos correspondientes.
      factorias_tablero(Tablero,Factorias),                                        %Obtenemos las factorias, los jugadores y el centro.
      arrayFactorias(NumJugadores,ArrayID),
      centro_tablero(Tablero,Centro),
      jugadores_tablero(Tablero,Jugadores),
      [NumJugador|JugRestantes] = ArrayJug,
      nth1(NumJugador,Jugadores,Jugador,JugadoresRestantes),                       %Obtenemos al jugador correspondiente al turno.
      comprobar_factorias(Factorias),!,                                            %Comprobamos si las factorias est�n vac�as, si lo est�n, volvemos a preguntar la opcion, si no lo est�n avanzamos.
      writeln('FACTORIAS\n'),imprimir_factorias(ArrayID,Factorias),
      escoger_factoria(Factorias,Centro,FactoriasOut,CentroOut,Azulejos),!,        %Preguntamos la factoria, el color del azulejo deseado de esa factor�a y escogemos los azulejos con ese color de dicha factoria.
      escoger_patron(Azulejos,Jugador,JugadorOut),!,                               %Preguntamos en que linea de su patr�n quiere colocar los azulejos y los colocamos.
      nth1(NumJugador,JugadoresOut,JugadorOut,JugadoresRestantes),                 %Actualizamos el tablero manteniendo los cambios en el jugador, factoria y en el centro de la mesa.
      actualizar_jugadores_tablero(Tablero,JugadoresOut,TableroAux1),
      actualizar_factorias_tablero(TableroAux1,FactoriasOut,TableroAux2),
      actualizar_centro_tablero(TableroAux2,CentroOut,TableroOut),
      factorias_tablero(TableroOut,FactoriasAux),
      centro_tablero(TableroOut,CentroAux),
      factorias_vacias(FactoriasAux,CentroAux,JugRestantes,TableroOut,NumJugadores). %Comprobamos que las factorias y el centro mesa tienen azulejos para poder seguir jugando.

realizar_opcion(_,ArrayJug,Tablero,NumJugadores):-                                   %La opci�n introducida no es v�lida, solicitamos otra.
      writeln('Opci�n introducida no v�lida, escoja otra opci�n'),
      oferta_factorias(ArrayJug,Tablero,NumJugadores).
                                                                                                                     %Comprobamos si el centro est� vac�o, si lo est�, volvemos a preguntar la opcion, si no lo est� avanzamos.
comprobar_centro(Centro):-
    (select(1,Centro,_);select(2,Centro,_);select(3,Centro,_);select(4,Centro,_);select(5,Centro,_));                %Hay azulejos en el centro,avanzamos.
     writeln('Actualmente el centro est� vac�o, escoja otra opci�n\n'),fail.                                         %El centro est� vac�o, preguntamos por otra opci�n.

comprobar_factorias(Factorias):-                                                                                     %Comprobamos si las factorias est�n vac�as, si lo est�n, volvemos a preguntar la opcion, si no lo est�n avanzamos.
    nth1(1,Factorias,Factoria),
    nth1(2,Factoria,Azulejos),
    (select(1,Azulejos,_);select(2,Azulejos,_);select(3,Azulejos,_);select(4,Azulejos,_);select(5,Azulejos,_));
    writeln('Actualmente las factor�as est�n vac�as, escoja otra opci�n'),fail.                                         %Las factor�as est�n vac�as, preguntamos por otra opci�n

comprobar_factoria(Factoria):-                                                                                          %Comprobamos si la factoria est� vac�a, si lo est�, volvemos a preguntar la factoria, si no lo est� avanzamos.
    nth1(2,Factoria,Azulejos),
    (select(1,Azulejos,_);select(2,Azulejos,_);select(3,Azulejos,_);select(4,Azulejos,_);select(5,Azulejos,_));
    writeln('Actualmente las factor�a est� vac�a, escoja otra factor�a\n'),fail.                                        %Hay azulejos en la factoria,avanzamos.


%comprobar_azulejos(Azulejos):-                                                                                         %Comprobamos si el array de azulejos est� vac�o, si lo est�, volvemos a preguntar la factoria, si no lo est� avanzamos.
%     (select(1,Azulejos,_);select(2,Azulejos,_);select(3,Azulejos,_);select(4,Azulejos,_);select(5,Azulejos,_));
%     writeln('El color escogido no se encuentra en la factor�a, escoja otra factor�a\n'),fail.                         %No hay azulejos en el array, color no v�lido.


%comprobar_centro_color(Azulejos):-                                                                                     %Comprobamos si el array de azulejos est� vac�o, si lo est�, volvemos a preguntar la factoria, si no lo est� avanzamos.
%   (select(1,Azulejos,_);select(2,Azulejos,_);select(3,Azulejos,_);select(4,Azulejos,_);select(5,Azulejos,_));
%   writeln('El color escogido no se encuentra en la factor�a, escoja otra factor�a\n'),fail.
    
%comprobar_linea_patron(Linea,Azulejos):-
%    nth1(1,Azulejos,Azulejo),
%    nth1(1,Linea,Aux),
%    (select(Azulejo,Linea,_);Aux = 0);
%    writeln('Ya hay azulejos en la linea escogida y no se corresponden al color escogido, escoja otra factor�a'),fail.


escoger_centro(Centro,CentroAux,CentroOut,NumColor,Azulejos,AzulejosOut):-                                  %Recorreremos el centro, lo actualizaremos y devolveremos los azulejos correspondientes al color
    nth1(1,Centro,Azulejo,CentroRes),
    ((NumColor = Azulejo,append([],CentroAux,CentroActualizado),append([Azulejo],Azulejos,AzulejosAux));    %Si el azulejo es del color correspondiente lo a�adimos a AzulejosOut.
     (append([Azulejo],CentroAux,CentroActualizado),append([],Azulejos,AzulejosAux))),                      %Si no, lo mantendremos en el centro, a�adi�ndolo a CentroActualizado.
    escoger_centro(CentroRes,CentroActualizado,CentroOut,NumColor,AzulejosAux,AzulejosOut).
escoger_centro([],CentroOut,CentroOut,_,AzulejosOut,AzulejosOut).

escoger_factoria(ListaFactorias,Centro,ListaFactoriasOut,CentroOut,Azulejos):-                              %Preguntamos la factoria, el color del azulejo deseado de esa factor�a y escogemos los azulejos con ese color de dicha factoria.
    write('N�mero de factor�a '), read(NumFactoria),                                                        %Preguntamos la factoria.
    nth1(NumFactoria,ListaFactorias,Factoria,FactoriasRes),
    comprobar_factoria(Factoria),!,
    nth1(2,Factoria,AzulejosFactoria,FactRes),
    write('\nLa factor�a escogida tiene los siguientes azulejos:\n'),
    imprimir_factoria(Factoria),                                                                            %Imprimimos la factor�a escogida.
    write('Que color de azulejos desea coger: '),read(Color),                                               %Preguntamos el color deseado.

    nth1(1,AzulejosFactoria,Azulejo1), azulejo(Azulejo1,Color1),                                            %Obtenemos los colores de la factor�a.
    nth1(2,AzulejosFactoria,Azulejo2), azulejo(Azulejo2,Color2),
    nth1(3,AzulejosFactoria,Azulejo3), azulejo(Azulejo3,Color3),
    nth1(4,AzulejosFactoria,Azulejo4), azulejo(Azulejo4,Color4),

    ((Color = Color1,append([],Centro,CentroAux1),append([Azulejo1],[],AzulejosAux1));                      %Comparamos todos los azulejos con el color deseado, si corresponde lo a�adimos a Azulejos, si no lo a�adimos al centro de la mesa.
    (append([Azulejo1],Centro,CentroAux1),append([],[],AzulejosAux1))),
    ((Color = Color2,append([],CentroAux1,CentroAux2),append([Azulejo2],AzulejosAux1,AzulejosAux2));
    (append([Azulejo2],CentroAux1,CentroAux2),append([],AzulejosAux1,AzulejosAux2))),
    ((Color = Color3,append([],CentroAux2,CentroAux3),append([Azulejo3],AzulejosAux2,AzulejosAux3));
    (append([Azulejo3],CentroAux2,CentroAux3),append([],AzulejosAux2,AzulejosAux3))),
    ((Color = Color4,append([],CentroAux3,CentroOut),append([Azulejo4],AzulejosAux3,Azulejos));
    (append([Azulejo4],CentroAux3,CentroOut),append([],AzulejosAux3,Azulejos))),!,

    %comprobar_azulejos(Azulejos),!,

    select(Azulejo1,AzulejosFactoria,0,AzulejosFactoriaAux1),                                               %Dejamos la factor�a vac�a.
    select(Azulejo2,AzulejosFactoriaAux1,0,AzulejosFactoriaAux2),
    select(Azulejo3,AzulejosFactoriaAux2,0,AzulejosFactoriaAux3),
    select(Azulejo4,AzulejosFactoriaAux3,0,AzulejosFactoriaOut),
    nth1(2,FactoriaOut,AzulejosFactoriaOut,FactRes),
    nth1(NumFactoria,ListaFactoriasOut,FactoriaOut,FactoriasRes).                                           %Actualizamos las factor�as modificando la factor�a correspondiente.

escoger_patron(Azulejos,Jugador,JugadorOut):-                                       %Mostramos los azulejos que disponemos y preguntamos donde se quieren colocar
    writeln(''),
    imprimir_jugador(Jugador),
    writeln('Dispone de los siguientes azulejos:'),
    imprimir_array(Azulejos),                                                       %Mostramos los azulejos que disponemos
    writeln('\nN�mero de linea donde desea colocarlos:'),                           %Preguntamos en que linea patron se quieren colocar
    read(NumLinea),
    %jugador_patron(Jugador,Patron),                                                 %Obtenemos el patron y la linea patron.
    %nth1(NumLinea,Patron,LineaPatron),
    %comprobar_linea_patron(LineaPatron,Azulejos),!,                                 %Comprobamos si podemos colocar los azulejos en la linea patron seleccionada.
    colocar_patron(Azulejos,NumLinea,Jugador,JugadorOut),!.                         %Colocamos los azulejos en la linea patron correspondiente.

colocar_patron(Azulejos,NumLinea,Jugador,JugadorOut):-                              %Colocamos los azulejos y actualizamos al jugador.
    jugador_patron(Jugador,Patron),                                                 %Obtenemos el patron y el suelo del jugador.
    jugador_suelo(Jugador,Suelo),
    nth1(NumLinea,Patron,LineaPatron,PatronRes),                                    %Obtenemos la linea del patron deseada.
    actualizar_linea_patron(Azulejos,LineaPatron,AzulejosOut,LineaPatronOut),       %Colocamos los azulejos en dicha linea.
    nth1(NumLinea,PatronOut,LineaPatronOut,PatronRes),                              %Actualizamos el patron con la linea modificada.
    actualizar_linea_suelo(AzulejosOut,Suelo,SueloOut),                             %Si quedan azulejos, actualizamos el suelo.
    actualizar_jugador_patron(Jugador,PatronOut,JugadorAux),                        %Actualizamos el jugador con los cambios realizados en el suelo y patron.
    actualizar_jugador_suelo(JugadorAux,SueloOut,JugadorOut).

actualizar_linea_patron(Azulejos,LineaPatron,AzulejosOut,LineaPatronOut):-          %Colocamos los azulejos en la linea del patron correspondiente.
    nth1(1,Azulejos,Azulejo,Restantes),
    select(0,LineaPatron,Azulejo,LineaPatronAux),
    actualizar_linea_patron(Restantes,LineaPatronAux,AzulejosOut,LineaPatronOut).
actualizar_linea_patron(AzulejosOut,LineaPatronOut,AzulejosOut,LineaPatronOut).

actualizar_linea_suelo(Azulejos,LineaSuelo,LineaSueloOut):-                         %Actualizamos el suelo del jugador, siempre que queden azulejos.
    nth1(1,Azulejos,Azulejo,Restantes),
    append([Azulejo],LineaSuelo,LineaSueloAux),
    actualizar_linea_suelo(Restantes,LineaSueloAux,LineaSueloOut).
actualizar_linea_suelo([],LineaSueloOut,LineaSueloOut).                             %Si no quedan azulejos, no los podemos a�adir.

factorias_vacias(Factorias,_,JugRestantes,Tablero,NumJugadores):-                                                             %Comprueba si quedan azulejos en las factorias
    nth1(1,Factorias,Factoria),
    nth1(2,Factoria,Azulejos),
    (select(1,Azulejos,_);select(2,Azulejos,_);select(3,Azulejos,_);select(4,Azulejos,_);select(5,Azulejos,_)),
    oferta_factorias(JugRestantes,Tablero,NumJugadores).                                                                      %Hay azulejos en alguna de las factor�as, seguimos con oferta factorias.
factorias_vacias([],Centro,JugRestantes,Tablero,NumJugadores):- centro_vacio(Centro,JugRestantes,Tablero,NumJugadores).       %Las factorias est�n vac�as, comprobamos el centro mesa.
factorias_vacias(Factorias,Centro,JugRestantes,Tablero,NumJugadores):-
    nth1(1,Factorias,_,FactoriasRes),
    factorias_vacias(FactoriasRes,Centro,JugRestantes,Tablero,NumJugadores).                                                  %La factoria est� vac�a, comprobamos las siguientes.

centro_vacio(Centro,JugRestantes,Tablero,NumJugadores):-
    (select(1,Centro,_);select(2,Centro,_);select(3,Centro,_);select(4,Centro,_);select(5,Centro,_)),
    oferta_factorias(JugRestantes,Tablero,NumJugadores).                                                                      %Hay azulejos en el centro de la mesa, seguimos con oferta factorias.
centro_vacio(_,JugRestantes,Tablero,NumJugadores):- proxima_ronda(JugRestantes,Tablero,NumJugadores).                         %No hay azulejos, preparamos la pr�xima ronda.

proxima_ronda(JugRestantes,Tablero,NumJugadores):-                                  %A�adimos los azulejos de la bolsa para iniciar las factorias y poder seguir jugando.
    factorias(Factorias),                                                           %Obtenemos las factorias, la bolsa y los jugadores.
    bolsa_tablero(Tablero,Bolsa),
    jugadores_tablero(Tablero,Jugadores),
    caja_tablero(Tablero,Caja),
    arrayFactorias(NumJugadores,ArrayID),
    arrayJugadores(NumJugadores,ArrayJug),
    arrayCaja(ArrayC),
    alicatado_pared(ArrayJug,Jugadores,JugadoresOut,ArrayC,Caja,CajaAux),           %Iniciamos el alicatado de azulejos a la pared de todos los jugadores.
    partida_finalizada(ArrayJug,JugadoresOut,NumJugadores),                         %Comprobamos si ha finalizado la partida.
    bolsa_vacia(Bolsa,BolsaAux,CajaAux,CajaOut),!,                                  %Comprobamos si la bolsa est� vac�a, si lo est� metemos las fichas de la caja en la bolsa.
    ini_factorias(ArrayID,Factorias,BolsaAux,FactoriasOut,BolsaOut),                %Inicializamos la factoria.
    actualizar_factorias_tablero(Tablero,FactoriasOut,TableroAux),                  %Actualizamos el tablero, con las factorias inicializadas, la caja y la bolsa actualizada.
    actualizar_bolsa_tablero(TableroAux,BolsaOut,TableroAux1),
    actualizar_jugadores_tablero(TableroAux1,JugadoresOut,TableroAux2),
    actualizar_caja_tablero(TableroAux2,CajaOut,TableroOut),
    oferta_factorias(JugRestantes,TableroOut,NumJugadores).                         %Volvemos a la Oferta de Factorias.

bolsa_vacia(Bolsa,BolsaOut,Caja,CajaOut):-                                          %Comprobamos si la bolsa est� vac�a.
     nth1(2,Bolsa,Azulejos),                                                        %Obtenemos los azulejos y la cantidad.
     nth1(1,Bolsa,Cantidad),
     azulejos_bolsa(Azulejos,AzulejosOut,Caja,CajaOut,Cantidad,CantidadOut),        %Si no hay azulejos, metemos los azulejos de la caja, si hay, no modificamos la bolsa.
     append([AzulejosOut],[],BolsaAux),
     append([CantidadOut],BolsaAux,BolsaOut).

azulejos_bolsa([],AzulejosOut,Caja,CajaOut,_,CantidadOut):-                         %No hay azulejos, metemos los azulejos de la caja en la bolsa.
     azulejos_caja(Caja,0,CantidadAux),                                             %Calculamos la cantidad de azulejos en la caja, y as�, los que tendremos en la bolsa
     CantidadOut is CantidadAux + 1,
     AzulejosOut = Caja,
     CajaOut = [].
azulejos_bolsa(AzulejosOut,AzulejosOut,CajaOut,CajaOut,CantidadOut,CantidadOut).
azulejos_caja(Caja,Cantidad,CantidadOut):-                                          %Calculamos la cantidad de azulejos en la caja, y as�, los que tendremos en la bolsa
     [_|CajaRes] = Caja,
     CantidadAux is Cantidad + 1,
     azulejos_caja(CajaRes,CantidadAux,CantidadOut).
azulejos_caja([],CantidadOut,CantidadOut).

%---------------------ALICATADO DE PARED------------------------------------------------------------------------------------------------------------------------------------------------------------------------

alicatado_pared(ArrayJug,Jugadores,JugadoresOut,ArrayCaja,Caja,CajaOut):-                                       %Comprobamos el patron de los jugador, y si hay lineas completas, alicatamos a la pared y actualizamos el patron.
    [NumJugador|NumRes] = ArrayJug,
    nth1(NumJugador,Jugadores,Jugador,JugadoresRes),                                                            %Obtenemos el jugador actual, su patron y su pared.
    jugador_patron(Jugador,Patron),
    jugador_pared(Jugador,Pared),
    arrayLineasPatron(ArrayLPatron),
    arrayLineasPared(ArrayPared),
    arrayLineasCompletas(ArrayLC),
    revisar_patron(Patron,Patron,PatronOut,ArrayLPatron,ArrayLC,ArrayCompletasOut),                             %Revisamos el patron, devolveremos un Array [x,x,x,x,x] donde x corresponde a cada linea del patron (0 si no es completa y el color del azulejo correspondiente en caso contrario).
    actualizar_pared(ArrayCompletasOut,ArrayPared,Pared,ParedOut),                                              %Modificamos la pared teniendo siguiendo el array obtenido anteriormente.
    actualizar_caja(Caja,ArrayCompletasOut,ArrayCaja,CajaAux),
    actualizar_jugador_pared(Jugador,ParedOut,JugadorAux),                                                      %Actualizamos los jugadores, manteniendo los cambios del jugador actual.
    actualizar_jugador_patron(JugadorAux,PatronOut,JugadorOut),
    nth1(NumJugador,JugadoresAux,JugadorOut,JugadoresRes),
    alicatado_pared(NumRes,JugadoresAux,JugadoresOut,ArrayCaja,CajaAux,CajaOut).
alicatado_pared([],JugadoresOut,JugadoresOut,_,CajaOut,CajaOut).

revisar_patron(Patron,PatronAux,PatronOut,ArrayIds,ArrayCompletas,ArrayCompletasOut):-                          %Revisamos el patron, revisando cada una de sus lineas.
    nth1(1,Patron,Linea,PatronRes),                                                                             %Obtenemos la linea patron correspondiente.
    revisar_linea_patron(Linea,PatronRes,PatronAux,PatronOut,ArrayIds,ArrayCompletas,ArrayCompletasOut),!.

revisar_linea_patron(Linea,[],PatronCompleto,PatronOut,ArrayIds,ArrayCompletas,ArrayCompletasOut):-
    actualizar_linea(ArrayCompletas,ArrayCompletasOut,ArrayIds,_,Linea,LineaOut),                               %Vac�amos la linea si est� completa, en caso contrario mantenemos la linea como esta(LineaOut).
    select(Linea,PatronCompleto,LineaOut,PatronOut).                                                            %Modificamos la linea, por la nueva LineaOut.
revisar_linea_patron(Linea,Patron,PatronCompleto,PatronOut,ArrayIds,ArrayCompletas,ArrayCompletasOut):-
    actualizar_linea(ArrayCompletas,ArrayCompletasAux,ArrayIds,ArrayIdsAux,Linea,LineaOut),                     %Vac�amos la linea si est� completa, en caso contrario mantenemos la linea como esta(LineaOut).
    select(Linea,PatronCompleto,LineaOut,PatronAux),                                                            %Modificamos la linea, por la nueva LineaOut.
    revisar_patron(Patron,PatronAux,PatronOut,ArrayIdsAux,ArrayCompletasAux,ArrayCompletasOut).

actualizar_linea(Array,ArrayOut,ArrayIds,ArrayIdsOut,Linea,Linea):-                                             %Si la linea no est� completa (tiene algun 0) no la modificamos
    select(0,Linea,_),
    [Num|ArrayIdsOut] = ArrayIds,
    nth1(Num,Array,_,ArrayRes),
    nth1(Num,ArrayOut,0,ArrayRes).
actualizar_linea(Array,ArrayOut,ArrayIds,ArrayIdsOut,Linea,LineaOut):-                                          %Si la linea est� completa al vaciamos y a�adimos el color de la linea a ArrayOut
    nth1(1,Linea,Azulejo),
    vaciar_array(Linea,[],LineaOut),                                                                            %Vaciamos la linea (a,b,c,d] obtenemos un array "vac�o" [0,0,0,0]).
    [Num|ArrayIdsOut] = ArrayIds,
    nth1(Num,Array,_,ArrayRes),
    nth1(Num,ArrayOut,Azulejo,ArrayRes).

vaciar_array(Array,ArrayAux,ArrayOut):-                                                                         %Dado un array [a,b,c,d] obtenemos un array "vac�o" [0,0,0,0].
    nth1(1,Array,_,ArrayRes),
    append([0],ArrayAux,ArrayAux1),
    vaciar_array(ArrayRes,ArrayAux1,ArrayOut).
vaciar_array([],ArrayOut,ArrayOut).

actualizar_pared(ArrayCompletas,ArrayLineasPared,Pared,ParedOut):-                                              %Actualizamos la pared, sustituyendo los huecos por los azulejos correspondientes, dictados por el array de lineas completas.
    [Azulejo|ArrayRes] = ArrayCompletas,                                                                        %Obtenemos el azulejo correspondiente del array de lineas completas.
    [NumLinea|LineasRes] = ArrayLineasPared,
    nth1(NumLinea,Pared,LineaPared,ParedRes),                                                                   %Obtenemos la linea de la pared correspondiente gracias al array de lineas de pared.
    actualizar_linea_pared(Azulejo,LineaPared,LineaParedOut),                                                   %Sustituimos el hueco de la linea de la pared por el azulejo correspondiente si es posible.
    nth1(NumLinea,ParedAux,LineaParedOut,ParedRes),                                                             %Actualizamos la pared, manteniendo los cambios en la linea correspondiente.
    actualizar_pared(ArrayRes,LineasRes,ParedAux,ParedOut).
actualizar_pared([],[],ParedOut,ParedOut).

actualizar_linea_pared(Azulejo,LineaPared,LineaParedOut):-                                                      %Sustituimos el hueco de la pared por el azulejo (Hueco de X color = X + 10)
    AzulejoAux is Azulejo + 10,
    select(AzulejoAux,LineaPared,Azulejo,LineaParedOut).
actualizar_linea_pared(_,LineaParedOut,LineaParedOut).

actualizar_caja(Caja,ArrayCompletas,ArrayCaja,CajaOut):-
    [Azulejo|CompletasRestantes] = ArrayCompletas,
    [ArrayCajaAct|ArrayCajaRes] = ArrayCaja,
    introducir_caja(Azulejo,ArrayCajaAct,Caja,CajaAux),
    actualizar_caja(CajaAux,CompletasRestantes,ArrayCajaRes,CajaOut).
actualizar_caja(CajaOut,[],[],CajaOut).

introducir_caja(0,_,CajaOut,CajaOut).
introducir_caja(Azulejo,Array,Caja,CajaOut):-
    [_|Res] = Array,
    append([Azulejo],Caja,CajaAux),
    introducir_caja(Azulejo,Res,CajaAux,CajaOut).
introducir_caja(_,[],CajaOut,CajaOut).

%----------------FIN PARTIDA-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

partida_finalizada(ArrayJug,Jugadores,NumJugadores):-                                                           %Buscamos si las paredes de los jugadores tienen alguna linea completa, si es as� se finaliza la partida.
    [NumJug|JugRes] = ArrayJug,                                                                                 %Obtenemos al jugador actual y su pared.
    nth1(NumJug,Jugadores,Jugador),
    jugador_pared(Jugador,Pared),
    fin_partida(Pared,Jugadores,NumJugadores),                                                                  %Miramos si su pared tiene alguna linea completa, si es as� se finaliza la partida.
    partida_finalizada(JugRes,Jugadores,NumJugadores).
partida_finalizada([],_,_).

fin_partida(Pared,Jugadores,NumJugadores):-                                                                     %Miramos si su pared tiene alguna linea completa, si es as� se finaliza la partida.
    [Linea|_] = Pared,                                                                                          %Obtenemos la linea de la pared.
    select(1,Linea,_),                                                                                          %Nos aseguramos que no tiene huecos.
    select(2,Linea,_),
    select(3,Linea,_),
    select(4,Linea,_),
    select(5,Linea,_),                                                                                          %No tiene huecos, linea completa, imprimimos el estado de los jugadores y finalizamos la partida.
    writeln('\nEl estado de los jugadores es el siguiente:\n '),
    imprimir_jugadores(NumJugadores,Jugadores),
    writeln('La partida ha finalizado, gracias por jugar.\n'),
    abort().
fin_partida([],_,_).                                                                                            %Ninguna linea de la pared es completa.
fin_partida(Pared,Jugadores,NumJugadores):-[_|ParedRes] = Pared,fin_partida(ParedRes,Jugadores,NumJugadores).   %Tiene huecos, pasaremos a comprobar la siguiente linea.

%----------------INTERFAZ : FUNCIONES PARA IMPRIMIR---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

imprimir_tablero(Tablero,NumJugadores):-                                                                        %A continuaci�n, todas las funciones sirven para imprimir los elementos del tablero.
    jugadores_tablero(Tablero,Jugadores), writeln('\nJUGADORES\n'),                                             %No se van a realizar comentarios sobre estas funciones, ya que todas recorren el elemento
    imprimir_jugadores(NumJugadores,Jugadores),                                                                 %dado y lo imprimen de la mejor forma posible.
    factorias_tablero(Tablero,Factorias),arrayFactorias(NumJugadores,ArrayID),
    writeln('\nFACTORIAS\n'), imprimir_factorias(ArrayID,Factorias),
    centro_tablero(Tablero,CentroMesa), writeln('\nCENTROMESA\n'), imprimir_centro(CentroMesa),
    bolsa_tablero(Tablero,Bolsa), writeln('\nBOLSA\n'), imprimir_bolsa(Bolsa),
    caja_tablero(Tablero,Caja), writeln('\nCAJATABLERO\n'), imprimir_caja(Caja).

imprimir_menu(Nombre,Opcion):-
    write('\nTurno del jugador: '), writeln(Nombre),
    writeln('Presione 1 para ver el tablero'),
    writeln('Presione 2 para ver las factorias y el centro de la mesa'),
    writeln('Presione 3 para coger azulejos del centro de la mesa'),
    writeln('Presione 4 para coger azulejos de alguna de las factorias'),
    writeln('Presione 0 para salir del juego'),
    write('|Escoge la opcion'), read(Opcion),nl.

imprimir_jugadores(2,Jugadores):-
    nth1(1,Jugadores,Jugador1),
    nth1(2,Jugadores,Jugador2),
    imprimir_jugador(Jugador1),
    imprimir_jugador(Jugador2).

imprimir_jugadores(3,Jugadores):-
    nth1(1,Jugadores,Jugador1),
    nth1(2,Jugadores,Jugador2),
    nth1(3,Jugadores,Jugador3),
    imprimir_jugador(Jugador1),
    imprimir_jugador(Jugador2),
    imprimir_jugador(Jugador3).

imprimir_jugadores(4,Jugadores):-
    nth1(1,Jugadores,Jugador1),
    nth1(2,Jugadores,Jugador2),
    nth1(3,Jugadores,Jugador3),
    nth1(4,Jugadores,Jugador4),
    imprimir_jugador(Jugador1),
    imprimir_jugador(Jugador2),
    imprimir_jugador(Jugador3),
    imprimir_jugador(Jugador4).

imprimir_jugador(Jugador):-
    jugador_nombre(Jugador,Nombre),write('Nombre: '),writeln(Nombre),
    nth1(2,Jugador,Lineas_patron),writeln('Lineas de patron:'),
    nth1(1,Lineas_patron,PatronAux1),imprimir_array(PatronAux1),
    nth1(2,Lineas_patron,PatronAux2),imprimir_array(PatronAux2),
    nth1(3,Lineas_patron,PatronAux3),imprimir_array(PatronAux3),
    nth1(4,Lineas_patron,PatronAux4),imprimir_array(PatronAux4),
    nth1(5,Lineas_patron,PatronAux5),imprimir_array(PatronAux5),
    jugador_pared(Jugador,Pared),writeln('Pared:'),
    nth1(1,Pared,ParedAux1),imprimir_array(ParedAux1),
    nth1(2,Pared,ParedAux2),imprimir_array(ParedAux2),
    nth1(3,Pared,ParedAux3),imprimir_array(ParedAux3),
    nth1(4,Pared,ParedAux4),imprimir_array(ParedAux4),
    nth1(5,Pared,ParedAux5),imprimir_array(ParedAux5),
    jugador_suelo(Jugador,Suelo),writeln('Linea de suelo:'),
    imprimir_array(Suelo),nl.

imprimir_factorias(ArrayID,ListaFactorias):-
    [Num|Restante] = ArrayID,
    nth1(Num,ListaFactorias,Factoria),
    imprimir_factoria(Factoria),
    imprimir_factorias(Restante,ListaFactorias).
imprimir_factorias([],_).

imprimir_factoria(Factoria):-
    nth1(1,Factoria,Nombre),
    nth1(2,Factoria,Azulejos),
    write('Factoria: '),writeln(Nombre),
    imprimir_array(Azulejos),nl.

imprimir_bolsa(Bolsa):-
    nth1(1,Bolsa,Cantidad),
    nth1(2,Bolsa,Azulejos),
    Num is Cantidad - 1,
    write('Cantidad: '),writeln(Num),
    imprimir_array_bolsa(Azulejos,1).

imprimir_array_bolsa(Azulejos,Color):-
    [Num|ArrayRestante] = Azulejos,
    azulejo(Num,Azulejo),
    ((Color = Num, write(''));
    (writeln(' |'))),
    write(' | '),write(Azulejo),
    imprimir_array_bolsa(ArrayRestante,Num).
imprimir_array_bolsa([],_):- write(' |\n').

imprimir_caja(Caja):-imprimir_array(Caja).

imprimir_centro(Centro):-imprimir_array(Centro).

imprimir_array(Array):-
    [Num|ArrayRestante] = Array,
    azulejo(Num,Azulejo),
    write(' | '),write(Azulejo),
    imprimir_array(ArrayRestante).
imprimir_array([]):- write(' |\n').