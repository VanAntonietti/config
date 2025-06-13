/ {
    keymap {
        compatible = "zmk,keymap";

        default_layer {
            bindings = <
                // Top row (QWERTY)
                &kp Q &kp W &kp E &kp R &kp T

                // Left Home Row Mods
                &mt LGUI A  // Tap = A, Hold = Left GUI (Command on macOS)
                &mt LALT S   // Tap = S, Hold = Left Alt
                &mt LSHIFT D   // Tap = D, Hold = Left Shift
                &mt LCTL F  // Tap = F, Hold = Left Control
                &kp G

                // Right Home Row Mods
                &kp H
                &mt RCTL J    // Tap = J, Hold = Right Control
                &mt RSHIFT K   // Tap = K, Hold = Right Shift
                &mt RALT L    // Tap = L, Hold = Right Alt
                &mt RGUI SEMI // Tap = Semicolon , Hold Right GUI (Command on macOS)

                // Bottom row (QWERTY)
                &kp Z &kp X &kp C &kp V &kp B
            >;
        };
    };
};
