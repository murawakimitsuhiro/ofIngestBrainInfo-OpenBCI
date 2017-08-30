//
//  CameraPositionGui.hpp
//  BrainFu_k
//
//  Created by Murawaki on 2017/08/30.
//
//

#ifndef CameraPositionGui_hpp
#define CameraPositionGui_hpp

#include <stdio.h>
#include "ofxGui.h"

class CameraPositionGui {
public:
    ofxPanel panel;
    ofxFloatSlider x;
    ofxFloatSlider y;
    ofxFloatSlider size;
    
    void setup(float x, float y, float size);
    void draw(int x, int y);
};

#endif /* CameraPositionGui_hpp */
