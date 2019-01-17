
# Mira Paint

#### Mira fractal paint demo using the Gumowski-Mira equation.


At CERN in 1980, I. Gumowski and C. Mira devised their equation to calculate the trajectories of sub-atomic particles.

A side effect of the equation is the generation of some quite interesting patterns.

And with the relatively fast pixel-plotting of ActionScript 3, the equation can become a spray pattern.


## Demo

[Mira Paint](http://copysense.co.uk/mira/MiraPaint.swf)


## Controls

        paint              <kbd>mouse left</kbd> *down*, *hold* to spray
        colour change      <kbd>mouse left</kbd> *release*, then *down*
        clear              <kbd>spacebar</kbd>


## Build

Using the Flex compiler on Linux / Windows:

        ./mxmlc MiraPaint.as

        mxmlc MiraPaint.as


## Execute

Most browsers, because of revised security, will now not load a Flash *.swf* directly.

*MiraRunner.html* and the *js/* directory provide old code to run *MiraPaint.swf* in a browser.


## License

Licensed under the [MIT License](https://github.com/Tinram/Mira-Paint/blob/master/LICENSE).