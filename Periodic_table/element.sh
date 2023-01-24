#!/bin/bash 

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c" 


#Almacena el número de atomic_mass si es encontrado. Se inicializa a 0. Variable global
ATOMIC_NUMBER=0

# verificar si es un número

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
 
    #verificar si existe atomic number
    if [[ -z $ELEMENT_ID ]]
    then
      echo -e "I could not find that element in the database."
    else
      ATOMIC_NUMBER=$ELEMENT_ID
    fi
  
  else

      # verificar si es una cadena
      if [[ $1 =~ ^[A-Za-z]+$ ]]
      then
        # verificar si existe en symbol
        ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
        #verificar si existe atomic number
        if [[ -z $ELEMENT_ID ]]
        then
          # verificar si existe por name
          ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
          
          if [[ -z $ELEMENT_ID ]]
          then
            echo -e "I could not find that element in the database."
          else
            ATOMIC_NUMBER=$ELEMENT_ID
          fi
        else
          ATOMIC_NUMBER=$ELEMENT_ID
        fi

      else
        echo -e "I could not find that element in the database."
        
      fi
  fi


  #verificar si atomic fue encontrado

  if [[ $ATOMIC_NUMBER == 0 ]]
  then
    ATOMIC_NUMBER=0
  else

  ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

  echo "$ELEMENT" | while read T_ID B ATO B SYMBOL B NAME B ATOMIC_MASS B MELTING B BOILING B TYPE
  do
    echo -e "The element with atomic number $ATO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
  fi
fi  




