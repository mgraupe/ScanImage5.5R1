%MAXFIG   Maximize a figure
%   MAXFIG(F,1) maximizes the figure window for the figure with handle F
%   MAXFIG(F,0) restores figure F if F is maximized
%
%   Example:
%   If
%       f = figure;
%       surf(peaks)
%   then
%       maxfig(f,1)     maximizes the figure
% 
%   See also MINFIG, FIGSTATE

%--------------------------------------------------------------------------%
% maxfig.m                                                                 %
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