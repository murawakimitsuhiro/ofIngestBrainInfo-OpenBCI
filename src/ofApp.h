#pragma once

#include "ofxiOS.h"
#include "BrainController.hpp"
#include "ofxOscMessage.h"
#include "ofxGui.h"
#include "CameraPositionGui.hpp"

class ofApp : public ofxiOSApp {
    
public:
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
private:
    /*
    ofEasyCam cam;
    ofEasyCam secondCam;
    */
    
    static const int viewNum = 4;
    ofEasyCam cameras[viewNum];
    ofRectangle views[viewNum];
    CameraPositionGui camPosGui[viewNum];
    
    ofLight light;
    ofLight secondLight;
    
    BrainController brain;
    
    int cameraAngle;
    
    void setupViewPorts();
};

