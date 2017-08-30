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
    secondCam.setDistance(250);
    
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
    
    camPosGui.setup();
}

void ofApp::setupViewPorts() {
	float xOffset = ofGetWidth() / 3;
	float yOffset = ofGetHeight() / 4;

    viewMain.x = camPosGui.x;//xOffset;
    viewMain.y = camPosGui.y;//0;
	viewMain.width = xOffset * 2;
	viewMain.height = ofGetHeight();
    
    /*
	for(int i = 0; i < 4; i++){
		viewGrid[i].x = 0;
		viewGrid[i].y = yOffset * i;
		viewGrid[i].width = xOffset;
		viewGrid[i].height = yOffset;
	}*/
}

//--------------------------------------------------------------
void ofApp::update(){
    OSCManager::get_instance().update();
    
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
    //secondCam.rotate(270, cam.getLookAtDir());
    
    brain.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofEnableDepthTest();
    
    ofEnableBlendMode(OF_BLENDMODE_ADD);
    
    cam.begin(viewMain);
    ofPushStyle();
   
    brain.draw();
    
    ofPopStyle();
    cam.end();
    /*
    secondCam.begin();
    ofPushStyle();
   
    brain.draw();
    
    ofPopStyle();
    secondCam.end();
     */
    
    ofDisableDepthTest();
    
    //ofDrawBitmapString(test, 20, 20);
    //firstFbo.draw(0, 0, 1000, 1000);
    camPosGui.draw();
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
    setupViewPorts();
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
