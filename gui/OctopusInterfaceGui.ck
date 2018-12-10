public class OctopusInterface extends Seq{
    //Event beat;
    
    MAUI_LED led;
    MAUI_Button button;
    MAUI_View gui;
    led.color( led.red );
    led.size( 50, 50 );
    led.position( 10, 20 );
    //led.light();
    
    function void flash ()
    {
        while(1)
        {
            beat => now; 
            led.light();
            50::ms => now;
            led.unlight();
        }
    }
    
    spork ~ flash();
    
    button.toggleType();
    button.name("On/Off");
    button.position( 50, 0 );
    1 => button.state;
    gui.addElement( button );
    gui.size(150,90);
    gui.addElement( led );
    gui.name("Sound");
    gui.display();
         
    //on/off sound
    function void onoffbuttoncheck()
    {
        <<< "check" >>>;
        Envelope temp => blackhole;
        2::ms => temp.duration;
        button.state() * 1.0 => temp.target;
        0::samp => dur counter;
        while(1)
        {
            0::samp => counter;
            button => now;
            button.state() * 1.0 => temp.target;
            while(counter < temp.duration())
            {
                counter + 1::samp => counter;
                temp.value() => out.gain;
                1::samp => now;
            }
            button.state() * 1.0 => out.gain;
        }
    }
    
    spork ~ onoffbuttoncheck();    
}