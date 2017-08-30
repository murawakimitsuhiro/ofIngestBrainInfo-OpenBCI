//
//  CameraPositionGui.cpp
//  BrainFu_k
//
//  Created by Murawaki on 2017/08/30.
//
//

#include "CameraPositionGui.hpp"

void CameraPositionGui::setup() {
    panel.setup();
    panel.add(x.setup("x", -50, 50, 0));
    panel.add(y.setup("y", -50, 50, 0));
    panel.add(width.setup("width", 300, 900, 0));
    panel.add(height.setup("height", 300, 900, 0));
}

void CameraPositionGui::draw() {
    panel.draw();
}
