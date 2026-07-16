Pod::Spec.new do |s|

  s.name              = "KituraContracts"
  s.module_name       = 'KituraContracts'
  s.version           = "2.1.0"
  s.cocoapods_version = '~> 1.16'
  s.summary           = "KituraContracts is a library containing type definitions shared by client and server code."
  s.homepage          = "https://github.com/Kitura/KituraContracts"
  s.license           = {
                          :type => "Apache License, Version 2.0"
                        }
  s.source            = {
                          :git => "https://github.com/Kitura/KituraContracts.git",
                          :tag => s.version
                        }
  s.author            = "IBM"

  s.swift_version = '5.8'

  s.ios.deployment_target = "12.0"
  s.osx.deployment_target = "11.0"
  s.tvos.deployment_target = "12.0"
  s.watchos.deployment_target = "8.0"

  s.source_files      = "Sources/**/*.swift"

  s.dependency 'LoggerAPI', '~> 2.1'

end
