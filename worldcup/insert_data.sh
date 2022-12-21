#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
 
  #loop to see all data
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
  do
    
    #don't read header
    if [[ $YEAR != "year" ]]
    then

       #get winner team id
       WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
       
       #if not found
       if [[ -z $WINNER_ID ]]
       then
          #insert team
          RESULT1=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
          
          #get new wineer team id
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
       fi
      
       #get opponent team id
       OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
       
       #if not found
       if [[ -z $OPPONENT_ID ]]
       then
          #insert team
          RESULT2=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
          
          #get new opponent team id
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
       fi

       #insert game
       RESULT3=$($PSQL "INSERT INTO games (year, round, winner_goals, opponent_goals, winner_id, opponent_id ) VALUES ( $YEAR, '$ROUND', $W_GOALS, $O_GOALS, $WINNER_ID, $OPPONENT_ID ) ") 
      
       if [[ $RESULT1 == "INSERT 0 1"  && $RESULT2 == "INSERT 0 1" && $RESULT3 == "INSERT 0 1" ]]
       then
          echo Se insertó correctamente
       else
          echo Hubo un error   
       fi
    fi
  done
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
  #loop to see all data
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
  do
    
    #don't read header
    if [[ $YEAR != "year" ]]
    then

       #get winner team id
       WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
       
       #if not found
       if [[ -z $WINNER_ID ]]
       then
          #insert team
          RESULT1=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
          
          #get new wineer team id
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
       fi
      
       #get opponent team id
       OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
       
       #if not found
       if [[ -z $OPPONENT_ID ]]
       then
          #insert team
          RESULT2=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
          
          #get new opponent team id
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
       fi

       #insert game
       RESULT3=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals ) VALUES ( $YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS ) ") 
      
       if [[ $RESULT1 == "INSERT 0 1"  && $RESULT2 == "INSERT 0 1" && $RESULT3 == "INSERT 0 1" ]]
       then
          echo Se insertó correctamente
       else
          echo Hubo un error   
       fi
    fi
  done
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
