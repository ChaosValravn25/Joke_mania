import com.android.build.gradle.internal.dsl.BaseAppModuleExtension
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmOptions

plugins {
    id("com.android.application")
    kotlin("android")
    id("dev.flutter.flutter-gradle-plugin") // Ojo, esta línea puede variar ligeramente en proyectos antiguos
}

android {
    namespace = "com.example.joke_mania"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.example.joke_mania"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    ndkVersion = "27.0.12077973"

    signingConfigs {
        create("release") {
            storeFile = file(System.getenv("KEYSTORE_PATH") ?: rootProject.file("key.properties").parentFile.path + "/upload-keystore.jks")
            storePassword = System.getenv("KEYSTORE_PASSWORD") ?: project.findProperty("storePassword") as String?
            keyAlias = System.getenv("KEY_ALIAS") ?: project.findProperty("keyAlias") as String?
            keyPassword = System.getenv("KEY_PASSWORD") ?: project.findProperty("keyPassword") as String?
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
        debug {
            // Opcional
        }
    }

   
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    
    (this as BaseAppModuleExtension).kotlinOptions {
        jvmTarget = "17"
    }
}

flutter {
    source = "../.."
}

