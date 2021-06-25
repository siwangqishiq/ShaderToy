float rect(vec2 frag , float left , float top , float right , float bottom){
    if(frag.x >= left && frag.x <= right && frag.y >= bottom && frag.y <= top){
        return 1.0;
    }
    return 0.0;
}

float circle(vec2 frag , float x , float y , float radius){
    if(distance(frag , vec2(x, y)) <= radius){
        return 1.0;
    }
    
    return 0.0;
}

float roundRect(vec2 fragCoord , float left , float top , float right , 
        float bottom , float round_radius){
    //float round_radius = 100.0f;
    
    float r = rect(fragCoord ,left , top , right , bottom);
    
    float round_rect_size = round_radius;
    r -= rect(fragCoord , left , top , left + round_rect_size , top - round_rect_size);
    r -= rect(fragCoord , left , bottom + round_rect_size , left + round_rect_size , bottom);
    r -= rect(fragCoord , right - round_rect_size , top , right, top - round_rect_size);
    r -= rect(fragCoord , right - round_rect_size , bottom + round_rect_size , right , bottom);
    
    r += circle(fragCoord , left + round_radius , top - round_radius , round_radius);
    r += circle(fragCoord , left + round_radius , bottom + round_radius , round_radius);
    r += circle(fragCoord , right - round_radius , top - round_radius , round_radius);
    r += circle(fragCoord , right - round_radius , bottom + round_radius , round_radius);
    
    return r;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // Time varying pixel color
    vec3 result = vec3(1.0 , 1.0 ,1.0);
    
    float width = iResolution.x / 2.0;
    float height = iResolution.y / 2.0;
    float left = width / 2.0;
    float top = iResolution.y - height / 2.0;
    float right = left + width;
    float bottom = top - height;
    
    float round_radius = 60.0f + 40.0 * sin(iTime);
    
    float r = roundRect(fragCoord , left , top , right , bottom , round_radius);
    
    result = result * r;

    // Output to screen
    fragColor = vec4(result , 1.0);
}