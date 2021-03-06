#version 420

layout(location = 0) in vec2 inUV;

out vec4 frag_color;

layout (binding = 0) uniform sampler2D s_screenTex;

//Intensity of the sepia effect
//Lower the number, closer to regular color
uniform float u_Intensity = 0.6;

void main() 
{
	if (u_Intensity > 0.0) {
		float N = 64 / u_Intensity;
		vec2 stepUV = floor(inUV * N) / N;
		frag_color = texture(s_screenTex, stepUV);
	}
	else {
		frag_color = texture(s_screenTex, inUV);
	}
}