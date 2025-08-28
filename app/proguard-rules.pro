# Add project specific ProGuard rules here.

# Keep all model classes
-keep class com.rawafid.educational.models.** { *; }

# Keep Retrofit interfaces
-keep interface com.rawafid.educational.network.** { *; }

# Keep Room entities
-keep class com.rawafid.educational.database.entities.** { *; }

# Gson rules
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# OkHttp rules
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# Firebase rules
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
