//
//  BrainController.cpp
//  Brain-Fu_k
//
//  Created by Murawaki on 2017/08/20.
//
//

#include "BrainController.hpp"

void BrainController::setup() {
    for(int i=0; i<BrainModelData::modelNum; i++) {
        string tmp = BrainModelData::basePath + BrainModelData::modelNames[i];
        models[i].loadModel(tmp);
        models[i].setScaleNormalization(false);
    }
    
    setupOSCMessageReceive();
}

//LINK OSC
void BrainController::setupOSCMessageReceive() {
    /* /gain to gain */
    OSCManager::get_instance().setMessageReceiver("/gain", gain);
    OSCManager::get_instance().setMessageReceiver("/debug_target", debugTarget);
}

void BrainController::update() {
    for (int i = 0; i < modelNum; i++) {
        models[i].setScaleNormalization(false);
    }
    
    if (5 < ofGetElapsedTimef()) {
        models[debugTarget].startDecompose();
    }
}

/* call in camera rendering */
void BrainController::draw() {
    for (int i = 0; i < modelNum; i++) {
        ofSetColor(255, 10);
        
        /*
        if (OSCManager::get_instance().fft[i] > 0.01) {
            ofSetColor(0, 255, 0, 30);
        }
        
        if (OSCManager::get_instance().fft[i] > 0.025) {
            ofSetColor(0, 0, 255, 30);
        }
        
        if (OSCManager::get_instance().fft[i] > 0.05) {
            ofSetColor(255, 0, 0, 30);
        } */
        
        /*
        if (i == debugTarget) {
            ofSetColor(255, 0, 0, 30);
            
            models[i].drawCustom();
            //drawWithMesh(models[i]);
            continue;
        }*/
        
        models[i].drawWireframe();
    }
}

/*draw the model manually
void BrainController::drawWithMesh(ofxAssimpModelLoader model){
    
    //get the model attributes we need
    ofVec3f scale = model.getScale();
    ofVec3f position = model.getPosition();
    float normalizedScale = model.getNormalizedScale();
    ofVboMesh mesh = model.getMesh(0);
    
    ofPushMatrix();
    
    float randX = ofRandom(-10, 10);
    vector<ofVec3f>& verts = mesh.getVertices();
    for(unsigned int i = 0; i < verts.size(); i++){
        verts[i].y += randX;
    }
    
    mesh.drawVertices();//drawWireframe();
    ofPopMatrix();
}
*/