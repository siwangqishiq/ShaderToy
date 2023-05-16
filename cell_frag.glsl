precision mediump float;

uniform float viewWidth;
uniform float viewHeight;

out vec4 FragColor;

float weight(vec2 pos , vec4 rect){
    vec2 center = vec2(rect.x + rect.z / 2.0f , rect.y - rect.w / 2.0f);
    return 1.0f - distance(center , pos) / rect.z;
}

float renderRect(vec2 pos , vec4 rect){
    float result = 0.0f;
    if(pos.x >= rect.x && pos.x <= rect.x + rect.z 
        && pos.y <= rect.y && pos.y >= rect.y - rect.w){
        result = 0.8f * weight(pos , rect);
    }
    return result;
}


void main(){
    vec4 color = vec4(0.0f , 0.0f , 0.0f , 1.0f);

    vec2 pos = gl_FragCoord.xy;
    float width = viewWidth / 10.0f;
    float height = width;

    float x = 0.0f;
    float y = viewHeight;
    float padding = 0.0f;
    float value = 0.0f;

    while(y >= 0.0f){
        while(x <= viewWidth){
            vec4 rect = vec4(x , y, width , width);
            value += renderRect(pos , rect);
            x += (width + padding);
        }//end while for x
        x = 0.0f;
        y -= (width + padding);
    }//end while y
    FragColor = vec4(color.rgb , value);
}