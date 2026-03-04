shader_type canvas_item;

uniform float start = 30.0;
uniform float start_w = 40.0;
uniform float fraquence = 230.0;
uniform float amplitude = 30;
uniform float size = 292.0;
uniform float relative_pos : hint_range(-1.0, 1.0) = 0.0;
uniform bool flip_h = false;

void vertex() {
	float correct_relative_pos = flip_h? -relative_pos : relative_pos;
	float rel_size = size*correct_relative_pos;
	float vertex = flip_h? (size-VERTEX.x)+rel_size : VERTEX.x+rel_size;

	bool b = vertex > start;
	
	float mul = b? 1.0 : -1.0;
	float m = b? start : 0.0;
	float n = b? 0.0 : start_w;
	
	VERTEX.y += sin((vertex-m-n) / fraquence) * amplitude * mul;
}
//
//void fragment() {
	//if(flip_h){
		//COLOR = texture(TEXTURE, UV-vec2(0, 0.001)) - vec4(0.2);
	//}
//}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
