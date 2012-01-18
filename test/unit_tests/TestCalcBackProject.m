classdef TestCalcBackProject
    %TestCalcBackProject
    properties (Constant)
        path = fileparts(fileparts(mfilename('fullpath')))
        img = imread([TestCalcBackProject.path,filesep,'img001.jpg'])
    end
    
    methods (Static)
    	function test_1
            edges = {linspace(0,256,32+1),linspace(0,256,32+1)};
            H = calcHist(TestCalcBackProject.img(:,:,1:2),edges);
            b = calcBackProject(TestCalcBackProject.img(:,:,1:2),H,edges);
    	end
    	
        function test_error_1
            try
                calcBackProject();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end
    
end

