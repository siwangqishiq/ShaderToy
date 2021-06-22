

vec3 circle(vec2 frag , vec2 center , float radius , vec3 color){
    return step(length(frag - center),radius) * color;
}

vec3 blend(vec3 src , vec3 dst){
    float dst_length =length(dst);
    return step(dst_length , 0.0) * src + step(0.0, dst_length) * dst;
}

vec3 rect(vec2 frag , float left , float top , 
            float right , float bottom ,vec3 color, float blur){
     if(frag.x >= left && frag.x <= right 
         && frag.y >= bottom && frag.y <= top){
         return color;
     }
     
     return vec3(0.0,0.0,0.0);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    vec3 result = vec3(0.0,0.0,0.0);
    
    vec3 result1 = circle(fragCoord , vec2(20.0f , 100.0f) , 50.0f , vec3(1.0f , 1.0 , 1.0));
    
    vec3 result2 = circle(fragCoord , vec2(200.0f , 250.0f) , 60.0f , vec3(0.0f , 1.0 , 0.0));
    
    result = blend(result1 , result2);
    
    vec3 result4 = circle(fragCoord , vec2(150.0f , 250.0f) , 60.0f , vec3(0.0f , 0.0 , 1.0));
    
    result = blend(result , result4);
    
    vec3 rect1 = rect(fragCoord , 200.0 , 400.0 , 500.0 , 200.0 , vec3(0.0,1.0,1.0) , 0.0);
    result = blend(result , rect1);
    // Output to screen
    fragColor = vec4(result,1.0);
}