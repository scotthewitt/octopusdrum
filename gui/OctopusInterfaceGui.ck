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
    //flash led
    spork ~ flash();
    
    button.toggleType();
    button.name("On/Off");
    button.position( 50, 0 );
    1 => button.state;
    gui.addElement( button );
    gui.addElement( led );

         
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
    //act on button press
    spork ~ onoffbuttoncheck();   
    
    buf =< out;
    buf => Envelope e => out;
    4::ms => e.duration;
    1.0 => e.value;
        
    MAUI_Slider slider;
    MAUI_Gauge gauge;
    gui.addElement(slider);
    gui.addElement(gauge);
    slider.position( 120, 10 );
    gauge.position( 120, 0 );
    slider.range( 0.0, 1.0 );
    
    function void slidervalue()
    {
        float f;
        while(1)
        {
            slider => now;        
            slider.value() => e.target;
            //let envelope smooth
            e.duration() => now;
        }
    }
    
    spork ~ slidervalue();
    
    function void lev_mon (){
        while (true){
            out.last() * 100.0 => gauge.value;
            30::ms => now;
        }
    }
    
    spork ~ lev_mon();

    
    gui.size(350,90);
    gui.name("Sound");
    gui.display(); 
}