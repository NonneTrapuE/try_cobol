       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
       AUTHOR.     Bastien.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FC-DATE ASSIGN TO "test.txt"
             ORGANIZATION LINE SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.

       FD FC-DATE.
       01 FC-ENR PIC X(10).
       

       WORKING-STORAGE SECTION.
      * Types de variables:
      * - 9 : Nombre à un chiffre
      * - 9(5) : Nombre à 5 chiffres
      * - a(10) : chaîne de 10 caractères alphabétiques
      * - x(25) : chaîne de 25 caractères alphanumériques
      * - 9v9 : Nombre à 1 chiffre et 1 décimale
      * - s9(3) : Nombre à 3 chiffres signés (+ ou -) 

       77 WS-PRENOM PIC X(7) VALUE "Bastien".
       77 WS-PRENOM2 PIC X(7) VALUE NULL.
       77 WS-CHIFFRE PIC 9 VALUE 9.
       77 WS-FLOAT PIC s9(3) VALUE -930.
      * 77 WS-FILE PIC X(10) VALUE "test.txt".
       77 WS-CONTENT PIC X(30).
       77 WS-DATE-TEXT PIC X(10).


      * Hiérarchisation des variables 
       01 WS-DATE.
         02 ANNEE PIC 9(4).
         02 MOIS PIC 9(2).
         02 JOUR PIC 9(2).

       
      * Traitement 
       PROCEDURE DIVISION.

           DISPLAY "Année: " NO ADVANCING.
           ACCEPT ANNEE.
           DISPLAY "Mois: " NO ADVANCING.
           ACCEPT MOIS.
           DISPLAY "Jour: " NO ADVANCING.
           ACCEPT JOUR.
           

           IF ANNEE < 2030
             THEN IF MOIS <= 12
               THEN IF JOUR <= 30
                 THEN 
                 OPEN OUTPUT FC-DATE
                   MOVE ANNEE TO WS-DATE-TEXT(1:4)
                   MOVE "/"    TO WS-DATE-TEXT(5:1)
                   MOVE MOIS   TO WS-DATE-TEXT(6:2)
                   MOVE "/"    TO WS-DATE-TEXT(8:1)
                   MOVE JOUR   TO WS-DATE-TEXT(9:2)
                   MOVE WS-DATE-TEXT TO FC-ENR
                   WRITE FC-ENR
                 CLOSE FC-DATE
                 ELSE DISPLAY "ERROR"
               END-IF
               ELSE DISPLAY "ERROR"
             END-IF
           ELSE DISPLAY "ERROR"
           END-IF
       
           STOP RUN.

       END PROGRAM HELLOWORLD.