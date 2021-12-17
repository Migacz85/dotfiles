#!/usr/bin/sh

killall picom

# use a file to track grayscale mode
if grep -q '1' /tmp/grayscale; then
    echo 0 > /tmp/grayscale 
else
    sleep 0.1
    picom -b  --backend glx --glx-fshader-win "
    uniform sampler2D tex;
    void main() {

         vec4 c = texture2D(tex, gl_TexCoord[0].xy);
         float y = dot(c.rgb, vec3(0.299, 0.300, 0.314));
         gl_FragColor = vec4(y+0.00, y, y, 1);
   }"
    echo 1 > /tmp/grayscale
fi
