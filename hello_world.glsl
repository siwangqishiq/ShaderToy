void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    //vec2 uv = fragCoord/iResolution.xy;
    
    vec2 circle = iResolution.xy / 2.0;

    float radius = iResolution.y / 2.0;
    
    //float x = fragCoord.x;
    //float y = fragCoord.y;
    
    //if(length(circle - fragCoord.xy) <= radius){
    //    fragColor = vec4(0.0 , 0.0 , 1.0, 1.0);
    //}else{
    //    fragColor = vec4(0.0 , 0.0 , 0.0, 1.0);
    //}
    
    float cVal = 1.0 - step(radius , length(circle - fragCoord.xy));
    fragColor = vec4(cVal , 0.0 , 0.0 ,1.0);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    //vec2 uv = fragCoord/iResolution.xy;
    
    vec2 circle = iResolution.xy / 2.0;

    float radius = iResolution.y / 4.0;
    
    float cVal = smoothstep(radius , radius - 100.0, length(circle - fragCoord.xy));
    
    fragColor = vec4(cVal , cVal , cVal ,1.0);
}