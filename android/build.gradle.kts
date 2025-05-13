// ✅ أضيفي هذا القسم في أعلى الملف
plugins {
    // بلوجين Google Services، ضروري لفك تشفير google-services.json
    id("com.google.gms.google-services") version "4.3.15" apply false
}

// ⬇️ ثم أبقي باقي الكود كما هو
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
