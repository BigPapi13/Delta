#include <iostream>

int main() {
    int cmd = 130000;
    for (int size = 1; size <= 8; size++) {
        for(int frame = 0; frame <= 15; frame++) {
            std::cout << "{\"predicate\": {\"custom_model_data\": " << cmd << "}, \"model\": \"delta:particle/size_" << size << "/explosion_" << frame << "\"},\n";
            cmd++;
        }
    }
    return 0;
}