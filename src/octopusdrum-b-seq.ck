//create per drum sequencer
public class Seq extends Drum{
   float pattern[];
   300::ms => dur interval;
   
   //play pattern at set tempo
   function void playpattern()
   {
       for (0 => int i; i < pattern.cap(); i++)
       {
           if(pattern[i] != 0.0)
           {
               spork ~ playsample(pattern[i]);
               //<<< "played" >>>;
           }
           interval => now;
       }
   }
  
  //set pattern
  function void setpattern(float newpattern[])
  {
      newpattern @=> pattern;
  }
  
  //play pattern at new tempo
  function void playpattern(dur intervalin)
  {
      intervalin => interval;
      playpattern();
  }
   
   //play pattern looped
   function void loop()
   {
       while (1)
       {
           playpattern();
       }
   }
   
   //set tempo and play pattern looped
   function void loop(dur intervalin)
   {
       intervalin => interval;
       while (1)
       {
           playpattern();
       }
   }
}

<<< "octopusDrum Seq Loaded" >>>;

