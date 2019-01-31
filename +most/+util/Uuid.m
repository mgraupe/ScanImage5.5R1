classdef Uuid < handle
    % simple class that defines a uuid
    % inherit from this class to uniquley identify objects without relying
    % on equality of handlesw
    
    properties (SetAccess = immutable, Hidden)
        uuiduint64 % string: human readable uuid
        uuid       % uint64: represents the first 8 bytes from the uuid. should still be unique for all practical purposes
    end
    
    methods
        function obj = Uuid()
            [obj.uuiduint64,obj.uuid] = most.util.generateUUIDuint64();
        end
    end
    
    methods (Hidden)
        function tf = isequal(obj,other)
            tf = isa(other,class(obj));
            tf = tf && isequal(size(obj),size(other));
            tf = tf && all(isequal([obj(:).uuiduint64],[other(:).uuiduint64]));
        end
        
        function tf = uuidcmp(obj,other)
            thisclassname = mfilename('class');
            
            if numel(obj)==0 || numel(other)==0
                tf = [];
            elseif isscalar(obj) && iscell(other)
                validationFcn = @(o)isa(o,thisclassname) && isscalar(o) && isvalid(o) && obj.uuidcmp(o);
                tf = cellfun(validationFcn,other);
            else
                assert(isa(other,thisclassname),'Expected input to be a ''%s''',thisclassname);
                assert(numel(obj)==1 || numel(other)==1,'Expected one input to be scalar');
                tf = [obj.uuiduint64] == [other.uuiduint64];
            end
        end
    end    
end



%--------------------------------------------------------------------------%
% Uuid.m                                                                   %
% Copyright © 2018 Vidrio Technologies, LLC                                %
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
