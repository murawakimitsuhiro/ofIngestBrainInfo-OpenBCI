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
    cam.setDistance(250);
    
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

//--------------------------------------------------------------
void ofApp::update(){
    OSCManager::get_instance().update();
    
    cam.lookAt(ofVec3f(0,0,0));
    
    float cosPos = cos(ofGetElapsedTimef()/10);
    float sinPos = sin(ofGetElapsedTimef()/10);
    
    if(cosPos > 0) {
        cam.setPosition(300*cosPos, 300*sinPos, 0);
    } else {
        cam.setPosition(-300*cosPos, 300*sinPos, 0);
    }
    cam.rotate(270, cam.getLookAtDir());
    
    brain.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofEnableDepthTest();
    
    ofEnableBlendMode(OF_BLENDMODE_ADD);
    
    cam.begin();
    ofPushStyle();
   
    brain.draw();
    
    ofPopStyle();
    cam.end();
    
    ofDisableDepthTest();
    
    //ofDrawBitmapString(test, 20, 20);
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

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
