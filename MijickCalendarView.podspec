Pod::Spec.new do |s|
  s.name                  = 'MijickCalendarView'
  s.summary               = 'Create fully customisable calendar in no time. Keep your code clean'
  s.description           = <<-DESC
    MijickCalendarView is a free and open-source library designed for SwiftUI that makes the process of creating calendars easier and much cleaner.
                               DESC
  
  s.version               = '1.0.0'
  s.ios.deployment_target = '17.0'
  s.osx.deployment_target = '11.0'
  s.swift_version         = '5.0'
  
  s.source_files          = 'Sources/**/*'
  s.frameworks            = 'SwiftUI', 'Foundation', 'Combine'
  
  s.homepage              = 'https://github.com/Mijick/CalendarView'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Tomasz Kurylik' => 'tomasz.kurylik@mijick.com' }
  s.source                = { :git => 'https://github.com/Mijick/CalendarView', :tag => s.version.to_s }
end
