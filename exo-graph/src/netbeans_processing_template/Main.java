// NOTE: You need to manually change the package name on the next line and in the line within the main function.
// This will be automated in future versions once my Netbeans powers have developed...
package netbeans_processing_template;


import processing.core.PApplet;
import processing.opengl.*;
/**
 *
 */
public class Main extends PApplet {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PApplet.main(new String[]{"netbeans_processing_template.Main"});
    }

    public void setup() {
        // TODO: setup application
        size(400,400,OPENGL);

        ellipse(200,200,50,50);
    }

    public void draw() {
        // TODO: handle each frame of drawing
    }
}
