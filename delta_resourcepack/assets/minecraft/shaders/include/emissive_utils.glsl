#version 150

// Checking for the exact alpha value breaks things, so I use this function to cut down on space while also making it work better.

bool check_alpha(float textureAlpha, float targetAlpha) {
	
	float targetLess = targetAlpha - 0.01;
	float targetMore = targetAlpha + 0.01;
	return (textureAlpha > targetLess && textureAlpha < targetMore);
	
}


// For cases in which you want something to have a lower light level, but still be bright when in light.

vec4 apply_partial_emissivity(vec4 inputColor, vec4 originalLightColor, vec3 minimumLightColor) {
	
	vec4 newLightColor = originalLightColor;
	newLightColor.r = max(originalLightColor.r, minimumLightColor.r);
	newLightColor.g = max(originalLightColor.g, minimumLightColor.g);
	newLightColor.b = max(originalLightColor.b, minimumLightColor.b);
	return inputColor * newLightColor;
	
}


// The meat and bones of the pack, does all the work for making things emissive.

vec4 make_emissive(vec4 inputColor, vec4 lightColor, vec4 maxLightColor, float vertexDistance, float inputAlpha) {
	
	if (vertexDistance > 800) return inputColor; // Vertex Distance > 800 generally means an object is in the UI, which we don't want to affect.
	
	if (check_alpha(inputAlpha, 252.0)) return inputColor; // Checks for alpha 252 and just returns the input color if it is. Used in the example pack for redstone ore and the zombie's eyes.
	else if (check_alpha(inputAlpha, 251.0)) return apply_partial_emissivity(inputColor, lightColor, vec3(0.411, 0.345, 0.388)); // Used in the example pack for ice.
	else if (check_alpha(inputAlpha, 250.0)) return inputColor; // You can copy & this line and change the function to add a new emissive type. Used in the example pack for lime concrete. 
	
	else return inputColor * lightColor; // If none of the pixels are supposed to be emissive, then it adds the light.
	
}


// Gets the dimension that an object is in, -1 for The Nether, 0 for The Overworld, 1 for The End.

float get_dimension(vec4 minLightColor) {
	
	if (minLightColor.r == minLightColor.g && minLightColor.g == minLightColor.b) return 0.0; // Shadows are grayscale in The Overworld
	else if (minLightColor.r > minLightColor.g) return -1.0; // Shadows are more red in The Nether
	else return 1.0; // Shadows are slightly green in The End
	
}


// Gets the face lighting of a block. Credits to Venaxsys for the original function.

vec4 get_face_lighting(vec3 normal, float dimension) { 
	
	vec4 faceLighting = vec4(1.0, 1.0, 1.0, 1.0);
	vec3 absNormal = abs(normal);
	float top = 229.0 / 255.0;
	float bottom = 127.0 / 255.0;
	float east = 153.0 / 255.0;
	float north = 204.0 / 255.0;
	
	// Top (only required in the Nether)
	if (normal.y > normal.z && normal.y > normal.x && check_alpha(dimension, -1.0)) faceLighting = vec4(top, top, top, 1.0); // It's not really checking the alpha but I'm too stubborn to change the function name
	
	// Bottom
	if (normal.y < normal.z && normal.y < normal.x && !check_alpha(dimension, -1.0)) faceLighting = vec4(bottom, bottom, bottom, 1.0);
	else if (normal.y < normal.z && normal.y < normal.x && check_alpha(dimension, -1.0)) faceLighting = vec4(top, top, top, 1.0);

	// East-West
	if (absNormal.x > absNormal.z && absNormal.x > absNormal.y) faceLighting = vec4(east, east, east, 1.0);

	// North-South
	if (absNormal.z > absNormal.x && absNormal.z > absNormal.y) faceLighting = vec4(north, north, north, 1.0);

	return faceLighting;
}


// Checks the alpha and removes face lighting if required.

vec4 face_lighting_check(vec3 normal, float inputAlpha, float dimension) {

	if (check_alpha(inputAlpha, 250.0)) return get_face_lighting(normal, dimension); // Checks for alpha 250, and runs it through the remove_face_lighting() function if it is. Used in the example pack for lime concrete.
	else return vec4(1.0, 1.0, 1.0, 1.0); // If the block doesn't need to have its face lighting removed, returns 1.0 so nothing gets divided.
	
}


// Makes sure transparent things don't become solid and vice versa.

float remap_alpha(float inputAlpha) {
	
	if (check_alpha(inputAlpha, 252.0)) return 255.0; // Checks for alpha 252 and converts all pixels of that to alpha 255. Used in the example pack for redstone ore and the zombie's eyes.
	else if (check_alpha(inputAlpha, 251.0)) return 190.0; // You can copy & paste this line and change the values to make any transparent block work with this pack. Used in the example pack for ice.
	else if (check_alpha(inputAlpha, 250.0)) return 255.0; // Used in the example pack for lime concrete.
	
	else return inputAlpha; // If a pixel doesn't need to have its alpha changed then it simply does not change.
	
}

