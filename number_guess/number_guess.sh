#!/bin/bash

#conexión DB
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

# generar un número aleatorio
SECRET_NUMBER=$(( RANDOM%1000+1 ))

# Preguntar nombre de usuario: Enter your username:
echo "Enter your username:"
read NOMBRE

# Validar nombre

# Consulta
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NOMBRE'")

# si no existe
 if [[ -z $USER_ID ]]
 then
    echo "Welcome, $NOMBRE! It looks like this is your first time here."

    #insertar en nombre en la base de datos
    R_INSERT_USER=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$NOMBRE', 0, 0)")
 else
    #si existe

    # consultar usuario
    USUARIO=$($PSQL "SELECT * FROM users WHERE user_id=$USER_ID")
    echo "$USUARIO" | while read U_ID B NAME B G_PLAYED B BEST_G
    do
      echo "Welcome back, $NAME! You have played $G_PLAYED games, and your best game took $BEST_G guesses."
    done
 fi

echo "Guess the secret number between 1 and 1000:"

BANDERA=1
INTENTOS=0

while [[ $BANDERA -eq 1 ]]
do
  #lee el número para adivinar
  read NUM_USUARIO

  # si no entero
    while [[ ! $NUM_USUARIO =~ ^[0-9]+$ ]]
    do
        echo "That is not an integer, guess again:"
        read NUM_USUARIO
    done

  #aumentar cantidad de intentos
  INTENTOS=$(( INTENTOS + 1 ))

  # comparar números

  #si es mayor
  if [[ $NUM_USUARIO > $SECRET_NUMBER ]]
  then
     echo "It's lower than that, guess again:"
     BANDERA=1
  fi

  # si es menor
  if [[ $NUM_USUARIO < $SECRET_NUMBER ]]
  then
     echo "It's higher than that, guess again:"
     BANDERA=1
  fi

  #si es igual
  if [[ $NUM_USUARIO -eq $SECRET_NUMBER ]]
  then
     
     # aumentar número de juegos
     GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$NOMBRE'")
     GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))
     R_INSERT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$NOMBRE'")

     # conseguir el best game
     BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$NOMBRE'")
     if [[ $BEST_GAME -eq 0 ]]
     then
        R_INSERT_BEST=$($PSQL "UPDATE users SET best_game=$INTENTOS WHERE username='$NOMBRE'")
     fi

     if [[ $BEST_GAME -gt $INTENTOS ]]
     then
        R_INSERT_BEST=$($PSQL "UPDATE users SET best_game=$INTENTOS WHERE username='$NOMBRE'")
     fi

     BANDERA=0
  fi
done


echo "You guessed it in $INTENTOS tries. The secret number was $SECRET_NUMBER. Nice job!"

