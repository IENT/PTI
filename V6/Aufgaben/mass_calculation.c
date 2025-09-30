#include "stdio.h"
#include "stdlib.h"
#include "math.h"

/*
    ### INPUT PARAMETER ###
    labelact = Die Nummer der aktuell betrachtete Labelregion
    labelmatrix = Die Matrix des Labelbildes. Zugriff ist per [][]-Operator möglich. Siehe "labelmatrix.ipynb" für ein Beispiel.
    dimm = Anzahl der Zeilen der Labelbildmatrix
    dimn = Anzahl der Spalten der Labelbilmatrix
    res_cm = Speichern Sie dort die x-Koordinate Ihres berechneten Schwerpunktes
    res_cn = Speichern Sie dort die y-Koordinate Ihres berechneten Schwerpunktes
    Beachten Sie die vorliegenden Datentypen und verändern Sie diese nicht.
*/
void calculate_center(int dimm, int dimn,double* res_cm, double* res_cn, double labelact, double** labelmatrix)
{
    // Hier folgt Ihr Code für die Berechnung des Massenschwerpunktes (Teil 2, A1.1)...
    
}





// HIER BITTE NICHTS VERÄNDERN

void center(double **in_array, int numberoflabels, double **res_array) // n Anzahl der Labelgebiete, und 2 Pointer-Arrays
{
    int count = 0; // counter for continuous storing of coordinates in array

    double res_cm = 0;
    double res_cn = 0;
    
    
    // Schwerpunktkoordinaten berechnen
    for (int labelact = 1; labelact < numberoflabels+1; labelact++) //Zähler der Gebiete, gehe jedes Gebiet durch
    {
        //printf("\nActlabel vor Ausführung: %i", mass);
        calculate_center(400, 400, &res_cm, &res_cn, (double)labelact, in_array);
        //printf("\nActlabel nach Ausführung: %i", mass);
        
        if (res_cm || res_cn != 0.0)
        {
        *res_array[labelact-1+count] = res_cm;  
        *res_array[labelact+count] = res_cn; 
        printf("\nSchwerpunktkoordinaten: %f, %f", *res_array[labelact-1+count], *res_array[labelact+count]);
        }
        else {printf("\nFEHLER");}
        
        count++;
        //reset values
        res_cm = 0;
        res_cn = 0;
    } //end of for labelact  
}


void central(double **schwerpunkte, int n, double **labelmatrix, double **res_array_center, int h, int v)
{
    double c = 0.0;
    
    // Schwerpunktkoordinaten berechnen
    for (int labelact = 1; labelact < n+1; labelact++) //Zähler der Gebiete, gehe jedes Gebiet durch
    {
        // Zentralmomente berechnen:
        calculate_central(400, 400, schwerpunkte, labelmatrix, (double)labelact, h, v, &c);
            
        *res_array_center[labelact-1] = c;   
        c = 0.0;
    } //end of for labelact    
    
}