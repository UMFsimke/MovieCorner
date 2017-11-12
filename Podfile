# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'MovieCorner' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MovieCorner
  pod 'SwiftyJSON', '~> 3.1'
  pod 'Alamofire', '~> 4.5'
end

post_install do |installer|
    appProject = Xcodeproj::Project.open(Dir.glob("*.xcodeproj")[0])
    podsProject = installer.pods_project
    
    [appProject, podsProject].each do |project|
        setSwiftVersion(4, project)
        setBuildForActiveArchitecturesInDebug(project)
        enableWholeModuleCompilation(project)
    end

    appProject.save()
end

def setSwiftVersion(version, project)
    allConfigs(project).each do |config|
        config.build_settings['SWIFT_VERSION'] = "#{version}"
    end
end

def setBuildForActiveArchitecturesInDebug(project)
    allConfigs(project).each do |config|
        if connfigIsRelease?(config)
            config.build_settings['ONLY_ACTIVE_ARCH'] = "NO"
        else
            config.build_settings['ONLY_ACTIVE_ARCH'] = "YES"
        end
    end
end

def enableWholeModuleCompilation(project)
    allConfigs(project).each do |config|
        if connfigIsRelease?(config)
            config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
        else
            config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
            config.build_settings['SWIFT_WHOLE_MODULE_OPTIMIZATION'] = 'YES'
        end
    end
end

def connfigIsRelease?(config) 
    return config.name == 'Release'    
end

def allConfigs(project)
    configs = project.build_configurations
    project.targets.each do |target|
        configs += target.build_configurations
    end
    return configs
end
