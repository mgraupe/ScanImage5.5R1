function m = str2map(s)
%STR2MAP Convert a string to a containers.Map object
% m = str2map(s)
% 
% The input string s should be in the format generated by map2str.

if isempty(s)
    m = containers.Map;
    return;
else
    s = [s ' | ']; % add last divider to make all key-val pairs identical
end

pat = '([^:|])+:([^|])+|';
toks = regexp(s,pat,'tokens');

keys = cellfun(@(x)strtrim(x{1}),toks,'UniformOutput',false);

% treat keys as numeric if they can all be converted successfully to numeric
numkeys = cellfun(@str2double,keys);
if ~any(isnan(numkeys))
    keys = numkeys;
end 

vals = cellfun(@(x)strtrim(x{2}),toks,'UniformOutput',false);
tfUnencodeable = strcmp(vals,'<unencodeable value>');
vals(tfUnencodeable) = {'[]'};
vals = cellfun(@eval,vals,'UniformOutput',false);

m = containers.Map(keys,vals);

end


%--------------------------------------------------------------------------%
% str2map.m                                                                %
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
