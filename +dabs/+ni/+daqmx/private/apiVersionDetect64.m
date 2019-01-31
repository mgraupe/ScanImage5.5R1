function [methodinfo,structs,enuminfo,ThunkLibName]=apiVersionDetect64
%NIFILE Create structures to define interfaces found in 'NIDAQmx_mod'.

%This function was generated by loadlibrary.m parser version 1.1.6.33 on Tue Sep 13 17:12:57 2011
%perl options:'NIDAQmx_mod.i -outfile=NIfile.m -thunkfile=nicaiu_thunk_pcwin64.c'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival,'thunkname', ival);
MfilePath=fileparts(mfilename('fullpath'));
ThunkLibName=fullfile(MfilePath,'nicaiu_thunk_pcwin64');
% int32 __stdcall DAQmxGetSysNIDAQMajorVersion ( uInt32 * data ); 
fcns.thunkname{fcnNum}='longvoidPtrThunk';fcns.name{fcnNum}='DAQmxGetSysNIDAQMajorVersion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='long'; fcns.RHS{fcnNum}={'ulongPtr'};fcnNum=fcnNum+1;
% int32 __stdcall DAQmxGetSysNIDAQMinorVersion ( uInt32 * data ); 
fcns.thunkname{fcnNum}='longvoidPtrThunk';fcns.name{fcnNum}='DAQmxGetSysNIDAQMinorVersion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='long'; fcns.RHS{fcnNum}={'ulongPtr'};fcnNum=fcnNum+1;
% int32 __stdcall DAQmxGetSysNIDAQUpdateVersion ( uInt32 * data ); 
fcns.thunkname{fcnNum}='longvoidPtrThunk';fcns.name{fcnNum}='DAQmxGetSysNIDAQUpdateVersion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='long'; fcns.RHS{fcnNum}={'ulongPtr'};fcnNum=fcnNum+1;
methodinfo=fcns;


%--------------------------------------------------------------------------%
% apiVersionDetect64.m                                                     %
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