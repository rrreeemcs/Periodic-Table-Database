#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Validating Input
VALIDATE_INPUT() {
  # No argument input
  if [[ ! $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    # Checking if input is number or string
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      ATOM_NUM_RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    else
      ATOM_NUM_RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
    fi
    GET_ELEMENT_INFO $ATOM_NUM_RESULT
  fi
}

# Getting Element Information
GET_ELEMENT_INFO() {
  # If element was not found
  if [[ -z $1 ]]
  then
    echo "I could not find that element in the database."
  # Otherwise
  else
    ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    # Reading all info from joined tables
    echo "$ELEMENT_PROPERTIES" | while IFS="|" read TYPE_ID ATOM_NUM SYMBOL NAME ATOM_MASS MP_C BP_C TYPE
    do
      # Final output
      echo "The element with atomic number $ATOM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOM_MASS amu. $NAME has a melting point of $MP_C celsius and a boiling point of $BP_C celsius."
    done
  fi
}

VALIDATE_INPUT $1