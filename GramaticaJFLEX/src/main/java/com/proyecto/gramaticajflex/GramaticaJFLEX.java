/*
 * Click nbfs:\nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs:\nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.proyecto.gramaticajflex;

import analizadores.Lexer;
import analizadores.Sintax;
import analizadores.TablaSimbolos;

import java.io.BufferedReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import static java.lang.constant.ConstantDescs.NULL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java_cup.runtime.Scanner;
import java_cup.runtime.Symbol;
import javax.annotation.Syntax;
import jflex.exceptions.SilentExit;


public class GramaticaJFLEX {
    
   public static void generarScannerParser()throws Exception{
     /*Función que genera el scanner(analizador léxico) y el parser(analizador sintáctico) respectivamente a partir de los archivos "scannerLexico.jflex"
       y "parserSintactico.cup" mediante el uso de las bibliotecas JFLEX y CUP.
       Entradas: N/A
       Salidas: Clase Java Lexer(correspondiente al scanner) y Clase Java Sintax(correspondiente al parser).
       Restricciones: N/A
       Notas: Tener cuidado y cambiar rutas de ficheros al momento de ejecutar
     */  
       
       
    String basePath, fullPathLexer;
    
    basePath = System.getProperty("user.dir");
   
    
    Files.deleteIfExists(Paths.get(basePath+"/scr/main/java/analizadores/sym.java"));
    Files.deleteIfExists(Paths.get(basePath+"/scr/main/java/analizadores/Sintax.java"));
    Files.deleteIfExists(Paths.get(basePath+"/scr/main/java/analizadores/Lexer.java"));
    Files.deleteIfExists(Paths.get(basePath+"/scr/main/java/archivosGeneracion/Lexer.java"));
    
    
    //Generación de Scanner de JFLEX y el Parser de CUP
    System.out.println("=== Generando FLEX");
    String[] strArr = {"F:/Ronaldo/TEC/Semestre 12 - 2023/Compiladores e Interpretes/Proyectos/Proyecto 1/Local/GramaticaJFLEX/src/main/java/archivosGeneracion/scannerLexico.jflex"};
    try{
        jflex.Main.generate(strArr);                                                            //Genera la Clase Lexer.java
        System.out.println("JFLEX ha funcionado y se ha generado"); 
    } catch(SilentExit e){
        System.out.println(e);
        System.out.println("JFLEX no ha funcionado"); 
    }


    System.out.println("=== Generando CUP");
    String ruta = "F:/Ronaldo/TEC/Semestre 12 - 2023/Compiladores e Interpretes/Proyectos/Proyecto 1/Local/GramaticaJFLEX/src/main/java/archivosGeneracion/parserSintactico.cup";
    String[] strArr3 = {"-parser", "Sintax", ruta};
    try{
        java_cup.Main.main(strArr3);                                                         //Genera la Clase Sintax.java
        System.out.println("Cup ha funcionado y se ha generado"); 
    } catch(Exception e){
        System.out.println(e);
        System.out.println("Cup no ha funcionado"); 
    }
    
    /*
   //System.out.println(basePath);
    String Path = "F:\\Ronaldo\\TEC\\Semestre 12 - 2023\\Compiladores e Interpretes\\Proyectos\\Proyecto 1\\Local\\GramaticaJFLEX";
    //mover archivos
    Files.move (Paths.get(Path+"\\sym.java"), Paths.get(Path+"\\scr\\main\\java\\analizadores\\sym.java")); 
    Files.move (Paths.get(Path+"\\Sintax.java"), Paths.get(Path+"\\scr\\main\\java\\analizadores\\Sintax.java"));
    Files.move (Paths.get(Path+"\\scr\\main\\java\\archivosGeneracion\\Lexer.java"), Paths.get(Path+"\\scr\\main\\java\\analizadores\\Lexer.java"));
    */
}       
public static void Buscarlexemas() throws IOException{
        String rutaAParsear = "F:/Ronaldo/TEC/Semestre 12 - 2023/Compiladores e Interpretes/Proyectos/Proyecto 1/Bibliotecas/prueba.txt";   
        Reader reader = new BufferedReader(new FileReader (rutaAParsear));
        reader.read();
        Lexer lex = new Lexer(reader);
        int i = 0;
        Symbol token;
        while(true)
        {
            token = lex.next_token();
            if(token.sym != 0){
                System.out.println("Token: "+token.sym+ ", Valor: "+(token.value==null?lex.yytext():token.value.toString()));
            }
            else{
                System.out.println("Cantidad de lexemas encontrados: "+i);
                return;
            }
            i++;
        }
    }   
   
   
   
   
   public static void comprobarGramatica()throws IOException, SilentExit, Exception{
     /*Función que analiza léxica y sintácticamente un archivo de texto fuente.
       Entradas: N/A
       Salidas: Texto mencionando si la gramática del archivo de texto fuente puede realizarse o no según la gramática.
       Restricciones: N/A
       Notas: Tener cuidado y cambiar rutas de ficheros al momento de ejecutar
     */  
   
    String rutaAParsear = "F:/Ronaldo/TEC/Semestre 12 - 2023/Compiladores e Interpretes/Proyectos/Proyecto 1/Bibliotecas/prueba.txt";   
    
    try {
          Reader inputLexer = new FileReader(rutaAParsear);
          Lexer scanner = new Lexer(inputLexer);
          TablaSimbolos tablaSimbolos = new TablaSimbolos();
          Sintax myParser = new Sintax(scanner); // Pasar el scanner directamente
          myParser.parse();
          
          
          System.out.println("Gramática de Programa se puede realizar");
        } catch (SilentExit e) {
          System.out.println(e);
          System.out.println("No sirvió"); 
        }
   
   }
    
    public static void main(String[] args) throws IOException, SilentExit, Exception {
    /*Función principal que se encarga del flujo principal del programa.
       Entradas: N/A
       Salidas: Texto mencionando si la gramática del archivo de texto fuente puede realizarse o no según la gramática.
       Restricciones: N/A
       Notas: Tener cuidado y cambiar rutas de ficheros al momento de ejecutar
     */ 
    
    
    
    
    //generarScannerParser();
    //Buscarlexemas();
    comprobarGramatica();

    }
    
    
}
