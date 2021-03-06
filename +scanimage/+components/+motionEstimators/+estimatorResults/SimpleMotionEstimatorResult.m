classdef SimpleMotionEstimatorResult < scanimage.interfaces.IMotionEstimatorResult    
    properties (SetAccess = protected)
    end
    
    methods
        function obj = SimpleMotionEstimatorResult(hMotionEstimator,roiData,dr,confidence,correlation)
            obj = obj@scanimage.interfaces.IMotionEstimatorResult(hMotionEstimator,roiData);
            obj.dr = dr;
            obj.confidence = confidence;
            obj.correlation = correlation;
        end
        
        function delete(obj)
            % No-op
        end
        
        function tf = wait(obj,timeout_s)
            tf = true; % Synchronous operation
        end
        
        function dr = fetch(obj)
            dr = obj.dr;
        end
    end
end

%--------------------------------------------------------------------------%
% SimpleMotionEstimatorResult.m                                            %
% Copyright � 2018 Vidrio Technologies, LLC                                %
%                                                                          %
% ScanImage is licensed under the Apache License, Version 2.0              %
% (the "License"); you may not use any files contained within the          %
% ScanImage release  except in compliance with the License.                %
% You may obtain a copy of the License at                                  %
% http://www.apache.org/licenses/LICENSE-2.0                               %
%                                                                          %
% Unless required by applicable law or agreed to in writing, software      %
% distributed under the License is distributed on an "AS IS" BASIS,        %
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. %
% See the License for the specific language governing permissions and      %
% limitations under the License.                                           %
%--------------------------------------------------------------------------%
