//
//  CameraPositionGui.cpp
//  BrainFu_k
//
//  Created by Murawaki on 2017/08/30.
//
//

#include "CameraPositionGui.hpp"

void CameraPositionGui::setup(float defX, float defY, float defSize) {
    panel.setup();
    panel.add(x.setup("x", defX, 0, 1000));
    panel.add(y.setup("y", defY, 0, 800));
    panel.add(size.setup("size", defSize, 300, 900));
}

void CameraPositionGui::draw(int x, int y) {
    panel.setPosition(x, y);
    panel.draw();
}
