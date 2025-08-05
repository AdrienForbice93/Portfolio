precision highp float;

uniform float uTime;
uniform vec3 uColor;

varying vec4 vRandom;

void main() {
    vec2 uv = gl_PointCoord.xy * 2.0 - 1.0; // Centre les coordonnées
    
    // Créer une forme d'étoile simple avec des croix - encore plus grandes (doublées)
    float horizontal = smoothstep(0.2, 0.0, abs(uv.y)) * smoothstep(2.0, 0.0, abs(uv.x));
    float vertical = smoothstep(0.2, 0.0, abs(uv.x)) * smoothstep(2.0, 0.0, abs(uv.y));
    
    // Diagonales pour une étoile plus complète - encore plus grandes (doublées)
    float diag1 = smoothstep(0.19, 0.0, abs(uv.x - uv.y)) * smoothstep(1.4, 0.0, length(uv));
    float diag2 = smoothstep(0.19, 0.0, abs(uv.x + uv.y)) * smoothstep(1.4, 0.0, length(uv));
    
    // Centre de l'étoile - encore plus grand (doublé)
    float center = smoothstep(0.4, 0.0, length(uv));
    
    // Combiner toutes les parties
    float star = max(max(horizontal, vertical), max(max(diag1, diag2), center));
    
    // Effet de scintillement - toutes les 0.5 secondes
    // Utiliser vRandom pour que chaque étoile ait un timing légèrement différent
    float timeOffset = vRandom.x * 6.28; // Décalage aléatoire pour chaque étoile
    float twinkleSpeed = 4.0; // 4.0 = 2 cycles par seconde = scintillement toutes les 0.5s
    float twinkle = 0.5 + 0.5 * sin(uTime * twinkleSpeed + timeOffset);
    
    // Appliquer le scintillement à l'étoile
    star *= twinkle;
    
    gl_FragColor.rgb = uColor;
    gl_FragColor.a = star;
}
