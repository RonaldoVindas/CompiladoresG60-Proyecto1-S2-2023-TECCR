
package analizadores;

import java.util.*;
public class TablaSimbolos {
    private Map<String, ArrayList<String>> simbolos;

    public TablaSimbolos() {
        simbolos = new HashMap<>();
    }

    public void addSymbol(String id, ArrayList<String> lista) {
        simbolos.put(id, lista);
         
    }

    public ArrayList<String> lookupSymbol(String id) {
        return simbolos.get(id);
    }

    public void printSymbolTable() {
        System.out.println("Tabla de Símbolos:");
        System.out.println("ID:    Valor:");
        for (Map.Entry<String, ArrayList<String>> entry : simbolos.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
    }
    
    
}
