classdef SmokeTests < matlab.unittest.TestCase
    
    properties (TestParameter)
        DemoFile = struct( ... 
			'VirtualSensorModel', {@VirtualSensorModel});
    end    
    
    methods (TestClassSetup)
        
        % Shut off graphics warnings
        function suppressWarnings(testCase)            
            warnids = ["MATLAB:hg:AutoSoftwareOpenGL" ...
                       % Add additional warning IDs here 
                       ]; %#ok<NBRAK2>    
            import matlab.unittest.fixtures.SuppressedWarningsFixture
            testCase.applyFixture(SuppressedWarningsFixture(warnids))

        end
        
        % Close any new figures created by doc
        function saveExistingFigures(testCase)            
            existingfigs = findall(groot, 'Type', 'Figure');
            testCase.addTeardown(@()delete(setdiff(findall(groot, 'Type', 'Figure'), existingfigs)))
            
        end
        
    end
    
    methods (Test)
        
        function demoShouldNotWarn(testCase, DemoFile)       
            testCase.verifyWarningFree(DemoFile);
            
        end
        
        
        
    end

end
