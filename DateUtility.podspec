Pod::Spec.new do |s|
          #1.
          s.name               = "DateUtility"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary         = "Sort description of 'YLogging' framework"
          #4.
          s.homepage        = "https://www.linkedin.com/in/dipang-sheth-886a335b/"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = “Dipang”
          #7.
          s.platform            = :ios, "10.0"
          #8.
          s.source              = { :git => "https://github.com/dipang90/DateUtility.git", :tag => "1.0.0" }
          #9.
          s.source_files     = "DateUtility", "DateUtility/**/*.{h,m,swift}"
    end