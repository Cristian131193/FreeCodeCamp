#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

# Main menu

MAIN_MENU(){

  # error message
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi

  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")

  # print menu
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME 
  do
    echo "$SERVICE_ID) $NAME"
  done

  # selected service
  read SERVICE_ID_SELECTED

  # if input is not a number
   if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    
    else
    # find service ID
    CONTRACTED_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")  

    # if not exist
    if [[ -z $CONTRACTED_SERVICE_ID ]]
    then
      # send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # call service registration
      REGISTER_SERVICE $CONTRACTED_SERVICE_ID 
    fi
  fi
}  

REGISTER_SERVICE(){

  # get selected service id
  if [[ $1 ]]
  then

    # get phone number
    echo -e "\nWhat's your phone number?"
    
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if not exist
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      #insert customer
      RESULT_INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    else
      
      #get customer name
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
      read SERVICE_TIME

      #get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      #insert service
      RESULT_INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $1)")
      
      echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else

    # send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
}

# Start 
MAIN_MENU
