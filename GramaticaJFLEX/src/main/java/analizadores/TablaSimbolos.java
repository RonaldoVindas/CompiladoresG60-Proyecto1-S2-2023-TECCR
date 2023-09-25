
package analizadores;

import java.util.*;
public class TablaSimbolos {
    private Map<String, String> simbolos;

    public TablaSimbolos() {
        simbolos = new HashMap<>();
    }

    public void addSymbol(String id, String valor) {
        simbolos.put(id, valor);
    }

    public String lookupSymbol(String id) {
        return simbolos.get(id);
    }

    public void printSymbolTable() {
        System.out.println("Tabla de Símbolos:");
        System.out.println("ID:    Valor:");
        for (Map.Entry<String, String> entry : simbolos.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
    }
    
    
}
