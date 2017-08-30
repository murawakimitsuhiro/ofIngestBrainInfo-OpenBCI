#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    OSCManager::get_instance().setup(8000);
    
    ofBackgroundHex(0x000000);
    ofSetFrameRate(30);
    ofEnableAlphaBlending();
    ofEnableBlendMode(OF_BLENDMODE_ALPHA);
    ofEnableDepthTest();
    glShadeModel(GL_SMOOTH);
    ofEnableSeparateSpecularLight();
    ofSetOrientation(OF_ORIENTATION_90_LEFT);
    
//camera
    /*
    cam.setDistance(250);
     */
    for(int i = 0; i < viewNum; i++){
        cameras[i].setDistance(250);
        switch(i) {
            case 0:
                camPosGui[i].setup(230, 655, 540);
                break;
            case 1:
                camPosGui[i].setup(475, 460, 540);
                break;
            case 2:
                camPosGui[i].setup(215, 240, 540);
                break;
            case 3:
                camPosGui[i].setup(0, 460, 540);
                break;
            default: break;
        }
    }
    
    setupViewPorts();
    
/*light setup
    ofFloatColor initAmbColor = ofFloatColor(0.8, 0.8, 0.8,1.0);
    ofFloatColor initDifColor = ofFloatColor(0.7, 0.7, 0.7);
    ofFloatColor initSpeColor = ofFloatColor(0.6, 0.6,0.6);
    
    light.enable();
    light.setAreaLight(2000, 2000);
    light.setPosition(100, 100, 100);
    light.setAmbientColor(initAmbColor);
    light.setDiffuseColor(initDifColor);
    light.setSpecularColor(initSpeColor);
    
    secondLight.enable();
    secondLight.setAreaLight(2000, 2000);
    secondLight.setPosition(100, -100, 100);
    secondLight.setAmbientColor(initAmbColor);
    secondLight.setDiffuseColor(initDifColor);
    secondLight.setSpecularColor(initSpeColor);
 */
    
    brain.setup();
    
    OSCManager::get_instance().setMessageReceiver("/camera_angle", cameraAngle);
}

void ofApp::setupViewPorts() {
	for(int i = 0; i < viewNum; i++){
        views[i].x = camPosGui[i].x;
		views[i].y = camPosGui[i].y - 500;
        views[i].width = camPosGui[i].size;
        views[i].height = camPosGui[i].size*1.5;
	}
}

//--------------------------------------------------------------
void ofApp::update(){
    OSCManager::get_instance().update();
    /*
    cam.lookAt(ofVec3f(0,0,0));
    secondCam.lookAt(ofVec3f(0, 0, 0));
    
    float cosPos = cos(ofGetElapsedTimef()/10);
    float sinPos = sin(ofGetElapsedTimef()/10);
    
    if(cosPos > 0) {
        cam.setPosition(300*cosPos, 300*sinPos, 0);
        secondCam.setPosition(300*cosPos, 300*sinPos, 0);
    } else {
        cam.setPosition(-300*cosPos, 300*sinPos, 0);
        secondCam.setPosition(-300*cosPos, -300*sinPos, 0);
    }
    
    cam.rotate(270, cam.getLookAtDir());
    */
    for (int i=0; i<viewNum; i++) {
        cameras[i].lookAt(ofVec3f(0, 0, 0));
        float cosPos = cos(ofGetElapsedTimef()/10);
        float sinPos = sin(ofGetElapsedTimef()/10);
        
        if(cosPos > 0) {
            cameras[i].setPosition(300*cosPos, 300*sinPos, 0);
        } else {
            cameras[i].setPosition(-300*cosPos, 300*sinPos, 0);
        }
        
        cameras[i].rotate(270 - 90*i, cameras[i].getLookAtDir());
    }
    
    brain.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofEnableDepthTest();
    
    ofEnableBlendMode(OF_BLENDMODE_ADD);
    
    for (int i=0; i<viewNum; i++) {
        cameras[i].begin(views[i]);
        ofPushStyle();
        
        brain.draw();
        
        ofPopStyle();
        cameras[i].end();
    }
    
    ofDisableDepthTest();
    
    /*
    for (int i=0; i<viewNum; i++) {
        camPosGui[i].draw(0, i*100);
    }*/
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    setupViewPorts();
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
