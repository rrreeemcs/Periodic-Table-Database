# Periodic Table Database - FreeCodeCamp Relational Database Certification

### Description
The aim of this project is to create/edit a periodic table database, **periodic_table.sql**, using PostgreSQL and querying it using a Bash program, **element.sh**. Additionally, progress and commits throughout the project must be recoreded through the use of Git. When running the program, an **element's information** (atomic number, symbol, name, type, mass, melting point, boiling point) will be displayed when it's atomic number, symbol, or name is given as an argument (see sample inputs below).

### Running Program
Dump and rebuild **periodic_table.sql** with the following command: *psql -U postgres < periodic_table.sql*. Run Bash program using **./element.sh** in the terminal, along with an input. Examples shown below.

### Sample Inputs
**Terminal Input:** ./element.sh 1  
**Output:** The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

**Terminal Input:** ./element.sh Beryllium  
**Output:** The element with atomic number 4 is Beryllium (Be). It's a metal, with a mass of 9.0122 amu. Beryllium has a melting point of 1287 celsius and a boiling point of 2470 celsius.

**Terminal Input:** ./element.sh Ne  
**Output:** The element with atomic number 10 is Neon (Ne). It's a nonmetal, with a amss of 20.18 amu. Neon has a melting point of -248.6 celsius and a boiling point of -246.1 celsius.

**Terminal Input:** ./element.sh 11 *or* ./element.sh Hot
**Output**: I could not find that element in the database.

**Terminal Input:** ./element.sh  
**Output**: Please provide an element as an argument.

### Conclusion
The task for this project was not difficult, however, I overcomplicated the requirements throughout the past few days. One regular expression, **^[0-9]+$**, was enough to fix the issues I encountered. Additionally, formatting a PostgreSQL query from a Bash program using a while loop required me to utilize **IFS**; it allowed me to separate the **bar |** between each value. This method is much easier compared to individually acquiring each value with a separate query.
