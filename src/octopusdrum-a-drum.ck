public class Drum{
 
 SndBuf buf => Gain out;
 0 => buf.loop;
 string filename;
 0.0 => buf.rate;
 
 function void loadsample(string samplepath){
     me.sourceDir() + samplepath => filename;
     filename => buf.read;
     <<< buf.length() >>>;
 }
 
 function dur samplelength(){
     return buf.length();
 }
 
 function dur checksample(){
     <<< buf.length() >>>;
     return buf.length();
 }
      
 function void playsample (float amp, float playrate, int startpoint)
 {
     startpoint => buf.pos;
     amp => buf.gain;
     playrate => buf.rate;
     buf.length() => now;
     //!message useful for error checking
     //<<< "play" + filename >>>;
     0 => buf.rate;    
 }
 
 //!calling over loaded functions
 function void playsample(float ampgain){
     playsample(ampgain, 1.0, 0);
 }
 
 function void playsample(){
     playsample(0.7, 1.0, 0);
 }
}

<<< "octopusDrum Loaded" >>>;
