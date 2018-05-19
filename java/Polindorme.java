/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package polindorme;

/**
 *
 * @author dcr007
 */
import javax.swing.JOptionPane;
public class Polindorme {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String s = JOptionPane.showInputDialog("Enter a string:");
 
      // Declare and initialize output string
     String output = "Ignoring nonalphanumeric characters, \nis "
       + s + " a palindrome? " + isPalindrome(s);

    // Display the result
JOptionPane.showMessageDialog(null, output);
    }
  /** Return true if a string is a palindrome */
   public static boolean isPalindrome(String s) {
     // Create a new string by eliminating nonalphanumeric chars
        String s1 = filter(s);

     // Create a new string that is the reversal of s1
     String s2 = reverse(s1);

     // Compare if the reversal is the same as the original strin
    return s2.equals(s1);
   }

   /** Create a new string by eliminating nonalphanumeric chars */
   public static String filter(String s) {
     // Create a string buffer
     StringBuffer strBuf = new StringBuffer();     // Examine each char in the string to skip alphanumeric char
     for (int i = 0; i < s.length(); i++) {
       if (Character.isLetterOrDigit(s.charAt(i))) {
         strBuf.append(s.charAt(i));
       }
     }

     // Return a new filtered string
     return strBuf.toString(); 
}

  /** Create a new string by reversing a specified string */
   public static String reverse(String s) {
     StringBuffer strBuf = new StringBuffer(s);
    strBuf.reverse(); // Use the reverse method for StringBuffer object
    return strBuf.toString();
   }
 }

    

