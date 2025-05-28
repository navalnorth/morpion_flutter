# ProGuard rules for Flutter project

# Keep Flutter classes
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Keep your own app code
-keep class com.example.morpion.** { *; }
-dontwarn com.example.morpion.**

# Optional: Keep annotations
-keepattributes *Annotation*