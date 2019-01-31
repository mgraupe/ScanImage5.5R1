classdef PerformancePlot < handle
    properties
        averaging = 30;
        changedCallback = function_handle.empty(0,1);
    end
    
    properties (Dependent)
        visible;
    end
    
    properties (Access = private)
        lastTic;
        tHistory;
        hTimePlot;
    end
    
    events
        changed
    end
    
    %% Lifecycle
    methods
        function obj = PerformancePlot(name, visible)
            if nargin < 1 || isempty(name)
                name = 'Performance Plot';
            end
            
            if nargin < 2 || isempty(visible)
                visible = true;
            end
            
            obj.hTimePlot = most.util.TimePlot(name,visible);
            obj.hTimePlot.xLabel = 'Execution #';
            obj.hTimePlot.yLabel = 'Execution time [ms]';
            obj.hTimePlot.changedCallback = @obj.changedCallbackInternal;
        end
        
        function delete(obj)
            most.idioms.safeDeleteObj(obj.hTimePlot);
        end
    end
    
    %% Public methods
    methods
        function tic(obj)
            if obj.visible
                obj.lastTic = tic();
            end
        end
        
        function toc(obj)
            if obj.visible && ~isempty(obj.lastTic) 
                t = toc(obj.lastTic);
                obj.lastTic = [];
                
                obj.addTimePoint(t);
            end
        end
        
        function reset(obj)
            obj.lastTic = [];
            obj.tHistory = [];
            obj.hTimePlot.reset();
        end
    end
    
    %% Private methods
    methods (Access = private)
        function addTimePoint(obj,t)
            obj.tHistory = append(obj.tHistory,t,obj.averaging);
            obj.hTimePlot.addTimePoint( mean(obj.tHistory) * 1000 ); % plot in milliseconds
        end
    end
    
    methods (Hidden)
        function changedCallbackInternal(obj,varargin)
            obj.notify('changed');
            
            if ~isempty(obj.changedCallback)
                obj.changedCallback(obj,varargin);
            end
        end
    end
    
    %% Property Getter/Setter
    methods
        function set.visible(obj,val)
            obj.hTimePlot.visible = val;
        end
        
        function val = get.visible(obj)
            val = obj.hTimePlot.visible;
        end
        
        function set.changedCallback(obj,val)
            if isempty(val)
                val = function_handle.empty(0,1);
            else
                validateattributes(val,{'function_handle'},{'scalar'});
            end
            
            obj.changedCallback = val; 
        end
    end
end

function vec = append(vec,v,veclength)
    if isempty(vec)
        vec = v;
    elseif numel(vec) < veclength
        vec(end+1) = v;
    else
        vec = vec(end-veclength+1:end);
        vec = circshift(vec,-1);
        vec(end) = v;
    end
end



%--------------------------------------------------------------------------%
% PerformancePlot.m                                                        %
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