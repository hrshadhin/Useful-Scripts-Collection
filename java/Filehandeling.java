/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package filehandeling;

/**
 *
 * @author dcr007
 */
public class Filehandeling {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       java.io.File file = new java.io.File("drawing.png");
      System.out.println("Does it exist? " + file.exists());
      System.out.println("Can it be read? " + file.canRead());
      System.out.println("Can it be written? " + file.canWrite());
      System.out.println("Is it a directory? " + file.isDirectory());
      System.out.println("Is it a file? " + file.isFile());
      System.out.println("Is it absolute? " + file.isAbsolute());
      System.out.println("Is it hidden? " + file.isHidden());
      System.out.println("Absolute path is " +
       file.getAbsolutePath());
      System.out.println("Last modified on " +
       new java.util.Date(file.lastModified()));
    }
}
